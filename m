Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B084577A83
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 07:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369241.600554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDJWb-0001M7-Ir; Mon, 18 Jul 2022 05:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369241.600554; Mon, 18 Jul 2022 05:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDJWb-0001Il-F6; Mon, 18 Jul 2022 05:42:33 +0000
Received: by outflank-mailman (input) for mailman id 369241;
 Mon, 18 Jul 2022 05:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5Xa=XX=citrix.com=prvs=1918985fc=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oDJWZ-0001If-6C
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 05:42:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672b72b4-065c-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 07:42:27 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 01:42:24 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by MN2PR03MB5342.namprd03.prod.outlook.com (2603:10b6:208:1ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Mon, 18 Jul
 2022 05:42:22 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d%3]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 05:42:22 +0000
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
X-Inumbo-ID: 672b72b4-065c-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658122947;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=dMXNaLEMJxluRIoKEwjzEhx4WVOVK7DjDaTYIy0tRhg=;
  b=AdisXuZohW/C+JiWpBHgir01EYqnljRGfMeHP25IXgcqK3y5O4f2w6yJ
   umiaO4qMPH384+3NxRrQAN6Mc1UpywOqXTEn2rnGpmuc5xxwOg1lyn2ay
   DbVIHusf3tZycidlE3TCKwhnQxL9vh0TuLfllEjKB28o/XvZTW/SVaOWd
   o=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 76007427
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:q+zM2qzsygtTw+A+YYl6t+eqxyrEfRIJ4+MujC+fZmQN5Y8a5oE1v
 iFGDjfXfrrIN3ykOIpG3L7G/UxXupDTytNmTgBv+Cw9Qn9D9ZDPWt+TJ0qpZnLIJJOdHBo+4
 pVCNYGRdZE/Hi6A+0z3bee583J3iajZSOqiA4YoVswJqSpMEU/N3jo/y75RbvdUvOWE7yOxV
 fLa8pLRNVOogDUkbT5E5fzS9kxm5Kv/6WkTsFBgPa8a5QGPy3VNAJwhfqzgdHGQrqu4vwKZq
 0Qv6Jnjows1Kj90UovNfo7TKxFMGPiKVeS3oiI+c7C4hRRfrTAF3K8+Nf4NAW9akDzMlN1qo
 Dl3ncXYpTwBY+udwozxbzECS3skZfIfp+edSZSCmZf7I3PuIiOEL8pGVCnaDaVAks5rDGdH8
 +AvKTxlRnhvUMrvndpX4sE17igSBJGD0LE34xmM/hmAZRoSerjRQr2i2DNt9GxYavaivxrpT
 5FxhTJHNHwsavDUU7sdIMpWcOyA3hETf9DEwb48SGVeD2X7lWRMPLbR3NX9ZNDRHeBsrGWkj
 2fWwD7FATU7LP/O4G/Qmp6srrencSLTfqs3Tef93Ng6xVqZyyoUFQEcUka9rb+hkEmiVtlDK
 ksSvC0zsaw180/tRd74N/G6iCfc4lhABJwNTqtjt17lJqn8um51AkArQzlbZ9FgmNIwQTUy/
 lSIg8noFXpkt7j9pXe1qenM9WzuY3d9wWkqSh1aEBoj2oDfjb5slh3LTdt4L4OKt4igcd336
 3XQxMQkvJ0Rh8MW06Sw/Xjcnimh4JPOS2Yd9gjRG26o8A59TIqkfJCzr0jW6+5aK4SURUXHu
 2IL8+CB6MgeAJfLkzaCKM0RHbSB9/uDdjrGjjZS84IJ8j2s/zupe9BW6TQnfkNxaJ9bJnnuf
 VPZvh5X6NlLJny2YKRrYoW3TcM30aznEtejXffRBjZTXqVMmMa81HkGTSatM6rFySDATYlX1
 U+nTPuR
