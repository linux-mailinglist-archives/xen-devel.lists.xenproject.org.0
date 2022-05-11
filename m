Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45B5232B9
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 14:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326780.549410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolBZ-00055j-B6; Wed, 11 May 2022 12:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326780.549410; Wed, 11 May 2022 12:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolBZ-00053A-8J; Wed, 11 May 2022 12:11:21 +0000
Received: by outflank-mailman (input) for mailman id 326780;
 Wed, 11 May 2022 12:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sF/b=VT=citrix.com=prvs=123118215=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nolBW-000533-Nz
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 12:11:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7402aaca-d123-11ec-a406-831a346695d4;
 Wed, 11 May 2022 14:11:15 +0200 (CEST)
Received: from mail-dm3nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 08:11:13 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by CY4PR03MB3240.namprd03.prod.outlook.com (2603:10b6:910:5b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 12:11:10 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%6]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 12:11:10 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7402aaca-d123-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652271075;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=yyaq47ym0IrC1kxWgarnWjcd3rUQg8XRgrh0gxXZqOw=;
  b=TPt3fCQBvznfcTL0zXrWS56TSCoWybpi1QSWUJtuPCjKCOWDr1aL9EY2
   yydhcME38hAJUwLk0uz3J9F2SQ5wVen2buwuR7g6HOuGVgp+2VEL1TARD
   rhr9drEOdDG52ENmN0lXJB8iqmKxCSLTp4DK+AFqlx1w8QZ+A/yFrenIZ
   c=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 70450573
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:h0t/Eat5XhiuqYKxbOIAL0XyyefnVN9fMUV32f8akzHdYApBs4E2e
 1ou7Vv2eabdPDOxPpsjdtz1pnqyiubUnINiHgRq+ygyHn4apZPPCI/Ddxr6ZSicIJSeHBxtt
 J1EYdKRdZ1qFXaD/hmjbbS7pHMk3v7VHLetBOSaYS4oLeMIpF/NrDo68wJuqtI40bBVej+wh
 O4eg/EzGXf+0DMsPj5I5f6N+Roy466psmwS5g03P6tCslaDxiFEVMNDKfm9IUWjT9gPFIZWZ
 QpiIJJVXI/9101wYj9wuu+jKiXmepaLYU7WzCA+t5GK2nCunARrukoAHKdaOB4/ZwmhxYgrk
 o0Q7MXoE2/FA4WX8Agje0gAe81BFfUuFI/veRBTZuTKkiUq21O1qxlfJBle0b8wo46bMkkXn
 RAsExgfbwjrug6D6OnTpt+AJCgUBJKD0Is34hmMxNxCZBosacirr67ivbe00Nqs7yzn8Dm3i
 8cxMFJSgBr8jxJnHg4WMrg5s+SRliOgdzJ9pAOF5odp7D2GpOBx+OCF3Nv9XPWvHZ8QsmPD4
 2XM8iL+Hw0QM8GZxXyd6HWwi+TTnCT9HoUPCLm/8f0si1qWroARIEROCR3n/r/k1AjiB7qzK
 GRNksYqhYc/81akQ5/RQhu8qWastR8AQdtAVeY97Wlhz4KLu1rEXjVbFVatbvQ3iOIIHm0nx
 GOusP/RFAdrk4eEc1m0o+L8QTSafHJ9wXU5TS0ZSQoI5fHzrYd1iQjAJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3EjoPSUgc/6wHTX2SkxgB0foioY8qv81ezxfRKIZudT1KBl
 GMZgMXY5+cLZbmSkASdTeNLG6umj8tpKxXZiF9rWpUkrDKk/ib8eZgKuG0iYkB0LswDZDnlJ
 lfJvh9c74NSO33sarJrZ4W2CIIhyq2I+cnZa804p+FmOvBZHDJrNgk3DaJM9wgBSHQRrJw=
