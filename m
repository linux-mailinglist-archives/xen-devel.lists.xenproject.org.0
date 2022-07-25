Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA17580263
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 18:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374692.606834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0YQ-00068D-5t; Mon, 25 Jul 2022 16:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374692.606834; Mon, 25 Jul 2022 16:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0YQ-000654-2w; Mon, 25 Jul 2022 16:03:34 +0000
Received: by outflank-mailman (input) for mailman id 374692;
 Mon, 25 Jul 2022 16:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htba=X6=citrix.com=prvs=198305c53=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oG0YO-00064y-5M
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 16:03:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52336e2f-0c33-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 18:03:29 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2022 12:03:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5262.namprd03.prod.outlook.com (2603:10b6:208:1e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 16:03:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 16:03:04 +0000
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
X-Inumbo-ID: 52336e2f-0c33-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658765010;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pNMvH64AehGK7iKjyFr51c29wHGMsDTBdiji2K2xWlA=;
  b=DBUnn+TMf6tU1zcyfic2OinVN7+da0EVRkJSgdtdBbjNIRvMgXE8pMmM
   4TYB1MpkK8wGGEi8V6VEXEDpUB+ABaxHdcEhMj/IWdvTob2UzXfSI6R+1
   e3JwSNh2puUOPVU9tj3nT0D3gbNLzx/aX96xozwAi6/BZSqyGax6rfSyQ
   s=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 76370269
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9ZKI9Kl6QEIoWj97yQyaRejo5gy/J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcXjvVPqrcNzbxctogPoXj80sP757QyNdnGQs5qXsxHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk3466v4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2k5Iqo44btJBlhB0
 qMmARw1ZAmnuuy5lefTpulE3qzPLeHNFaZG4zRL6micCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAG7gvK+8Lb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSz32beVw3KTtIQ6DK+y3/Nt3n2ox2FUUAAHVV22q+b+lRvrMz5YA
 wlOksY0loAY+Va3VND7U1udqWSdox8Hc9NKFqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S3iQ67OVpjOaIjUOICkJYipsZQkK+d74u6kokwnCCN1kFcaIYsbdHDjxx
 3WBq3E4jrBK1MoTjfzkoxbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzURhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:3bPdAqMh5podeMBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="76370269"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuyiPnc1IVttW+HyxaL7KXpyAd5ePU2PUk6Jacj8p+CpKdd9OBRfIaNmYkGiPGzuR78bz47lzsLAPkLmf9cT7KCygwKz0cRw0l7i+0W4Lzv1QOw58dveI1Rfh8I5wbtPC5s0G5++ES2rcATkm+DFj6Zx5Kg4CDYw7lE5oAciv5DAfcfJdpUInV/h11WZjFIFLol5QsA/AcalbDMXma1gjMNWbf79veJG3iIozyK/+JGOxOAiNwtlr7hw+5akTDTOqyMajpeTJ4ORMbRl5TorcbNeWrIcOmcMrJRj2xyFisDKNwTGmO3UyzzYlseJXoFCve7wRwLpAZCgNYMVTHLSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNMvH64AehGK7iKjyFr51c29wHGMsDTBdiji2K2xWlA=;
 b=Fg8Ova7gCayvIDklFf3M0Q6NG8qXl3pWayP9cmoNBJzdcRisfSSbh6zIbOBk1MxEwTcRZ7OSxI9F7EvbiNKYe9umpqJFRTthEfqTWKgGC5V8ZTGN0Y72UJrqHApRXYFLO6WxZW2e6nQV/J3fst5hnP//E5R1J8fMkZ7Xoy27rX+8UyOUqHWghybBfDIgkAMsM9jwp3LN/Im2kkmaUSvFuxbrN0Gl6YUu/Fdg7R6RxC39ITTE4vjkW2MoUHn/UBw+IoRUh13u1qhvRkYvy5YF3CQhVduw85yl7dhG09LTSdJ4xtJnlGA6dQpjtt3PZgMm1ZGlAAavuOO88NDUi5ieZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNMvH64AehGK7iKjyFr51c29wHGMsDTBdiji2K2xWlA=;
 b=gqZ9KE4LMtB1donLKIDGmZQub9Q4iDfzeMOmEDHo/H1uJVRz/IZpgy4CTmAadi6ECIuO303Qk0P2LdbUM7U7R9xeng9MWAnUqz7CA8DldrFBZxWExkOMy0uv4qYwQAdSjr7EJNmXqnpQwf6bdkyWQvHuKQ0gaVIaQGSwme1XA80=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Random crash during guest start on x86
Thread-Topic: Random crash during guest start on x86
Thread-Index: AQHYoD5xlH8T1cfPDEKhJmKe7Gw5BK2PP42A
Date: Mon, 25 Jul 2022 16:03:04 +0000
Message-ID: <7ba0f8dc-b495-d83c-4b2b-0b53d8b98ad4@citrix.com>
References: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
In-Reply-To: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ad202c3-5deb-4d20-ebb3-08da6e57284d
x-ms-traffictypediagnostic: MN2PR03MB5262:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9ZfJRiZ1Zw002ExKIdaKNP4VAXnWINAxwmQduLZCMihylBcBsrR9qfUy+1ODEZHeqDPvaZxRG8j3VUzcjPbaZztifzX2urh8UcNLsQp2Ac7zIbtBrbwmdaZnbB8L9sjCGMaX4bCN4YnRDsPRNgcjft/891zGI06bX7LqyuAqXJZmWhjbF1fibVns8hyUSCjEb6BNAhshW26lphaMQiTrrgYAc6JTrv+uZhxA2rUoJqqQ48xcN2Ny5SCiMx1fRnfst/pKz55N3ljsLhGU/QR44xfARaZGENzpNLGQMVWwm+YMcvJT4TXFoeYwOkLDE7eO81vmX8uh+Kb+S8D0mtF241w+3Td3LWQWtTmdpyDnwAxtFqLPjWfy0tSV9ACs3HFc6KzVgsCUKS8Bes5J/wgvRK4BjvuglSqH6WPF3emH1AGDN2ucUtpAHVt/vvCR58vysMXGRr67fOWe4JOyGR6EtutV0IpSb8Jo7MJBJvL04ZH8PXHy4f6GbgQMtpiTfrDUevzieBNIY19FuSTbPfDe70Mltd3YiSnTscJc87mYSRhSEBBcgFlxBTDNu0i4lCxxRIUpwDQdVCy8pbbrUPUOwFsAEp5P2sLiYSX9wZGzD9yjeFeMeSXCrqNdLizorPXYGSYroiciBouPT/9Agr/ql1eHD8e0REcW7ImV/2JahbAYQ6fENhrtztUGD9jhZ/y9V/hldtyx+4Ose3+SnbIFkviz2Y3v9OP6QNv/OsjKFi/133UwY/xqDj7kKxF+6krUwYBfGzDgjByJp0hf+P6dSle6tVT5k6RCnvrrKZdS2g3GezBWEVpAlGPD12iEKUct7aec3/WK1xeaOezfd7VY/G5PkkenRsWEKC7u+gVYn39DT7Wew7Ko0BoSMlNytw81
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(82960400001)(122000001)(36756003)(54906003)(26005)(31686004)(110136005)(66556008)(8676002)(66946007)(66476007)(66446008)(316002)(91956017)(4326008)(38070700005)(76116006)(38100700002)(53546011)(86362001)(6506007)(31696002)(2616005)(8936002)(71200400001)(478600001)(6486002)(41300700001)(5660300002)(64756008)(186003)(83380400001)(6512007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWFzNWtTc3VROHA0Zm45YmZCQktwTGtWOHYzTkNhWDBpZjJzZXRTSXpvQTdu?=
 =?utf-8?B?MEUzSEhVa2JqdUsvOTZvYXo3T2NyUjRqY05ZeWNSdWsrNjhQMjZDOVFpbmdH?=
 =?utf-8?B?Nkh0bXFYcWU2elBTN0x6SHZhNVV5ZlBDOHBIcHhxWnBsN2ZXZjQweVJIOUJs?=
 =?utf-8?B?TlpZRkQxSDBHK05wcFplVG11YzVoYVRCaWxpSlZOK3RPNFJPMC9XdDlMUnRF?=
 =?utf-8?B?NXFhTFZpeEwvZU53R1YxUjBJbmxJdWQzT05LanlOaGY1bVBGeWlNaTZoMXZH?=
 =?utf-8?B?cGpqVGxHb3VTOWxsb21EbjN1cFVHSXpheHdaeTl0QWRTYjZ2ZGwwRmxoSHhN?=
 =?utf-8?B?NTNESEJQV1VtazBMZUhGbFU2cnNqVXZnQUM2dGJnQ0tFWWlteG9qWGdBTVM0?=
 =?utf-8?B?VytKWDBnZlpXdnNySS9YWjVSTFNWZzIrei9IdEUvMFVBQUNoWlgzdm5oeUh3?=
 =?utf-8?B?aXpvaE14UTN0c2ZLcGJ6RWU4U0hUTWY3aWZyVldleGtjclFJUEl5SDRyWkh4?=
 =?utf-8?B?S2VPWlVaTTJ3Qmsyd2ZaSHQ0UXVUY1FrQk1hWjBKU1JEMXJEOERKN1lPY0Yr?=
 =?utf-8?B?OE4vb2Z1THhqSGhocXVRUlZOSk1Nait3MWppNzl2bENMQXZabHJvZWI0aVhJ?=
 =?utf-8?B?UnBldlIyNWowSndBYSs3RFpTYzNhR3krYmUyekZLV0hHamc1RnVRTnVVNmFh?=
 =?utf-8?B?M291aThJTnl3RlRDdkpPTFp0MndSUXBjcEMvQVl0VWMrOXBONnZPZTJzMmlh?=
 =?utf-8?B?Rm1waUhsOEJuY2NhdHlqb3hTY0tHYzAxa0IrUjhvZEpuR1ljSUdCalBVM0JZ?=
 =?utf-8?B?cVAwaitJM2dvSWdBU2YrQnhjbzk0c1Q0M0JMZFp6TW9Yd1FQVEIySUxpK3Iy?=
 =?utf-8?B?cEtoSzkrMlVyaHN2RnZLdEtFVEpUdjFZOGpua1MxaFlDYWU1TXZ2Zy9RZXp2?=
 =?utf-8?B?bHdXaEsxZ3c1VG91MFVBK21pbDNYb2FjYlp2bXVnWDEzcmE3bDdKazZwTGdS?=
 =?utf-8?B?VnJ4MGpzMHVKN2hpWWZXY3ZLWnhBWmc2OXJTdGJIeS9LT1gxbm41cktvYjRh?=
 =?utf-8?B?Mm1QUTA4a0ZBNDBmQWJzbDlHQ05JcWRHYlBEamRiSW5OYUJ3eTFJTHFrazB6?=
 =?utf-8?B?ZTdaMlBpVkdmdWZKSTZXNStEcmtYWGFDYlRPc2t3R2hMNUh1ckZPb1hmVWJV?=
 =?utf-8?B?RFJuZjNLYXdaeXhzd2JOR1c2TmNHRDZ5akJwa2VRSm1VOFBpa0pjYm5CWm9F?=
 =?utf-8?B?UXRnU1I5L2FpVWpSMXZ6R2diOExObStYRmhGUDl4K0JDclBGdzBWTy80TVZ0?=
 =?utf-8?B?TytGTHBLYVBhUXNUZEo3QlY0SWVWbllEMmtIdHlEMGZtUjdwUUMvS2gxZ0Zs?=
 =?utf-8?B?UFptL0VsUnVpbUFBQ2FMUC90OVBRMDNKUnpuVlJOQjh2RUN4bnVlS09pS09v?=
 =?utf-8?B?SUpvT3J2cU5tbzNLTmZPK0JNRVFIYlBaQTRFWUNvY1pIZmpra0xBOHkwa0hQ?=
 =?utf-8?B?bEZCV3ZwNnJMVnZ2YWR4ZXRKNThuaTNQcHpNZnRONUZ5NVJaMTA1c3BZdGtv?=
 =?utf-8?B?UFhlZGZZajZrRGp6NGNESmM0VHJ4dnBQcFV6enBKdHpUS0pJQWc2SGNLWnJG?=
 =?utf-8?B?ck9nNUlSanMrSW9wRTJ5eEpzbnRxZDV2YWZadVVZYVpic2tPczRrK0QzM1Nn?=
 =?utf-8?B?VERpTmZ2SVp5UVBJc211djFxbEE2WUpNd1AvUXUxK2F6QW1qVFBIcEpEeEFY?=
 =?utf-8?B?dHVueXZQVkJhazdOK1FienRySHNNZGh4TjNnakl3bkE3VENYc05zS05NdmZy?=
 =?utf-8?B?Y3BYanR5WVBuU2JETTd0eHJURmdpeEhsbEZmWUdnWWlVNzJJZ3NSUWxNRnUw?=
 =?utf-8?B?VTZGRnlrYkRoaVkwV0E3WVdEY2ljQjh3SEk1eVhOalRhcGhFVE1hSS84N0JJ?=
 =?utf-8?B?ZlNBWk9RUGYvNEZKUC9jSUhDNVUwZks1WkEvb0xBbWV6OWdFVHE3SUl6dVFC?=
 =?utf-8?B?dEd2MlNHRlVFT1Nva3R5cmZua3NtNXM2d2lmN3NGckZ5MlE5cU9nQW92a2Fv?=
 =?utf-8?B?UXBxUXBwZ29JaWozdVBGMzc3SmFuNHYvSlFKeklmcHdIT29DSkpzVWpyMmdL?=
 =?utf-8?Q?z2ZmAgg6NUHRyGEq6O79IZf2C?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <302D9C7C6C63824DBFF0A605F9FF2632@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad202c3-5deb-4d20-ebb3-08da6e57284d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 16:03:04.3595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +QNGkhZSSA1de6JCrLnir9f2oHxEE27a47RCTSLeTubTsXiXscstKmYjJiEwMyIHd76P0NY1QQipsES/GaOg1ycTuiRzGr8fV9tTQIPD6iM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5262

T24gMjUvMDcvMjAyMiAxNjo1MSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4gSGksDQo+DQo+
IE9uIG91ciBDSSB3ZSBoYXZlIHJhbmRvbWx5IGEgY3Jhc2ggZHVyaW5nIGd1ZXN0IGJvb3Qgb24g
eDg2Lg0KPg0KPiBXZSBhcmUgcnVubmluZyBvbiBxZW11IHg4Nl82NCB1c2luZyBYZW4gc3RhZ2lu
Zy4NCj4gVGhlIGNyYXNoIGlzIGhhcHBlbmluZyByYW5kb21seSAoc29tZXRoaW5nIGxpa2UgMSBv
dXQgb2YgMjAgdGltZXMpLg0KPg0KPiBUaGlzIGlzIGFsd2F5cyBoYXBwZW5pbmcgb24gdGhlIGZp
cnN0IGd1ZXN0IHdlIHN0YXJ0LCB3ZSBuZXZlciBnb3QgaXQgYWZ0ZXIgZmlyc3QgZ3Vlc3Qgd2Fz
IHN1Y2Nlc3NmdWxseSBzdGFydGVkLg0KPg0KPiBQbGVhc2UgdGVsbCBtZSBpZiB5b3UgbmVlZCBh
bnkgb3RoZXIgaW5mby4NCj4NCj4gSGVyZSBpcyB0aGUgZ3Vlc3Qga2VybmVsIGxvZzoNCj4gPHNu
aXA+DQo+IFsgICAgMC4wMDAwMDBdIEh5cGVydmlzb3IgZGV0ZWN0ZWQ6IFhlbiBQVg0KPiA8c25p
cD4NCj4gWyAgICA2LjY3OTAyMF0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBtYXliZSBmb3Ig
YWRkcmVzcyAweDg4MDA6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBOT1BUSQ0KPiBbICAgIDYuNjc5
MDIwXSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA1LjE3LjYgIzEN
Cj4gWyAgICA2LjY3OTAyMF0gUklQOiBlMDMwOmVycm9yX2VudHJ5KzB4YWYvMHhlMA0KPiBbICAg
IDYuNjc5MDIwXSBDb2RlOiAyOSA4OSBjOCA0OCAzOSA4NCAyNCA4OCAwMCAwMCAwMCA3NCAxNSA0
OCA4MSBiYyAyNCA4OCAwMCAwMCAwMCA2MyAxMCBlMCA4MSA3NSAwMyAwZiAwMSBmOCA5MCA5MCA5
MCBjMyA0OCA4OSA4YyAyNCA4OCAwMCAwMCAwMCA8MGY+IDAxIGY4IDkwIDkwIDkwIGViIDExIDBm
IDIwIGQ4IDkwIDkwIDkwIDkwIDkwIDQ4IDI1IGZmIGU3IGZmIGZmDQo+IFsgICAgNi42NzkwMjBd
IFJTUDogZTAyYjpmZmZmZmZmZjgyODAzYTkwIEVGTEFHUzogMDAwMDAwNDYNCj4gWyAgICA2LjY3
OTAyMF0gUkFYOiAwMDAwMDAwMDAwMDA4ODAwIFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6IGZm
ZmZmZmZmODFlMDBmYTcNCj4gWyAgICA2LjY3OTAyMF0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJT
STogZmZmZmZmZmY4MWUwMDlmOCBSREk6IDAwMDAwMDAwMDAwMDAwZWINCj4gWyAgICA2LjY3OTAy
MF0gUkJQOiAwMDAwMDAwMDAwMDAwMDAwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAw
MDAwMDAwMDAwMDANCj4gWyAgICA2LjY3OTAyMF0gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTog
MDAwMDAwMDAwMDAwMDAwMCBSMTI6IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAgICA2LjY3OTAyMF0g
UjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6IDAwMDAwMDAw
MDAwMDAwMDANCj4gWyAgICA2LjY3OTAyMF0gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdT
OmZmZmY4ODgwMWYyMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgIDYu
Njc5MDIwXSBDUzogIDEwMDAwZTAzMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAw
NTAwMzMNCj4gWyAgICA2LjY3OTAyMF0gQ1IyOiAwMDAwMDAwMDAwMDAwMDAwIENSMzogMDAwMDAw
MDAwMjgwYzAwMCBDUjQ6IDAwMDAwMDAwMDAwNTA2NjANCj4gWyAgICA2LjY3OTAyMF0gQ2FsbCBU
cmFjZToNCj4gWyAgICA2LjY3OTAyMF0gIDxUQVNLPg0KPg0KDQowZiAwMSBmOCBpcyBTV0FQR1MN
Cg0KVGhpcyBpcyBhIHByaXZpbGVnZWQgaW5zdHJ1Y3Rpb24sIGFuZCBoYXMgbmV2ZXIgYmVlbiBw
ZXJtaXR0ZWQgdW5kZXIgWGVuDQpQVi7CoCBUaGlzIHNob3VsZCBoYXZlIGJlZW4gZXhjbHVkZWQg
YnkgcHZvcHMuDQoNClRoaXMgaXMgYSBMaW51eCBidWcsIG5vdCBhIFhlbiBidWcuDQoNCkkgY2Fu
J3QgZXhwbGFpbiB3aHkgeW91J3JlIG9ubHkgc2VlaW5nIGl0IGludGVybWl0dGVudGx5LsKgIFBl
cmhhcHMNCmVycm9yX2VudHJ5IGlzIGJyb2tlbiBieSBkZWZhdWx0LCBhbmQgcHZvcHMgZml4ZXMg
dGhpbmdzIHVwLCBidXQgYW4NCmVycm9yIGVhcmx5IGVub3VnaCB0YWtlcyBhIG5vbi1maXhlZC11
cCBwYXRoIDotLw0KDQp+QW5kcmV3DQo=