IronPort-HdrOrdr: A9a23:7PCacqNB+YAkkcBcT23155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHP9OkMQs1NKZMDUO11HYS72KgbGC/9SkIVyHygc/79
 YtT0EdMqyXMbESt6+Tj2eF+pQbsaC6GcuT9IXjJgJWPGVXgtZbnmJE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29JOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6T030Woqqg9jJwPr3PtiEnEESotu9uXvUkZ1S2hkF3nAho0idsrD
 CDmWZnAy050QKtQoj8m2qQ5+Cn6kdg15aq8y7nvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjeseMfpuplWO2zBZPysa6XZcjEBS59L7tUYvGLc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFEgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCvefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzvewPcV
 T6ISdlXEIJCjLT4Je1rex2Gzj2MRaAdCWozN1C7J5kvbC5TKb3MES4OSUTr/c=
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="asc'?scan'208,217";a="76007427"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKQn3EX2kdWIaWgqG3EBToJhnIygrNcoH7WuC4EntoHJ/PQCIWVSffIsFIM5rtaI8xSSL8cmomJzrj20Fk7VLhFyCMqsPsvbBYwlLGJrq6v84Fn6U6rP5uuou5MHb70o6Ot2bA93cZV8SSxEfEfRsQvq/S50raFZP0lAkVv3WFjLqC11VeW7CXDUnrObJyGQQo3zCrtaWQySeKaMFhXhp+f3GZ7M8xox2kkZyZJAYIXNDqqOxIQ4TUE3G0BYjr00Wd/bwoSnLd9JLutvUx16A3kWfQgl2GPNBUJlPCbMjx1QrOldUlDnAQ7mH1k63MWkYZC790ADFP+qf+s8DUDgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV06MbpGMcLYbTL87gpdq9MyUV/jcZP7G81t3heswKk=;
 b=OijuQ4W6kjcG6od6ugYi419TDZ76EAcBiNSS62rawRd1zUe3JKxU4ykbRn77dvweyu2j5EIMcOBNsrH8MKp3JhxnsNgsdUZd7B+ez12y27HzgrhwxwXw7ZmA5wcwd8Ss9KWhyzZVU8EfmY/YgiT2UbfiI+AmoN7UZyOuR2K9VoWsDmj8Gbv8pVsvdq7HHeW54vhfqxnQXXcJkTcSI/ND1cEtNSuMLk86z4bqZ+0L0j1LzIHGaY2BUoPZeqZjH2+9IX6N+hVk252NxL/CUlIoEgz6tQgVnENXWGIG5jc+DsPAGXGqDQ3F7L0CR6E0kilRuC0gdHz82anEWejjDrzZ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV06MbpGMcLYbTL87gpdq9MyUV/jcZP7G81t3heswKk=;
 b=Gw1tUWq2BgmnKZezCjmsm3cJeBXvkcq1EF+c2z3LvHiISoyTDdTFicILHAO1ACG9U/U1mJUmkgeU5Xx4y/CVYtyZ2jA7eUL5NyEAIuGrUoiMLWYHCO3cknalyMLeNDxtcwE3zbcrWQOMEriudxS9r/IFuz1NhL6dt6Rei03TtTo=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 2/2] x86/P2M: allow 2M superpage use for shadowed guests
Thread-Topic: [PATCH 2/2] x86/P2M: allow 2M superpage use for shadowed guests
Thread-Index: AQHX7O/bKX0sOdH9/0aIlntq4rv2Q61gJw0AgAPel4CAIPLIgA==
Date: Mon, 18 Jul 2022 05:42:22 +0000
Message-ID: <85FA3236-5BDA-4387-AEE1-A97D139353EE@citrix.com>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
 <7a80d08b-edd7-43c8-a7ce-42eb85d6f3be@suse.com>
 <8D91423A-67A6-40B3-A3D7-44711DC41A7E@citrix.com>
 <64ff8cc6-6c15-7255-e908-36d7bbbd6348@suse.com>