IronPort-HdrOrdr: A9a23:tjOMt6O/3gAiysBcT23155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHP9OkMQs1NKZMDUO11HYS72KgbGC/9SkIVyHygc/79
 YtT0EdMqyXMbESt6+Tj2eF+pQbsaC6GcuT9IXjJgJWPGVXgtZbnmJE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29JOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6T030Woqqg9jJwPr3PtiEnEESotu9uXvUkZ1S2hkF3nAho0idsrD
 CDmWZnAy050QKtQoj8m2qQ5+Cn6kdg15aq8y7nvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjeseMftR9B6NmOQgeisa4HZcm0BS2NL7TkYvI7c2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFEgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCvefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzvewPcV
 T6ISdlXEIJCjLT4Je1rex2Gzj2MRaAdCWozN1C7J5kvbC5TKb3MES4OSUTr/c=
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="asc'?scan'208";a="70450573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsbPoRG7/VnQapjb6KjcflAa/UdzyVMZQX933MKDmqYph+FwnBVSeHIEZIsN6a0V29YrtMs1DLqSPaZw+lVBq8ewcC1r/Qrm3e1xetnapAoMH9Sx5EtJW/Fqb3xkUYPNRCcu9e7pBONK8IQjphu/kgLu7BDVBM81Akr6ESHmkJ66pFzaMzLR0o4cr0gib1iDGd8KcE+Njfg5W8CDQAuujR2MzcEot07xUF/AiB8EG5MYWz8xbEPqICEV7G/xRJ3/FpZmN+w5dVsU8iawHN9Yy2I7rmtGLXvdsAoNxv2sWCXSAMPETeEGF9Hy5SUoHkXGX5HM0V5Xfzn61V/61CcexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PEAGvmT1r8JHE4bBsqndB0/XJo3mx34/Ko/BlcG3Uc=;
 b=g1yChLrVXhH0pG1tB57M4omxdGCBQJBPFWcjheWsDOIx6H4c5J0TSukxx6w/fu2MsRBOvtXjaJ22KHpAxAgpXp5kCfsq2h+nqmLueH0rPcKUpHIo7K/9KYxjxn1yDU+2W5ioyy1JIjgH5Dwbzk4Jzmy1XopKRXTLCxcTD3zPWy34EL4gSYMe3t8YcjGQ7KC5TfsLDrHBPa2YHH9VxK1XucgmnIdLH3OmVHSnZYEFMy7RCvf4NaYe3oxsL+wv8jwdU+uSQpht5a65GZmWWk2kRGmqYTJlLkhDmlzE7cWZD+V5Ifep/U5qrIiJyK0YUGQ7i3fvTiQqTzYYZMcdhWEIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PEAGvmT1r8JHE4bBsqndB0/XJo3mx34/Ko/BlcG3Uc=;
 b=skMpF5l5czqgSRM6f/KnYfUP6w5bIsirFjQsiPooIxn25cqtPerklu/9adtIVbG9p6Y1R6AYVGwf1vshEgB2S608wmZMmIkBdoCOjhCcneqJA8D7K06gPzXmpMKRsBM72ijwAFIkPmdX4SXGjOqTFeKvvshZZTTdqHSmkd5V7lo=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: =?utf-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Topic: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Index: AQHYZFbwaRkB21bteEenSH2F95dix60X7v0AgAFJfgCAACKyAIAAPIqA
