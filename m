Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99550389DEC
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 08:29:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130620.244557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljcBV-0001nV-KS; Thu, 20 May 2021 06:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130620.244557; Thu, 20 May 2021 06:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljcBV-0001lE-Gm; Thu, 20 May 2021 06:29:29 +0000
Received: by outflank-mailman (input) for mailman id 130620;
 Thu, 20 May 2021 06:29:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yP7T=KP=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljcBT-0001l8-Ob
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 06:29:27 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6cec95a-9ea4-4d64-a2b5-84eb979a19cb;
 Thu, 20 May 2021 06:29:24 +0000 (UTC)
Received: from AM5PR0601CA0056.eurprd06.prod.outlook.com (2603:10a6:206::21)
 by PAXPR08MB6720.eurprd08.prod.outlook.com (2603:10a6:102:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 06:29:22 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::b6) by AM5PR0601CA0056.outlook.office365.com
 (2603:10a6:206::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 06:29:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 20 May 2021 06:29:22 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Thu, 20 May 2021 06:29:21 +0000
Received: from e69d7be52dcb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 39EC3DAE-0BEC-49F8-A151-BEC2027BFD9E.1; 
 Thu, 20 May 2021 06:29:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e69d7be52dcb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 May 2021 06:29:16 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4317.eurprd08.prod.outlook.com (2603:10a6:803:101::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 06:29:10 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.035; Thu, 20 May 2021
 06:29:09 +0000
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
X-Inumbo-ID: e6cec95a-9ea4-4d64-a2b5-84eb979a19cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pjdr2fjKAFhVaEtS2MtFw4PeT9oNA3os/KbfYDL5/o=;
 b=KX4ML5t5NVoci5x3u1g6/qbUU0Z8vMJ3LcYb+Y+yXnRJEmpfudWeCvgz0BQ8lqVkytsko4H+OykFeb76k3TRTqDgPV3XyKn+A9zY/I2TzTfGVIwhctGvyG5Tq1sRUp8OQZTa+UJcfVEj3rlJTYUF/QQBwevTeN39rMIkcWdW1J0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tv5Bi+LtmOomVBKfO0LjOGmmBIvMhsJBFfrUY42iBHhGr4VlNWQnBy9h1SAR5rbwm/+lsq76ZsrN57PqDIiixD59OZ4y3KBAvXqtVFAbJs17vIc6tWKgL1q9r7Il/y7NPahowV/RkOoVHtCpXfOLaN2h1IFpcwJ4UQL1i6vxm5NFidMYhzeyYOAKYmkquKFsbgU0txhIjGB63b6RmPPUJjK+cirQpB1bn/+fwZsa0S/xEcAOKxjPqzbY3ooOPrTMiUNNbURW5Rv9xyvWO5S4WteT8qZ3QU4VBgBLtrV4Hy1IAnMDPlrkAsynElS23ae3CX0BQrW0TvGiPOK6HD8T7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pjdr2fjKAFhVaEtS2MtFw4PeT9oNA3os/KbfYDL5/o=;
 b=Li7mYKcxGz4PoXX8R7HcPaWCHXYxttiAGUEt2c2NbtlA/J2DVQeprOUzajACINd3AoniAutbuohhvuJQT5AGLJw6Pb7vWePix4xXdOQIE0W3XTQU2gtK9r1QBrUnSFWvq+rPQBkEfPqxjbmQWqQFFZM90UzovCDjJrrklc/9Qj4jS5ovoPiOH2c0dSPl1do13M6MJcf5rhUUyDnmGPaYSqdY0b1t4TOb2ur61YpFp0AnnENInEKMd5+p2igx0aWbrgNgN67K88wCFj+vX2u65tR2dskzG+/Wn6yBA5DRvEg9esC73ehQ8Mth2fszKLfnPOBwu9HB4+MJs5NQnjJmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pjdr2fjKAFhVaEtS2MtFw4PeT9oNA3os/KbfYDL5/o=;
 b=KX4ML5t5NVoci5x3u1g6/qbUU0Z8vMJ3LcYb+Y+yXnRJEmpfudWeCvgz0BQ8lqVkytsko4H+OykFeb76k3TRTqDgPV3XyKn+A9zY/I2TzTfGVIwhctGvyG5Tq1sRUp8OQZTa+UJcfVEj3rlJTYUF/QQBwevTeN39rMIkcWdW1J0=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 10/10] xen/arm: introduce allocate_static_memory
Thread-Topic: [PATCH 10/10] xen/arm: introduce allocate_static_memory
Thread-Index: AQHXS6XHA2Y5LfY1BUmlVQXGKXjd9qrpJQIAgAE5LmCAAOBqgIAAq0Tw
Date: Thu, 20 May 2021 06:29:09 +0000
Message-ID:
 <VE1PR08MB521597DE1752C8A7B4D58019F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-11-penny.zheng@arm.com>
 <7e9bacde-8a1c-c9f8-a06d-2f39f2192315@xen.org>
 <VE1PR08MB5215B4D187DFE8AE20DF2B95F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <72a374ca-4d75-70b4-3ee9-ad1dbdefa2d6@xen.org>
In-Reply-To: <72a374ca-4d75-70b4-3ee9-ad1dbdefa2d6@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 093885EA1275F943B8F43EC9EA3EA1A4.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9a33aff5-8782-468f-6f39-08d91b589b18
x-ms-traffictypediagnostic: VI1PR08MB4317:|PAXPR08MB6720:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6720C7714BF89DAC8E3BC312F72A9@PAXPR08MB6720.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LxdfksCNOlOT4K+zFBP0DPfZF9HsQQ2sw2BMeZSFHK3vuAf2C5dchUk6pPNU5qFDNu/nI6XwpOCZo0XyOHxxKuqrlRPoXD6STzjnODqUgD9tm8cBabsMRuT08aHOQA36piyL5Wd2sRR2MWt6HKNwMklRwViFQ+VZTxlJPiQLED9yEIij+inxBGBlrnsUCwv7nkLPex88Suqi+CRLylG+hmHCn/zCE+eLp0FCJScEQBM0r1b3w9n3HwpEUTQhsYI5tLF66kBSDlAn7m9Ep0XUqehALj0pH4re6vq4ODwzLjYyq46Se8EGbxUirA/1jiiyZAOiOGBSTcKW8XfgxAWhdWjJ5sEvGxk+wdG2TYfiSvEFg0BBSVNzGOd6C/xuF+jblocsPktufs+LVnik8RFX15LAERKooUyvzC8IiSRztTI0WnkU7CgPKKF51h7p+bQSQ4nrN1Ls75UJsTfTrZzSCtkI6WHll5y4qKOT2EmkKji7h2vu9V/YzHlH57yrCHBHLixcf8J5MOKLUh7rMeiznF7iOUHwiFHGTuvqP+PniTy4E+B7xv3jwc4UEaTVSe9FFPrW97Bvb6srsuNdRe4vb3pvSYoq0taWr5FaETUiWX0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39850400004)(478600001)(8676002)(66446008)(64756008)(66556008)(122000001)(66476007)(38100700002)(86362001)(316002)(5660300002)(66946007)(186003)(110136005)(54906003)(8936002)(76116006)(9686003)(53546011)(6506007)(52536014)(2906002)(26005)(55016002)(83380400001)(33656002)(7696005)(71200400001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?V1ZFbzlPeGs5cThkbVlpKzc3WDd1LzN6U2lZb1ZTR3RwMWllb2hpTzRLUzl4?=
 =?utf-8?B?S1gvZ2xMSDhueFFxd2dHZ0VFbVhFMjVmZ0JwbTlSemV0R0dxYytuNnNzSjdB?=
 =?utf-8?B?b1N3WEFkRHd6dmVDRVJYdmREWExsRUo0L3FRNHFQdzF4QTZtK0haOWp4TzI3?=
 =?utf-8?B?SEFsM1VIUW9ralRMKy90RlNmM010Mi9KM2ZXMzFSUnp5OVQ1eVJrcnhJamZL?=
 =?utf-8?B?VjRZTjdxYWM1ekJmSFloMndxNEdzM1g1OFVmaE9QU0pLejNEQ21ZcnBXdklM?=
 =?utf-8?B?NWxIQ1kxQll6UmplQkNJam5wK2RIN3d3Nmo2cGc3RTJZRmsycEp1MW5YeVNy?=
 =?utf-8?B?bGJ2RWdNeUd0cXRYd1FnbFBaVHhQREFOREJIU0tlR2EvS242dUs5a2Yra0R1?=
 =?utf-8?B?bU5FTVJqREhIMlNZeE41S044SzRBWFFzY3FrQTlzZFA2ZnBaOVcxUHh2ZkNY?=
 =?utf-8?B?bXlKM3dTVWhUR1E0ZXVYVEJ6ZlNZeWI4TVZwK1dFVXIwbHVKcEVjVVhlN3ll?=
 =?utf-8?B?TEtTMXNBUFhyTmhzaFhqY1FIQ0hCcFlvYk9ZZkg3a0o4a1pYUk1adnVHb2VF?=
 =?utf-8?B?dGx3U3dqYmFSRHFiTDVxWkhCY24zRUlDdXlOVGVwOUswRnlvWVQ0ZE4wamJ2?=
 =?utf-8?B?UGhOSzFIWTdYK01LR0Q1bjU2NklIWHB5ME5MdE1FZ3NQMG1HRDNXSWlUSzF0?=
 =?utf-8?B?UzZ5eGFZTnFDbHZ0dUpYOU9LMXJDU29oNFBTVkV2NG80cFgzajdsd01vajJr?=
 =?utf-8?B?SWJUdURoaXN1V3VIYWJITkp4cWY4QmIrSk5vYUFMeitGNjRjUWhIT0UzQ2ht?=
 =?utf-8?B?WWxvTlgyMEtsY1JaNUNuOE9WY3MvZkloSHhYbG5QU3U4azBKd3BlY0xFc1Yr?=
 =?utf-8?B?WnlSL01xQ3h6MTZPODBVN0Zqb1l4SDNJY1ZLalRPYkxycFZwNE5Ed1doNW0y?=
 =?utf-8?B?YXZXNXN5TzRwQmRRRTgvUm45eTFhNDBrbnVrTXpjeVFZNWtZeEYvTEhLQ0ht?=
 =?utf-8?B?ZjM5VGhicm9qYVJRdlFCTmtzcHVSNk9hTmhOSlE0ZmJBMHcrQktVSEpYelZQ?=
 =?utf-8?B?NnlEUkRHdDhEUFZvMS9lZU5LQmg3TndzSTFlYVZFVHd3LzJtWTBvSSt2VG5P?=
 =?utf-8?B?YUlYdC8xSDVvNnJ4RUpYOVVBSlNTTm4xeUd5djdZOUN4cWVUUkthMlhvTUxY?=
 =?utf-8?B?OHlKY0gwNGFGcThaT3h5SUo2V3FVdUUxeTBZNm8wVmpyL1ZBdVREdGtpQm9j?=
 =?utf-8?B?MlpIWTBTbVB1Rm02eTJOZXNBTE9xOG5KTjNGUHZZK3BTenF6cnhrZGlTbG1N?=
 =?utf-8?B?dlpqamlCRlZqYXVGa2dLUk9jeHUvMVNtcTFUTDNoNUJnbFI4K3ZNZ3FUUUxT?=
 =?utf-8?B?UHJnQVBFdUlIVDRxNXU2Wk00RHZOYUZadDFYVzh0bzYyWXMvT0tYZERqcS9v?=
 =?utf-8?B?RW1ObVVYLyt5U1FGSFkwS2loVGxsMHZldjN2ZkZuSU5qV2JjMS9GWDAyZXFv?=
 =?utf-8?B?Tm14ODF1ZE1ENWJnVmV4VkFhcERwdzRZOTJSbWd0TVVZeGN4REU0N2hMUXdX?=
 =?utf-8?B?eWx0MGNmN25DdDlBdFY2TXlrQWlleVAwelNXOHVQY3p3N2tXTkJGd1l6eGVY?=
 =?utf-8?B?T1lyZ0NleHdBSCs3Zi90cExKT0ZkTTB0SmI4VDZTYmZwOHBPSERON0lmTzNR?=
 =?utf-8?B?UURNbmdnSkI2NE5wODAveUswK3poR2RrZ3FXVVdjVzhweU1paDBEZDBkUE5v?=
 =?utf-8?Q?qGd75+QrhfhJosU3eHRZmaerYRcTOgHrKy93Wub?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57774dc4-c829-4304-058b-08d91b5893af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rAH0LFCnXV+9WB2kxNJ51lBrY7X/CcNe2hKLhViH3dClVBKDt2RTVTZiJ/tZHYEN7tLo2hBuuKPEugb6GSQ/TnsdH3FS8kTapocYD4UnACNPzwLfotiCNwBkZRBfqmO5NmST9EqmLeA9BAtMviNO8SCr7ch9s1kyWimvb+3Nd8IS1vk14IwbOZJ76FL4HqH8Y7HRFK72CZWEx6LM/Yq2d/CJmNykj0g7+5YtCIxYrpeOMaOeCHs/7IUlzHQMdOAhKn4lZ01gs4ADcAvMWeym8/6IgeTfxS/zQFYRMfWURSbBmV9eVfQbp9U5+yZ9LqGvIlj6zeR4uHIzQiYnn9Xw14Ff5VWvdw83iyB8+c34+/i/Qrq3PjLGf9/NfJNvHtE6I3Q4ViEifjuhVnT3nr5ayrxwVc0scCpblY+E/szcWFsQhgCs/ybwVRvJzeh7g293PyLjGzBK0G++/LOyBQ2mXhN5imfalohqL5fRsu0NHMlSgMPqrVeyPnKQBs8ESWOOPsZAVq4DSQAdvw4Olskhf9Y7vaiwQhP0A8NV1oJxtsd18CklknxmPFzUmpNrBA8jFcwkzGi92NcGWrv/p1t92VZZPWhwD2hm8Q2IPaXyUY/OArWM3EgKgZW2U9rUq2RFH98ccBSlMsRMd/PEa6N9FQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(46966006)(36840700001)(36860700001)(83380400001)(5660300002)(86362001)(8936002)(478600001)(356005)(186003)(82310400003)(9686003)(55016002)(81166007)(82740400003)(70586007)(70206006)(6506007)(52536014)(336012)(4326008)(47076005)(110136005)(53546011)(8676002)(7696005)(33656002)(26005)(54906003)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 06:29:22.2057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a33aff5-8782-468f-6f39-08d91b589b18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6720

SGkgSnVsaWVuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjAsIDIwMjEg
NDoxMCBBTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+
IDxXZWkuQ2hlbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMTAvMTBdIHhlbi9hcm06IGludHJvZHVjZSBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5DQo+IA0K
PiANCj4gDQo+IE9uIDE5LzA1LzIwMjEgMDg6MjcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEhp
IEp1bGllbg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIE1heSAx
OCwgMjAyMSA4OjA2IFBNDQo+ID4+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNv
bT47DQo+ID4+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZw0KPiA+PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPjsgV2VpIENoZW4NCj4gPj4gPFdlaS5DaGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4N
Cj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxMC8xMF0geGVuL2FybTogaW50cm9kdWNlIGFsbG9j
YXRlX3N0YXRpY19tZW1vcnkNCj4gPj4NCj4gPj4gSGkgUGVubnksDQo+ID4+DQo+ID4+IE9uIDE4
LzA1LzIwMjEgMDY6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gVGhpcyBjb21taXQgaW50
cm9kdWNlcyBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5IHRvIGFsbG9jYXRlIHN0YXRpYw0KPiA+Pj4g
bWVtb3J5IGFzIGd1ZXN0IFJBTSBmb3IgZG9tYWluIG9uIFN0YXRpYyBBbGxvY2F0aW9uLg0KPiA+
Pj4NCj4gPj4+IEl0IHVzZXMgYWxsb2NfZG9tc3RhdGljX3BhZ2VzIHRvIGFsbG9jYXRlIHByZS1k
ZWZpbmVkIHN0YXRpYyBtZW1vcnkNCj4gPj4+IGJhbmtzIGZvciB0aGlzIGRvbWFpbiwgYW5kIHVz
ZXMgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSB0byBzZXQgdXAgUDJNDQo+ID4+PiB0YWJsZSwgZ3Vl
c3Qgc3RhcnRpbmcgYXQgZml4ZWQgR1VFU1RfUkFNMF9CQVNFLCBHVUVTVF9SQU0xX0JBU0UuDQo+
ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5j
b20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDE1
Nw0KPiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPj4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPj4+DQo+
ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4+PiBiL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBpbmRleCAzMGI1NTU4OGI3Li45ZjY2MjMxM2FkIDEw
MDY0NA0KPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPj4+IEBAIC00MzcsNiArNDM3LDUwIEBA
IHN0YXRpYyBib29sIF9faW5pdCBhbGxvY2F0ZV9iYW5rX21lbW9yeShzdHJ1Y3QNCj4gPj4gZG9t
YWluICpkLA0KPiA+Pj4gICAgICAgIHJldHVybiB0cnVlOw0KPiA+Pj4gICAgfQ0KPiA+Pj4NCj4g
Pj4+ICsvKg0KPiA+Pj4gKyAqICNyYW1faW5kZXggYW5kICNyYW1faW5kZXggcmVmZXIgdG8gdGhl
IGluZGV4IGFuZCBzdGFydGluZw0KPiA+Pj4gK2FkZHJlc3Mgb2YgZ3Vlc3QNCj4gPj4+ICsgKiBt
ZW1vcnkga2FuayBzdG9yZWQgaW4ga2luZm8tPm1lbS4NCj4gPj4+ICsgKiBTdGF0aWMgbWVtb3J5
IGF0ICNzbWZuIG9mICN0b3Rfc2l6ZSBzaGFsbCBiZSBtYXBwZWQgI3NnZm4sIGFuZA0KPiA+Pj4g
KyAqICNzZ2ZuIHdpbGwgYmUgbmV4dCBndWVzdCBhZGRyZXNzIHRvIG1hcCB3aGVuIHJldHVybmlu
Zy4NCj4gPj4+ICsgKi8NCj4gPj4+ICtzdGF0aWMgYm9vbCBfX2luaXQgYWxsb2NhdGVfc3RhdGlj
X2JhbmtfbWVtb3J5KHN0cnVjdCBkb21haW4gKmQsDQo+ID4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0K
PiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IHJhbV9pbmRleCwNCj4gPj4NCj4gPj4gUGxlYXNlIHVzZSB1bnNpZ25lZC4NCj4gPj4NCj4gPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3Qg
cmFtX2FkZHIsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBnZm5fdCogc2dmbiwNCj4gPj4NCj4gPj4gSSBhbSBjb25mdXNlZCwgd2hhdCBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHJhbV9hZGRyIGFuZCBzZ2ZuPw0KPiA+Pg0KPiA+DQo+ID4g
V2UgbmVlZCB0byBjb25zdHJ1Y3Rpbmcga2luZm8tPm1lbShndWVzdCBSQU0gYmFua3MpIGhlcmUs
IGFuZCB3ZSBhcmUNCj4gPiBpbmRleGluZyBpbiBzdGF0aWNfbWVtKHBoeXNpY2FsIHJhbSBiYW5r
cykuIE11bHRpcGxlIHBoeXNpY2FsIHJhbQ0KPiA+IGJhbmtzIGNvbnNpc3Qgb2Ygb25lIGd1ZXN0
IHJhbSBiYW5rKGxpa2UsIEdVRVNUX1JBTTApLg0KPiA+DQo+ID4gcmFtX2FkZHIgIGhlcmUgd2ls
bCBlaXRoZXIgYmUgR1VFU1RfUkFNMF9CQVNFLCBvciBHVUVTVF9SQU0xX0JBU0UsDQo+IGZvcg0K
PiA+IG5vdy4gSSBraW5kcyBzdHJ1Z2dsZWQgaW4gaG93IHRvIG5hbWUgaXQuIEFuZCBtYXliZSBp
dCBzaGFsbCBub3QgYmUgYQ0KPiA+IHBhcmFtZXRlciBoZXJlLg0KPiA+DQo+ID4gTWF5YmUgSSBz
aG91bGQgc3dpdGNoLi4gY2FzZS4uIG9uIHRoZSByYW1faW5kZXgsIGlmIGl0cyAwLCBpdHMNCj4g
PiBHVUVTVF9SQU0wX0JBU0UsIEFuZCBpZiBpdHMgMSwgaXRzIEdVRVNUX1JBTTFfQkFTRS4NCj4g
DQo+IFlvdSBvbmx5IG5lZWQgdG8gc2V0IGtpbmZvLT5tZW0uYmFua1tyYW1faW5kZXhdLnN0YXJ0
IG9uY2UuIFRoaXMgaXMgd2hlbg0KPiB5b3Uga25vdyB0aGUgYmFuayBpcyBmaXJzdCB1c2VkLg0K
PiANCj4gQUZBSUNULCB0aGlzIGZ1bmN0aW9uIHdpbGwgbWFwIHRoZSBtZW1vcnkgZm9yIGEgcmFu
Z2Ugc3RhcnQgYXQgYGBzZ2ZuYGAuDQo+IEl0IGRvZXNuJ3QgZmVlbCB0aGlzIGJlbG9uZ3MgdG8g
dGhlIGZ1bmN0aW9uLg0KPiANCj4gVGhlIHNhbWUgcmVtYXJrIGlzIHZhbGlkIGZvciBraW5mby0+
bWVtLm5yX2JhbmtzLg0KPiANCg0KT2suIEkgZmluYWxseSB0b3RhbGx5IHVuZGVyc3RhbmQgd2hh
dCB5b3Ugc3VnZ2VzdCBoZXJlLg0KSSdsbCB0cnkgdG8gbGV0IHRoZSBhY3Rpb24gcmVsYXRlZCB0
byBzZXR0aW5nIGtpbmZvLT5tZW0uYmFua1tyYW1faW5kZXhdLnN0YXJ0Lw0Ka2luZm8tPm1lbS5i
YW5rW3JhbV9pbmRleF0uc2l6ZS8ga2luZm8tPm1lbS4gbnJfYmFua3Mgb3V0IG9mIHRoaXMgZnVu
Y3Rpb24sDQphbmQgb25seSBrZWVwIHRoZSBzaW1wbGUgZnVuY3Rpb25hbGl0eSBvZiBtYXBwaW5n
IHRoZSBtZW1vcnkgZm9yIGEgcmFuZ2Ugc3RhcnQNCmF0IGBgc2dmbmBgLg0KDQo+ID4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZm5fdCBzbWZuLA0K
PiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFk
ZHJfdCB0b3Rfc2l6ZSkgew0KPiA+Pj4gKyAgICBpbnQgcmVzOw0KPiA+Pj4gKyAgICBzdHJ1Y3Qg
bWVtYmFuayAqYmFuazsNCj4gPj4+ICsgICAgcGFkZHJfdCBfc2l6ZSA9IHRvdF9zaXplOw0KPiA+
Pj4gKw0KPiA+Pj4gKyAgICBiYW5rID0gJmtpbmZvLT5tZW0uYmFua1tyYW1faW5kZXhdOw0KPiA+
Pj4gKyAgICBiYW5rLT5zdGFydCA9IHJhbV9hZGRyOw0KPiA+Pj4gKyAgICBiYW5rLT5zaXplID0g
YmFuay0+c2l6ZSArIHRvdF9zaXplOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICB3aGlsZSAoIHRvdF9z
aXplID4gMCApDQo+ID4+PiArICAgIHsNCj4gPj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBvcmRl
ciA9IGdldF9hbGxvY2F0aW9uX3NpemUodG90X3NpemUpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAg
ICAgcmVzID0gZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZShkLCAqc2dmbiwgc21mbiwgb3JkZXIpOw0K
PiA+Pj4gKyAgICAgICAgaWYgKCByZXMgKQ0KPiA+Pj4gKyAgICAgICAgew0KPiA+Pj4gKyAgICAg
ICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgIkZhaWxlZCBtYXAgcGFnZXMgdG8gRE9NVTogJWQi
LCByZXMpOw0KPiA+Pj4gKyAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPj4+ICsgICAgICAg
IH0NCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgICpzZ2ZuID0gZ2ZuX2FkZCgqc2dmbiwgMVVMIDw8
IG9yZGVyKTsNCj4gPj4+ICsgICAgICAgIHNtZm4gPSBtZm5fYWRkKHNtZm4sIDFVTCA8PCBvcmRl
cik7DQo+ID4+PiArICAgICAgICB0b3Rfc2l6ZSAtPSAoMVVMTCA8PCAoUEFHRV9TSElGVCArIG9y
ZGVyKSk7DQo+ID4+PiArICAgIH0NCj4gPj4+ICsNCj4gPj4+ICsgICAga2luZm8tPm1lbS5ucl9i
YW5rcyA9IHJhbV9pbmRleCArIDE7DQo+ID4+PiArICAgIGtpbmZvLT51bmFzc2lnbmVkX21lbSAt
PSBfc2l6ZTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgcmV0dXJuIHRydWU7DQo+ID4+PiArfQ0KPiA+
Pj4gKw0KPiA+Pj4gICAgc3RhdGljIHZvaWQgX19pbml0IGFsbG9jYXRlX21lbW9yeShzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QNCj4gPj4+IGtlcm5lbF9pbmZvDQo+ID4+ICpraW5mbykNCj4gPj4+
ICAgIHsNCj4gPj4+ICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPj4+IEBAIC00ODAsNiArNTI0
LDExNiBAQCBmYWlsOg0KPiA+Pj4gICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKWtpbmZvLT51
bmFzc2lnbmVkX21lbSA+PiAxMCk7DQo+ID4+PiAgICB9DQo+ID4+Pg0KPiA+Pj4gKy8qIEFsbG9j
YXRlIG1lbW9yeSBmcm9tIHN0YXRpYyBtZW1vcnkgYXMgUkFNIGZvciBvbmUgc3BlY2lmaWMNCj4g
Pj4+ICtkb21haW4gZC4gKi8gc3RhdGljIHZvaWQgX19pbml0IGFsbG9jYXRlX3N0YXRpY19tZW1v
cnkoc3RydWN0IGRvbWFpbiAqZCwNCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBrZXJuZWxfaW5mbw0KPiA+Pj4gKypraW5mbykgew0KPiA+
Pj4gKyAgICBpbnQgbnJfYmFua3MsIF9iYW5rcyA9IDA7DQo+ID4+DQo+ID4+IEFGQUlDVCwgX2Jh
bmtzIGlzIHRoZSBpbmRleCBpbiB0aGUgYXJyYXkuIEkgdGhpbmsgaXQgd291bGQgYmUgY2xlYXJl
cg0KPiA+PiBpZiBpdCBpcyBjYWxsZXIgJ2JhbmsnIG9yICdpZHgnLg0KPiA+Pg0KPiA+DQo+ID4g
U3VyZSwgSeKAmWxsIHVzZSB0aGUgJ2JhbmsnIGhlcmUuDQo+ID4NCj4gPj4+ICsgICAgc2l6ZV90
IHJhbTBfc2l6ZSA9IEdVRVNUX1JBTTBfU0laRSwgcmFtMV9zaXplID0gR1VFU1RfUkFNMV9TSVpF
Ow0KPiA+Pj4gKyAgICBwYWRkcl90IGJhbmtfc3RhcnQsIGJhbmtfc2l6ZTsNCj4gPj4+ICsgICAg
Z2ZuX3Qgc2dmbjsNCj4gPj4+ICsgICAgbWZuX3Qgc21mbjsNCj4gPj4+ICsNCj4gPj4+ICsgICAg
a2luZm8tPm1lbS5ucl9iYW5rcyA9IDA7DQo+ID4+PiArICAgIHNnZm4gPSBnYWRkcl90b19nZm4o
R1VFU1RfUkFNMF9CQVNFKTsNCj4gPj4+ICsgICAgbnJfYmFua3MgPSBkLT5hcmNoLnN0YXRpY19t
ZW0ubnJfYmFua3M7DQo+ID4+PiArICAgIEFTU0VSVChucl9iYW5rcyA+PSAwKTsNCj4gPj4+ICsN
Cj4gPj4+ICsgICAgaWYgKCBraW5mby0+dW5hc3NpZ25lZF9tZW0gPD0gMCApDQo+ID4+PiArICAg
ICAgICBnb3RvIGZhaWw7DQo+ID4+PiArDQo+ID4+PiArICAgIHdoaWxlICggX2JhbmtzIDwgbnJf
YmFua3MgKQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICBiYW5rX3N0YXJ0ID0gZC0+YXJj
aC5zdGF0aWNfbWVtLmJhbmtbX2JhbmtzXS5zdGFydDsNCj4gPj4+ICsgICAgICAgIHNtZm4gPSBt
YWRkcl90b19tZm4oYmFua19zdGFydCk7DQo+ID4+PiArICAgICAgICBiYW5rX3NpemUgPSBkLT5h
cmNoLnN0YXRpY19tZW0uYmFua1tfYmFua3NdLnNpemU7DQo+ID4+DQo+ID4+IFRoZSB2YXJpYWJs
ZSBuYW1lIGFyZSBzbGlnaHRseSBjb25mdXNpbmcgYmVjYXVzZSBpdCBkb2Vzbid0IHRlbGwNCj4g
Pj4gd2hldGhlciB0aGlzIGlzIHBoeXNpY2FsIGFyZSBndWVzdCBSQU0uIFlvdSBtaWdodCB3YW50
IHRvIGNvbnNpZGVyIHRvDQo+ID4+IHByZWZpeCB0aGVtIHdpdGggcCAocmVzcC4gZykgZm9yIHBo
eXNpY2FsIChyZXNwLiBndWVzdCkgUkFNLg0KPiA+DQo+ID4gU3VyZSwgSSdsbCByZW5hbWUgdG8g
bWFrZSBpdCBtb3JlIGNsZWFybHkuDQo+ID4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICsgICAgICAg
IGlmICggIWFsbG9jX2RvbXN0YXRpY19wYWdlcyhkLCBiYW5rX3NpemUgPj4gUEFHRV9TSElGVCwN
Cj4gPj4+ICsgYmFua19zdGFydCwNCj4gPj4gMCkgKQ0KPiA+Pj4gKyAgICAgICAgew0KPiA+Pj4g
KyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSDQo+ID4+PiArICAgICAgICAgICAgICAgICAg
ICAiJXBkOiBjYW5ub3QgYWxsb2NhdGUgc3RhdGljIG1lbW9yeSINCj4gPj4+ICsgICAgICAgICAg
ICAgICAgICAgICIoMHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IikiLA0KPiA+Pg0KPiA+PiBiYW5r
X3N0YXJ0IGFuZCBiYW5rX3NpemUgYXJlIGJvdGggcGFkZHJfdC4gU28gdGhpcyBzaG91bGQgYmUg
UFJJcGFkZHIuDQo+ID4NCj4gPiBTdXJlLCBJJ2xsIGNoYW5nZQ0KPiA+DQo+ID4+DQo+ID4+PiAr
ICAgICAgICAgICAgICAgICAgICBkLCBiYW5rX3N0YXJ0LCBiYW5rX3N0YXJ0ICsgYmFua19zaXpl
KTsNCj4gPj4+ICsgICAgICAgICAgICBnb3RvIGZhaWw7DQo+ID4+PiArICAgICAgICB9DQo+ID4+
PiArDQo+ID4+PiArICAgICAgICAvKg0KPiA+Pj4gKyAgICAgICAgICogQnkgZGVmYXVsdCwgaXQg
c2hhbGwgYmUgbWFwcGVkIHRvIHRoZSBmaXhlZCBndWVzdCBSQU0gYWRkcmVzcw0KPiA+Pj4gKyAg
ICAgICAgICogYEdVRVNUX1JBTTBfQkFTRWAsIGBHVUVTVF9SQU0xX0JBU0VgLg0KPiA+Pj4gKyAg
ICAgICAgICogU3RhcnRpbmcgZnJvbSBSQU0wKEdVRVNUX1JBTTBfQkFTRSkuDQo+ID4+PiArICAg
ICAgICAgKi8NCj4gPj4NCj4gPj4gT2suIFNvIHlvdSBhcmUgZmlyc3QgdHJ5aW5nIHRvIGV4aGF1
c3QgdGhlIGd1ZXN0IGJhbmsgMCBhbmQgdGhlbg0KPiA+PiBtb3ZlZCB0byBiYW5rIDEuIFRoaXMg
d2Fzbid0IGVudGlyZWx5IGNsZWFyIGZyb20gdGhlIGRlc2lnbiBkb2N1bWVudC4NCj4gPj4NCj4g
Pj4gSSBhbSBmaW5lIHdpdGggdGhhdCwgYnV0IGluIHRoaXMgY2FzZSwgdGhlIGRldmVsb3BwZXIg
c2hvdWxkIG5vdCBuZWVkDQo+ID4+IHRvIGtub3cgdGhhdCAoaW4gZmFjdCB0aGlzIGlzIG5vdCBw
YXJ0IG9mIHRoZSBBQkkpLg0KPiA+Pg0KPiA+PiBSZWdhcmRpbmcgdGhpcyBjb2RlLCBJIGFtIGEg
Yml0IGNvbmNlcm5lZCBhYm91dCB0aGUgc2NhbGFiaWxpdHkgaWYgd2UNCj4gPj4gaW50cm9kdWNl
IGEgc2Vjb25kIGJhbmsuDQo+ID4+DQo+ID4+IENhbiB3ZSBoYXZlIGFuIGFycmF5IG9mIHRoZSBw
b3NzaWJsZSBndWVzdCBiYW5rcyBhbmQgaW5jcmVtZW50IHRoZQ0KPiA+PiBpbmRleCB3aGVuIGV4
aGF1c3RpbmcgdGhlIGN1cnJlbnQgYmFuaz8NCj4gPj4NCj4gPg0KPiA+IENvcnJlY3QgbWUgaWYg
SSB1bmRlcnN0YW5kIHdyb25nbHksDQo+ID4NCj4gPiBXaGF0IHlvdSBzdWdnZXN0IGhlcmUgaXMg
dGhhdCB3ZSBtYWtlIGFuIGFycmF5IG9mIGd1ZXN0IGJhbmtzLCByaWdodA0KPiA+IG5vdywgaW5j
bHVkaW5nDQo+ID4gR1VFU1RfUkFNMCBhbmQgR1VFU1RfUkFNMS4gQW5kIGlmIGxhdGVyLCBhZGRp
bmcgbW9yZSBndWVzdCBiYW5rcywgaXQNCj4gPiB3aWxsIG5vdCBicmluZyBzY2FsYWJpbGl0eSBw
cm9ibGVtIGhlcmUsIHJpZ2h0Pw0KPiANCj4gWWVzLiBUaGlzIHNob3VsZCBhbHNvIHJlZHVjZSB0
aGUgY3VycmVudCBjb21wbGV4aXR5IG9mIHRoZSBjb2RlLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4g
LS0NCj4gSnVsaWVuIEdyYWxsDQoNCkNoZWVycw0KDQpQZW5ueQ0K