In-Reply-To: <64ff8cc6-6c15-7255-e908-36d7bbbd6348@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a958d3b3-66c8-4db1-126a-08da6880496b
x-ms-traffictypediagnostic: MN2PR03MB5342:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UqYFNm+rCzYJmZcmiq26hWb5ZFqGxmV9uKN/H2FGMQnD5X2K1ojjZPa/irG1X7t4QVKCMUprB3HrWnqEQD4mGUBQZdi/d5N7g8HO6I1+D3wkAKdt7ITz0O1yFpzurDGH5BmIq3cd77PTd9JQs/297a0fh282XEIcPS1WBRSjWfakWQT8b8hkFuNRSdBUifYpH4eLbb/zgS3KVDav3xUdTv+OeTn8oFVks78tedDihPb6LI31OP8ukbuHN0pFvHySzWpzo925dJowspNZ74mkH76xw4bvW01yoiVKoeZxYCDtkhEHwaJPPlhpLyixtL/bHAt31+0DwnWiElQmM4DIS4WQdyfrbmIFFY9NxOcpZBtHw3lmfkcQJZ2O+O3Yp1Irw/uKWneURNvORjcxAEChrjmpO4yJ7DZUChU+g0LbZ8uZboxddqmpc0P3SbGGzOoDlbML5JFso6pamLMWlV6VlxPAA4waQ9kJcGC4GoodLLJlV86rc89ISKgLXORRLG4aQws8eus6j27C2RfBVoesrZbxALIBOR2QJhzp7ct3slFBkHDRGuZXGxpzs55kquFKoT0FQk6iBzv2KdyVhCbzNATB8QPU2yiIcyfrVlbmZL8BVCa1ujzBzOorLdwRV+1zUMOqlxxiZDxX7czIZBMyxtMFbGKsyv456vNVs1MJbtBzukBXw463ADe7bM1iaPlCgO15MQQURxIKZx9nunCWcWeK0IcAAt2Niht77ELmef+LvW5LgAw2Nigsuusm6sW4C1/+zpX4+QkWZlWDjRJODiQYicrgU7n41kvcJcClsiUuAxRNqayVrw/iLPKgwlhoRJ712leoMREn56Tp8I2GR9qilO1KmQfi17e/Vr0UnAA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(99936003)(66446008)(82960400001)(64756008)(66946007)(8676002)(4326008)(66476007)(91956017)(38100700002)(66556008)(76116006)(5660300002)(2616005)(86362001)(4744005)(83380400001)(478600001)(53546011)(8936002)(186003)(6916009)(6486002)(6506007)(41300700001)(122000001)(316002)(6512007)(54906003)(71200400001)(33656002)(26005)(36756003)(2906002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUlKMEFtOFZpYmJvajhMcFhlMW51azR0TjYyc2MyMW5tV1ZUaGtSNUVBaWNS?=
 =?utf-8?B?WlNSY3h4aEFHczIzaGJjMnd1a1lycnhBR0dkRERtRWIxV3BjUkVQNHhKeWJ2?=
 =?utf-8?B?Ti9XL2NOSE1Gd0J4VzA3U2IwbEQ3SnNLNzNzVkJEVkZCMUtwSmNrVzliUVI4?=
 =?utf-8?B?R2NwdEhZQXNLeUdmK1F3RXA5dFQxeVQ3ZW9BUm1SUG5ZK2ZiRGJuenpHMXh6?=
 =?utf-8?B?TWl5UWJXZERGUzFqZjZMTHJHaEkwNnkxRm52ekdXeGpOelp4RlgwNjJYajAy?=
 =?utf-8?B?djZJckhBczMzMW5LWmJqZ2R5TGJqaVFLZFE2Y1ZuYkJGLy9XVUNqOTEyem92?=
 =?utf-8?B?OVp2aGJKdllGL2tnM09ENWRFbHFhTHFtUGNjVVB1Q3hBNHFld1h4NVQzRVhj?=
 =?utf-8?B?amtiRUt2S2FqOU8yY0tXdnFuZ3hSNEswRXd3d3ZxR2pCUkhUMFhHRWw5TlJ5?=
 =?utf-8?B?MFdQZFpDOU5uYllmeEZTRUhuenkvM0xUVFVhY2VYM3g5V3hvOEhzdmhqV1k1?=
 =?utf-8?B?TSt4WXExbnZaNFlWRnBRRHFVTHppbE42QXhIWC9mdWdwUldldXlQd0hsTUVl?=
 =?utf-8?B?TWluTThWTXA1L2dIVXhSVUxBNDJWcU0zZkdqdjF6eExoS2NZVTJXZUdRMjNH?=
 =?utf-8?B?dzVrSlVacEtoejlVSUh0RHRrNWsyR3RXMGpuYVJLQnJnSWVWYm8vUlc0Y0dK?=
 =?utf-8?B?N3VMUi91QnBvZ1dHK3BIczlIbnZMOGtGeVpDTXlOSUZ3SVd2OFVVNmpWNDlX?=
 =?utf-8?B?TE1pVG55VisrMFVKckEvWDN1L0ZKTlRRQTcwREo5TDkyby85UHJUMVJxRFVD?=
 =?utf-8?B?L3VUaG4yVGVFLzRYUTBjeTZadEJSZ1pGREQ1a2xtb0gxVVB3K3JpMExDNWRt?=
 =?utf-8?B?d3ZiOU92MDN6cXh5eUJURzRncERsSXVseFdXc0hNYWRGYjdNd3JpZGpnVVl3?=
 =?utf-8?B?OGk3QW41eFh6bWNTa05OTFNCb0NKQ2ZreWRlNWlRUHV3cy9HZG1rMkhLeXY2?=
 =?utf-8?B?bU9nSXRrZ0QvM3hiU1AzTVZZamZuVE41aXdmbVFIRGlYYlNSSGJwK3hBZmc2?=
 =?utf-8?B?aW9MU3RZY3BqYXhFY2FnaUhuOXY3dlQwTFREME9vL1owdjA0TW9NZ25Tc2Rq?=
 =?utf-8?B?RTZ6YlNCVWsyUXdWNXpJMmtVdndZcFJZdkpwcDliREs5NHoxcW9HSDUxWVhG?=
 =?utf-8?B?ZDFjSUtnQXhrQzA0OFBMMy9xWGdoa1ovc3BJZzVUVS8ra3dybGNNdWJnSU14?=
 =?utf-8?B?WisxRnNYQzFVRExuUWFhS25UNkJka2lHSlZRNjhiS3dJeUVHbzBQU016NVJr?=
 =?utf-8?B?eEZMSWtJZ05KUEdURk5oalBHZUIvckN0ZG5QajR1alhJTUFWYUJGd3Y1UVU0?=
 =?utf-8?B?MVlZTW1pOXFaNHpyTExXT1JFa1dHcDFjZTh5Tm16NXRwRXF0WTEydnNZa0E3?=
 =?utf-8?B?RmgwdEw2UjJtVThZbDVhcDVkK3pOQVRYTmJzS2pkc3BJalRTRVZIUCtiY05z?=
 =?utf-8?B?U3pEVk5wd3B0Rjd1UHdqWFd3UWsxd2w0ZE1PVkt4ZFJlM2s1cTdubkVuQm5B?=
 =?utf-8?B?YXFnZk5vOElJZlM1V293ZkpCTE4vYmR6cFhwKzZQazRia1lES3ZQUkJGMzhx?=
 =?utf-8?B?Rm9ReFQxQXUzNUhPWm5KRWRCTHRleVFXSVVkd2RYV3dJSTJtbC9HUkdVOEN2?=
 =?utf-8?B?MXlldS9lZHZLOGhUYWNHVkZ4dFBmcU00ZWU2enhodUFBUTdhOHpvVDROcFdq?=
 =?utf-8?B?eTl2U04zZ3JtVmxNcFN4WmJkVGlQeE5rZW5NcEhMTktLcGY0Q051SjFuKzYr?=
 =?utf-8?B?cWVzNXZDbk5RZ21JOE5USGF3T0UzNlBsRlhqSzBFSGRLY2l4U0dWbXV0Uldk?=
 =?utf-8?B?UmJ4WUNKamJTbDM5ejY3RlhrVDFEbHRCc1hieTM4UEdPYjMraXFsL21Fb2Qy?=
 =?utf-8?B?OGJsbko2TGdKblZsOUZWNnFxVE5zWTRIR1NWaXpwbm4vTHFxRHc1ZkFaZjB1?=
 =?utf-8?B?ckVxeEFRTnAwWUI0cmtlbGh3cXBwZUFnMkxCakJsRHVaZUw2Z1paQkFCNG1V?=
 =?utf-8?B?WW9uTk5oZHhHSFlKRVRRbXR0L3A3N01yU2dkTkswOTF3RmF3Z1JHeFB3S2dR?=
 =?utf-8?B?YkhiRDZ1M0oxRTcrWjdlSlZCcWJHR0xMR1FrWTUxL1FScUExMUVad2I5ZXdU?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D7E9DF75-3A62-47B4-BD8C-7471050F269F";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a958d3b3-66c8-4db1-126a-08da6880496b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 05:42:22.3046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FuK78f6Ezz/ZquCl3XZOVrU1/awLEX3ZZdYBQiRme/1Vvf/WNqk6cVnzfn+xhv9ouLeQtFeX3Aag2HiTwTmnpyGjp6M2iY0cO2RQarXolcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5342

--Apple-Mail=_D7E9DF75-3A62-47B4-BD8C-7471050F269F
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EF54E9BD-9A61-4C52-8172-F9FD5E7174E9"


--Apple-Mail=_EF54E9BD-9A61-4C52-8172-F9FD5E7174E9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 27 Jun 2022, at 16:33, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 24.06.2022 21:27, George Dunlap wrote:
>>=20
>>=20
>>> On 9 Dec 2021, at 11:27, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> For guests in shadow mode the P2M table gets used only by software. =
The
>>> only place where it matters whether superpages in the P2M can be =
dealt
>>> with is sh_unshadow_for_p2m_change().
>>=20
>> It=E2=80=99s easy to verify that this patch is doing what it claims =
to do; but whether it=E2=80=99s correct or not depends on the veracity =
of this claim here. Rather than me having to duplicate whatever work you =
did to come to this conclusion, can you briefly explain why it=E2=80=99s =
true in a way that I can easily verify?
>=20
> Would
>=20
> "The table is never made accessible by hardware for address =
translation,
> and the only checks of _PAGE_PSE in P2M entries in shadow code are in
> this function (all others are against guest page table entries)."
>=20
> look sufficient to you?

Sorry for the delay responding to this =E2=80=94 yes, I think this would =
do, thanks.

 -George


--Apple-Mail=_EF54E9BD-9A61-4C52-8172-F9FD5E7174E9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 27 Jun 2022, at 16:33, Jan Beulich &lt;<a =
href=3D"mailto:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 24.06.2022 21:27, George Dunlap wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">On 9 Dec =
2021, at 11:27, Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" =
class=3D"">jbeulich@suse.com</a>&gt; wrote:<br class=3D""><br =
class=3D"">For guests in shadow mode the P2M table gets used only by =
software. The<br class=3D"">only place where it matters whether =
superpages in the P2M can be dealt<br class=3D"">with is =
sh_unshadow_for_p2m_change().<br class=3D""></blockquote><br =
class=3D"">It=E2=80=99s easy to verify that this patch is doing what it =
claims to do; but whether it=E2=80=99s correct or not depends on the =
veracity of this claim here. Rather than me having to duplicate whatever =
work you did to come to this conclusion, can you briefly explain why =
it=E2=80=99s true in a way that I can easily verify?<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Would</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">"The table is never made accessible by hardware for address =
translation,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">and the only checks of _PAGE_PSE in P2M entries in shadow =
code are in</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">this function (all others are against guest page table =
entries)."</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">look sufficient to you?</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>Sorry for =
the delay responding to this =E2=80=94 yes, I think this would do, =
thanks.</div><div><br class=3D""></div><div>&nbsp;-George</div><div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_EF54E9BD-9A61-4C52-8172-F9FD5E7174E9--

--Apple-Mail=_D7E9DF75-3A62-47B4-BD8C-7471050F269F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmLU8r0ACgkQshXHp8eE
G+0gYggAt1Btu4Ku76B5INynwH6SkDgzF73Qf8+MM04Ll5pe5FaqTtoMAR3FFl9X
V1EjihrChWN1nq5Fr5P55AiixiP5DrZ9dhGNXpefBxiLfgXa7wQrL5WTHZRmuAgX
M1ThGZjKuVXZ1A5vLQ8/Kx4HXoZfrMDcYDQWRiG7s4CdjW8IJFTfTVzlt6lSXaIo
Hzozc40l53rmm/e0RQy69F6/vfCWPg1iLH7T2WnfFjbNWTv6BfO5YVFqIvO6mMnF
/gn/vYiQLMOv+5VY3ave0od3ZMV0s5F5+YkhtAWO9Q67f+v5l+lvRgVeNzW0/h0U
Qpy3GydZJh6HaqEpZ7J7YRTYMh/SWg==
=bNt5
-----END PGP SIGNATURE-----

--Apple-Mail=_D7E9DF75-3A62-47B4-BD8C-7471050F269F--