Date: Wed, 11 May 2022 12:11:10 +0000
Message-ID: <6F5998A0-636F-4AFC-847D-F0CFAC5B624E@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <SJ0PR03MB5405E449B19691A916EA3FE79DC89@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <82e54293-926e-b7ee-7091-a85a9db8f6c5@xen.org>
In-Reply-To: <82e54293-926e-b7ee-7091-a85a9db8f6c5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45895fd3-dca8-4996-1795-08da33475601
x-ms-traffictypediagnostic: CY4PR03MB3240:EE_
x-microsoft-antispam-prvs:
 <CY4PR03MB324020BD65E67DC46D4EDB4499C89@CY4PR03MB3240.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SpZwhT74lOfBfV4SCYk7rA1gLpFqdX0NpnftY1ZDtN07GJ5r1glzFMpma00kZrw/fVDeOLREp/NqQ+czm/H2H1e1ARnFECh/er30UF5aSZF+cAxrt8R0gAKQYOq7Y2fIeTG58LHiMGiXqKYFv0hctBVeb6/3fKUt/BO0AoUDPFtPPxlTZsWOP7t6zgJueSTXhcozizFL8Utgi8uY0YZxH2ijj8s0QOUgFFCUZh/Mcff1oKs2oSltVxEAPu+iMUSoAVEXGSN6FCvN5DNWiEVfbB0Lmes0UQFGzTEZxubb1n0iAS3MXFS2vhARLY7Npoy8w9La/dcjfN5l0/Ofm3CJ48lHp05xQw/AB6bSxxyzS4uRqpA6S3o0fDfm+xyUP2T7i4mBdVQh35M7Dke4Uz8k0jrgEAFazkgtBTbfY9WTMdUqR6QSFV7hCutycUBsndsW+T8f4vFuJSKHrprajqfJ0Ut3ZiEzsxs88G0fsdK0E37qyv9E/4bv0l8BQ1cosBqwEtKg/4nDCN/KldXOZK6qP3HzE6NHDwc9f1Cvav2FmI80gEWPoCwAnqpOg0JiAnjxk7up8rVH1QulcZbqXXNymmcpnZmG0+HJoElzjyCVPBJ2CQNGwjwMpVCKX3L/pcB36j0zBfBTE+QKcq+IjhvY5mNk7K/1Tlixdo43RdepmEa2bRyzTBT4hMqn/IXnSydFP53IqPhyTNZVlE2ICqRMP/TSWlbIz2RsyTqZtFLvIszO7ezWxq5XBUKiF/7QpKss2giULDFqZ8uMuJ/6E7qFbrj1kiodl3y5zQ5oq6jAcFogwkxwQa9AMqkxGWIvsIj8cs5NT0ovZSPX6UHmuKDBBw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(53546011)(64756008)(6512007)(5660300002)(99936003)(38070700005)(83380400001)(36756003)(966005)(71200400001)(508600001)(26005)(6486002)(33656002)(4326008)(86362001)(2616005)(2906002)(316002)(54906003)(6916009)(38100700002)(186003)(82960400001)(122000001)(76116006)(91956017)(8936002)(66446008)(66476007)(66556008)(66946007)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFB5ck9DaWgyQUcxTTdnMnUyTzRTS0t3bU16a29UZ0h2c3lGY2hHd0VqaHU4?=
 =?utf-8?B?U1N4d2dCaFRhaVdqVElxdFJiVHBPVFUra0VXSFpyL2UzZWU3NFdzdkdCK3Vu?=
 =?utf-8?B?NGNOQzVlMktBZmdtWnZSK2ZobnFrMEtGOU5ubWdBb2FzQWN3N0QzcTRWckdE?=
 =?utf-8?B?ZTNvL3o3akVCNDhTK1RkbE5GbnhIZ0lqOFg5aHYrVXpJK1VxMkp0S2VoQmJ4?=
 =?utf-8?B?N01aL3FHWXpvVjl1VzZMQkdJY0pNcWM4a0hDRndaRVR2ZHZRbGd1MWxGbHl5?=
 =?utf-8?B?d3k1NXUzclEycCt2QXN0aVVyNTErRTQvNXhlaks4RWNKaVE0R0JaQ1ExYm1o?=
 =?utf-8?B?bEpEMjhlMnlrTCtqM1V4SHB0aUQ5Q2dlekdoSW93M3FFdHJpU2hBV2o4emhq?=
 =?utf-8?B?QmFZeHg5czhZVU1MTjNsd09DZWxKbU1aZDV2QnhpYmZGaUFnblhKQmFLVEJ3?=
 =?utf-8?B?WjZNRW43WEEreTlwckdvVnB6Y2pweXRIV004dEtYRm1yS3RGWkF5V0pEZGJT?=
 =?utf-8?B?cXdzRDZtZ2tuYWpob1AvZ2g5aUxxZnl5Y2JoOXJJZ0hPK0hhVFFyZHJPVUlI?=
 =?utf-8?B?emU5aC9LZFJxUWhFU2tmd0pRVmdnKzR4citHTzlETHJRNk8ydnRUWmdjbEk2?=
 =?utf-8?B?blltZlkxVmhyTzM1NlJJNE5rb0dMdVBrWmtsTHBVbUd3d2VIMFM0ZVBWckox?=
 =?utf-8?B?K2YyQ2RyWHZzWnVLM3hMUXVzbUoyY3R0YllRbkpBU215WTAzVWswNzBZTGQ3?=
 =?utf-8?B?emVEQ1pSa2RVSTRvOTFpWG9RSFVwV0FUN3QzRDNFSUNBVFdvMk01dmw0YTJO?=
 =?utf-8?B?SDk0T2pjc0xJY29DYzZtVUZ1dXVMQUdxSVNKdTJINDg5Z1RnU1dqMi9mcW1j?=
 =?utf-8?B?aHZoWVNHS3dkTWpnWnE3WVdWZGhzSTlpV1Q0Uml3bkVid1FWSkZLNjh1QXA0?=
 =?utf-8?B?Vk94eEhiNy95RXhpbzY2S3RLRlBCRmZycGhYOC9YUTlTbVhUZnhvS2ZldlFx?=
 =?utf-8?B?MjB6a2xoMXRNZmJIeitZUlZlUXNrMG5iblJRNjJxOGZaMU1FdnJvcW9Tc2RJ?=
 =?utf-8?B?cmtBcFFEOFFxMXlPUllxOGtWWTVnTlMzK0J5aHN0MXptaU9Fcm5qcEFqQ3I2?=
 =?utf-8?B?SjR6RVlDT1UwSk5qK1k3NG1JMXRsM2VVbHExNDNLU0lhd0ZER1d2c1VHdkoy?=
 =?utf-8?B?dUZGcmt4V05yOWlmWXllT2FsTlZuM3N1Zm5RSWw2aCs2SmdCK1NMNnF5bzlP?=
 =?utf-8?B?Y2FoNnpMbkVoaU1tN1hjRU1oYjZTUHRUbHRFRTkyaVlSWWE0QkpIRWJBS1VX?=
 =?utf-8?B?SkI5TjU3ZTRJS2RpdytmV1lhWHk1Nkc4bkVsaGpBTUNrTnM0Y0diS0lHcEht?=
 =?utf-8?B?OEFtWU9PNnhta1o0c2h6ODIra0xPY3VrY0xUS0ZuUEwzUU5CMmVXYWVGRG54?=
 =?utf-8?B?YUd1L2J1VFhOenZwZFNpUmdoTjgxcWJjRVR3U0xtUnBOVGlvN08ycjlqSVFW?=
 =?utf-8?B?OXRpZzYwZm15SnpYNjBKcUo5dVB5bi9DU1NzSTBDUlZVSHlxd2xaTnRXZ082?=
 =?utf-8?B?S1FmYW1rTWZlNlBXSU9VT2RkNmRma2NEVUVkYlpadDhENGp5NVU1MFo0MTh6?=
 =?utf-8?B?YTlwQ3NIQVFYQ0ZMZXpzUEtpQWpoL0NTN0M1WlF2QnpDZGVNV2FFM3JZcVhv?=
 =?utf-8?B?NW9EUEhnTktRU1d0YWVkKzJJeC9ZWmExZnJPUEluRkhzalJkbW0ya0c1MGQx?=
 =?utf-8?B?SGFDTTJUdnZDS0d1VG9KczErTVVac0xZUk1RMHpOdGJrVmxhaVdnbTNWTUxx?=
 =?utf-8?B?TXhNZ0JOK1dzNSswN2V2R3NueVNoNkd5T2RlN1JGZVZyMlZXTE1mMEtieWMv?=
 =?utf-8?B?dGtHZ2JmTWlJck9wYjAxQTMrRkptdDRDRFkzamZaT24xVWw0cEFLdi9qNHFa?=
 =?utf-8?B?cnN6aUdjNkc2OVdsOG8vOTgvaDQxYStkUDlXdXBncDVKZVRrLy9zalpBMEJ0?=
 =?utf-8?B?SUNkTGNpcFc4ZEltYzZQMFRxaVBSa0ZTa2NHWkgyS05PUUtnbmNMTkV3R3dN?=
 =?utf-8?B?TEpNTGcxS1VqNk1hVEtvZUllRU9HMSs5RUZ2MFRSTVgxbnFwdlg1bWFwM3g5?=
 =?utf-8?B?SUpnNkVHblpVRVVTQlhTeCtpYmpIVmhvUmF4VENNQ0hTUXpkdUtpaHlwSlZn?=
 =?utf-8?B?anA5am9GUkRZOWFsNjhDS1BDNE9MemtXSTM5M0ZpMzNFQlVqMUN5eXRzVXVZ?=
 =?utf-8?B?d0V5Y3NwdS8rK3RxUnU2cURMY2I3b3ZPRVNlRXp2eGprUVM3b056V283cGJz?=
 =?utf-8?B?YnNYczRqWndKMU5LWnE2cDYzT25OcERWeXNLUXN4SXZkRXh2b2JGRHljbkdC?=
 =?utf-8?Q?8JQiE8akAFrgt5Vw=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_11552911-C933-4D79-8517-C295F3A11C8E";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45895fd3-dca8-4996-1795-08da33475601
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 12:11:10.4484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTgGgrcQ+LQzHnc73pM6uO3XnbUGkrYAx25Y5JK1luhdQZFIzVfjPtI5SN5p5xaegKS7D39TXpX5juaq76m7ZAEIPN3p9MW3GIL9s2/ED4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3240

--Apple-Mail=_11552911-C933-4D79-8517-C295F3A11C8E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 11, 2022, at 9:34 AM, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> Please configure your e-mail client to send in plain text.
>=20
> On 11/05/2022 07:30, Lin Liu =EF=BC=88=E5=88=98=E6=9E=97=EF=BC=89 =
wrote:
>> Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
>> On 10/05/2022 11:15, Lin Liu wrote:
>>> Update to use byteswap to swap bytes.
>>>=20
>>> No functional change.
>>>=20
>>> Signed-off-by: Lin Liu <lin.liu@citrix.com>
>>> ---
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: Julien Grall <julien@xen.org>
>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Cc: George Dunlap <george.dunlap@citrix.com>
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> Cc: Wei Liu <wl@xen.org>
>>> Changes in v3:
>>> - Update xen/common/device_tree.c to use be32_to_cpu
>>> - Keep const in type cast in unaligned.h
>>> ---
>>>   xen/common/device_tree.c           | 44 =
+++++++++++++++---------------
>>>   xen/common/libelf/libelf-private.h |  6 ++--
>>>   xen/common/xz/private.h            |  2 +-
>>>   xen/include/xen/unaligned.h        | 24 ++++++++--------
>>>   4 files changed, 38 insertions(+), 38 deletions(-)
>>>=20
>>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>>> index 4aae281e89..70d3be3be6 100644
>>> --- a/xen/common/device_tree.c
>>> +++ b/xen/common/device_tree.c
>>> @@ -171,7 +171,7 @@ bool_t dt_property_read_u32(const struct =
dt_device_node *np,
>>>       if ( !val || len < sizeof(*out_value) )
>>>           return 0;
>>>=20
>>> -    *out_value =3D be32_to_cpup(val);
>>> +    *out_value =3D be32_to_cpu(*val);
>>> This code has been taken from Linux and I would rather prefer to =
keep
>>> the *cpup* helpers to avoid any changes when backporting.
>>> diff --git a/xen/include/xen/unaligned.h =
b/xen/include/xen/unaligned.h
>>> index 0a2b16d05d..16b2e6f5f0 100644
>>> --- a/xen/include/xen/unaligned.h
>>> +++ b/xen/include/xen/unaligned.h
>>> @@ -20,62 +20,62 @@
>>>=20
>>>   static inline uint16_t get_unaligned_be16(const void *p)
>>>   {
>>> -     return be16_to_cpup(p);
>>> +     return be16_to_cpu(*(const uint16_t *)p)
>>> I haven't checked the existing implementation of be16_to_cpup().
>>> However, this new approach would allow the compiler to use a single =
load
>>> instruction to read the 16-bit value from memory. So this change may
>>> break on platform where unaligned access is forbidden (such as =
arm32).
>>>   }
>>>=20
>>>   static inline void put_unaligned_be16(uint16_t val, void *p)
>>>   {
>>> -     *(__force __be16*)p =3D cpu_to_be16(val);
>>> +     *(__be16 *)p =3D cpu_to_be16(val);
>>>> Why did you drop the __force?
>> Google told me __force is used in linux kernel to suppress warning in =
sparse,
>> =
https://stackoverflow.com/questions/53120610/what-does-the-attribute-force=
-do
>> Is sparse also used in xen?
>=20
> I am not aware of any use of Sparse in Xen, but it would technically =
be possible.
>=20
> However, my point here is more that this change seems to be unrelated =
to what the patch is meant to do (i.e. switching to byteswap). So if it =
is unnecessary, then it should be dropped from this patch.

I think making people pull little changes like this out into separate =
patches is asking too much.  It=E2=80=99s a lot of extra effort on the =
part of the submitter for basically no value.  We commonly do little =
clean-ups like this in patches, and just require a comment at the =
bottom, like this:

8<=E2=80=94

While here:
- Drop =E2=80=98_force=E2=80=99 keyword, which is only needed when =
running the Sparse analysis tool

=E2=80=94>8

I do agree that minor changes like this need to be described, so that =
people 5 years from now have some hope of figuring out what=E2=80=99s =
going on.

 -George

--Apple-Mail=_11552911-C933-4D79-8517-C295F3A11C8E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJ7p90ACgkQshXHp8eE
G+0xMgf8CJvnQNDl2H/W9hMGUaRQWC3orwUyUdjGPbPIDTdFOgt45C5mqXrDrt/1
SpVRGvxzlNflHN/P6ZeHo2uNIwA9znCYO08vE7mi8ZH5OUJDOImGPZWW6QfrvDOQ
3eh1yfp7C3D9+6dFwzzh+KcLQesDZll7PaMku6YSlLU6sdr3wFQ8YMeZk2GV1rSj
bCL564hw3xq3ZA9eFie7Zn5+Dwt5CqOzVvJPPEhS4Gb5qy+dgwSAu/qTTLK7CdpS
Y0Z/e5Oa353mBZZEckvfaou9no4SjfW2n/j8HiErsoP9jImb5517s5YbMutMAXvq
65i6gUIMDXeOVUQIstWnBYQYpZd+Kw==
=COAa
-----END PGP SIGNATURE-----

--Apple-Mail=_11552911-C933-4D79-8517-C295F3A11C8E--

