Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9717E31B63F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 10:13:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85105.159578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZw2-0002Kh-3s; Mon, 15 Feb 2021 09:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85105.159578; Mon, 15 Feb 2021 09:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZw1-0002KI-Vu; Mon, 15 Feb 2021 09:12:49 +0000
Received: by outflank-mailman (input) for mailman id 85105;
 Mon, 15 Feb 2021 09:12:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=grdk=HR=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lBZvz-0002KC-KZ
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 09:12:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f00344b-bce6-489e-97b9-b487e1be323f;
 Mon, 15 Feb 2021 09:12:44 +0000 (UTC)
Received: from AM5PR0101CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::20) by DBBPR08MB4695.eurprd08.prod.outlook.com
 (2603:10a6:10:db::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 09:12:41 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::f2) by AM5PR0101CA0007.outlook.office365.com
 (2603:10a6:206:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend
 Transport; Mon, 15 Feb 2021 09:12:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Mon, 15 Feb 2021 09:12:40 +0000
Received: ("Tessian outbound 2b57fdd78668:v71");
 Mon, 15 Feb 2021 09:12:40 +0000
Received: from d572069380f4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF924D55-4894-452D-94B6-A9758E191566.1; 
 Mon, 15 Feb 2021 09:12:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d572069380f4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Feb 2021 09:12:34 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4443.eurprd08.prod.outlook.com (2603:10a6:10:c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Mon, 15 Feb
 2021 09:12:32 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3846.039; Mon, 15 Feb 2021
 09:12:32 +0000
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
X-Inumbo-ID: 8f00344b-bce6-489e-97b9-b487e1be323f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y25BjAdiNR/jL74i3vNwM3x2RAxisV+bjFuLi6QVVJ4=;
 b=SqgOYck3IswQ7nfO3tSTiI0z1SryMAtz7MPVt9TQRvhos2Q4Ae+QwH+eI+1NIBpaB4+TKq9wCqLeJWt6VV73ODKlDS/bWeYd00yOJLDITisThZWKC9SU1waPTI2jv+1lSB2W6yLmWs2ERYGQn6mQ3WPpsl+X4yN2XqJXI7sy1+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5eaa60167c3fd43
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvUh/epKc1R0gjaFB9/6WrSbNLXxyGJtkyUOqx/+OJh8y4msaKg91hViThhA15LzUHJfDC/Qu5lsI3umNDhX6OkVr4Du2ZGheCIpuxPJSUAaLfW3/ip2YD/rjyATFMxAY55KPuXT5Po/mWZYg7yYDupXvf2fiv0vS40oOyNjm+yU5qfiKH1wXdbg4XuUtbYn3TPAJQX4uyZHauDJL4QwE2t0Pkf/7bv92Qsk9BknKGe24fx+UTAS59p0QIXC1AmGz/QmIvnX6BST1aHob7GwDmNnaABGxJzO80vbl3SWLV0q8yXAOP4n+vrBg8KN4PfjNjOGMrxxMKYHYrgRxWS/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y25BjAdiNR/jL74i3vNwM3x2RAxisV+bjFuLi6QVVJ4=;
 b=d+y3W4SGi5tSwuKhw+GSyli/fMYOSQc9bsfsz3HWbyWsqvGsEdn1quOu7yRCR4sBVPbgXg89vVvn8S8YAgnU8DS7/QKnLJ/bPfFL2j5IWRP2aqW56GbwlxSGFSysTG7qGgOXtcJceum+7lO/sZfD+073arxHpY17qo0z8w2FHmW88G6R41Cw8/yCb1PlKvAR5QH2WfJcLhRga6xz7Cr5a4AANRwKv3Qf5H81QHp2/e/TDtcj6aBRWLHFUHhIstxSLAREAgvd2sK0RFtJTEAfGg7SOvPXgvudwMarUR9/C0RsmEdNTTnc984W1468rSkB7B8Krhap/AriOfijcH6Asw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y25BjAdiNR/jL74i3vNwM3x2RAxisV+bjFuLi6QVVJ4=;
 b=SqgOYck3IswQ7nfO3tSTiI0z1SryMAtz7MPVt9TQRvhos2Q4Ae+QwH+eI+1NIBpaB4+TKq9wCqLeJWt6VV73ODKlDS/bWeYd00yOJLDITisThZWKC9SU1waPTI2jv+1lSB2W6yLmWs2ERYGQn6mQ3WPpsl+X4yN2XqJXI7sy1+c=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index:
 AQHW/ks46k4kUfhzpk6LTniK0S/PbqpPzhoAgAB7ugCAATYRAIAAKYkAgAAJgACAABz0AIABJMKAgAAJKICAACTqAIAEnQkAgAE5C4A=
Date: Mon, 15 Feb 2021 09:12:32 +0000
Message-ID: <8A85CE97-A38D-4580-BBDD-38DD0542A3F8@arm.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
 <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
 <4e4f7d25-6f5f-1016-b1c9-7aa902d637b8@xen.org>
 <ECC82E19-3504-4E0E-B3EA-D0E46DD842C6@arm.com>
 <c573b3a0-186d-626e-6670-f8fc28285e3d@xen.org>
 <BFC5858A-3631-48E1-AB87-40EECF95FA66@arm.com>
 <489c1b89-67f0-5d47-d527-3ea580b7cc43@xen.org>
 <DC7F1705-54B3-4543-8222-E7BCF1A501F7@arm.com>
 <acbcdd06-83b1-28ff-ea7e-2ce1ba681ac1@xen.org>
In-Reply-To: <acbcdd06-83b1-28ff-ea7e-2ce1ba681ac1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0d8a071-d63a-4211-5ab8-08d8d191d888
x-ms-traffictypediagnostic: DBBPR08MB4443:|DBBPR08MB4695:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4695BD1D49FDCC14EBD26554FC889@DBBPR08MB4695.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ckhByKDDnQ9YbB+N3YlMnxHrh8CvH0K90DJDK+QezRMWPg7p9c6jFgUj8jvBK3sZPCrA5/d7/l/OWxDONLR8vwJrogt/OYtiyj2SStUWVzz4jempFUWfkeXEI6S7eA+BfGWl2l8ulSuU/SXGoR3lSXTcM2gj0S8QcL7JjlxktB0XQAN4g7PBAD2a/OnYQ9RFvHVqCBG8/JQscewmtdmQbpQjJxJnmutBCl3UCeBD2gwPl0zw8yfaiblOakhHdHl41KwqGoAKEUGBLd4cEljDActgD9uBbzD4IAiy2irYm3J7bLuGQ7Oi1eUVCoBHyw1o6Sss2K2wECxAlMaOBxa0kcKAy7WgpXF6bkTkWu+asq8RWp5UDgNm0L5b988KEgEqPzJ/nAdfuimNFe/OPyMmD4u9ki/FVa1lUwBLzh9nagzl1NVhvxRNIjqCilzypCFb4FVnG0D0iawBvmBAI2S0cSRGfdJhRfT7F1f7poPNk9cfPXPEZq2eFrBf+pyMbZL8DbZS6oCaKefpSOqp1EIsO1MLwOFmAkeuSOROSpo/fKWEWXP4W7twUrRbKhrLl/tAR37zZS+TYzGFiGFG7N15HilEccaSav+dU2bD4kloCHHyB7MtUlvL8naLprt8Dj8wsOG0MAgtZUtOnwdOEl5MSPapqgfusFgqO851SPkB/5c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(6506007)(53546011)(966005)(2906002)(478600001)(6916009)(2616005)(26005)(186003)(33656002)(8936002)(66556008)(86362001)(83380400001)(64756008)(66946007)(66476007)(76116006)(91956017)(66446008)(316002)(6486002)(36756003)(5660300002)(54906003)(6512007)(8676002)(4326008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?WFkxczdNY2xaWTFVSUhyQVZDR3dRR1pzcGVqZ2g3cHhRY0IzWDlaMVI4cTBT?=
 =?utf-8?B?Tlc1bUVZdnZzeENzUGkvcTRZclFaaTUvZHRuUTkxQ3dKWDlyWmRVUEVPK1NS?=
 =?utf-8?B?YUl5SGdveDNOam9uTVYyZG14K1NqL3p1NExSaVEyVUhJRTNybFFyNStnMXN3?=
 =?utf-8?B?WnMzclRZNnd5L0lxVFB1NTlxM2ZmQUdNSlZZN0hiVlN3OE9XQnpvNkcvRzRl?=
 =?utf-8?B?Q296UGc3UXRDREl6MWpjWG1CTHltWFVjajdhVStLVktvQktBT1JUc0VJN1Vi?=
 =?utf-8?B?WkdPbHA0RDBTclV5QkRVVmNwcW9GcmF5b1d3d1d0TXE3T091NFhaVk1tS1FL?=
 =?utf-8?B?dUV3SWM3TU42WmQxcTRONm1IZndtQ0t1Z1ZJTFpjVUhWSzQzbHNlVWRjUzFN?=
 =?utf-8?B?blU5MEdsRmZvKzUzYVRiYXMxU0g4K0JVaGdWWWxIZE9wM1N5dm9oVVd2MmZM?=
 =?utf-8?B?SEFZc3hMdVFuTERoMDg3MlB5a1JFOVdhRVNFbFNaTXlvd0JxVFZOSGN5NTM5?=
 =?utf-8?B?SmtCZ2NBdzdKZ0FoaGpodTFpR3VxOWdoUEprMVppL21LaS8yc09UNTlNR0p2?=
 =?utf-8?B?NDhzaGJtOW5kNEo4SEhIVzY1RUlsSHJ4dnN4TGVyTS9pcUVBNGVOVVFBUGRw?=
 =?utf-8?B?OStYRjlTdnN3SUtEM1NYYUQzeGFIV2FtMUw5aHZ4S3pPazlkdHAwQW0rbnlx?=
 =?utf-8?B?R3NNd0RxYkVKWlVLLy9vc0xKTjVjeTE1QTk2WHlFUUNibytqY0daWGtsUEJF?=
 =?utf-8?B?Z3BiLytCYmRja28xSGpIL3NuRzI2TWc1RHlUWTAzNVNxdTFmYVFXRUhScmRW?=
 =?utf-8?B?V2dPRGt5RWNrRWluZWxIOEdYSnJBMWM3ODU3UWV5OG9sZWdzSFdCT0U5ZjZN?=
 =?utf-8?B?VmU1VVpKcHZPN3RyRDZYSVpZY0ZTUnQ1YjlRNHZmMDM3MHJOR0pCemtiWE1K?=
 =?utf-8?B?YXJXSHVrN2w1N2E1aFlPeXFwOWZrZFZDOVFLMnRHaDdwcWlzdmVJQ3ZEMlNi?=
 =?utf-8?B?NnhqN0NSVmFHdW4zeC9LRjBZd0d0NU9VVUJNRWtWWWUvWTRoNzdGMWdhVi9O?=
 =?utf-8?B?WEdQcEtvSXBlNTYxUUZ3UmNvMStZOE9hWW5IWmNwRzJNOHlPOFFOQXhCYm5p?=
 =?utf-8?B?L2RsZGFlanM1WHpNeTNFbERXZDR4NVduVW1JM0FRL0FBd0Jxa1VRTFFxb2lt?=
 =?utf-8?B?dGlENVVncjlaSFpRWk1uZXJxMituRDhyYWhBWnphZ2NEVjgrMU91Y29NcnJB?=
 =?utf-8?B?R2hUbWZac2N3RHJnbExtTWxiSXlxTzFENmtISStrbER0UmZOSTl0UGM1RXds?=
 =?utf-8?B?V1diaFFCY3pqamsreXpMb2VmQ2gwSjI1SUVCb0U2aklvZ3J4M0xZNHY0NXN4?=
 =?utf-8?B?cTlIS1I2NVc3RDZFUDhmcEhtRUl5UWtJYkFxdmNCQ0k4dlYzZEtXa21PanJk?=
 =?utf-8?B?TVc3MThJTTVMOXljOWZBZkFPdmNmQzA2VFNiQkFxOXdnVmY5d2t1N2dXa1ky?=
 =?utf-8?B?NStEWjVlMXA2SGFBelJMb2dhTzhEK0RDYlN2Z05EMXZvRjlJaUtGaUdVYzR6?=
 =?utf-8?B?QnVnV3U0NXNxS0l2aXBiMzBsM2VKc0NNWi9Eam5EdmluK3dwMmJsUkZXQS9I?=
 =?utf-8?B?OHppVEVaZURPdVdPbFE1TnNEY0wrRU90ZUh6OG5GN0NobnFGa3RmZE1HTEpX?=
 =?utf-8?B?aTduNHRmaTV2QnFyNkVicklpQjJqUERaZ3pIdGc4YkVWaGhoYUl5cmFYcVRY?=
 =?utf-8?Q?YcI7s6V8j9sxomM9qqpHY+O2Mdi6ejfdhrRByJA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFC41E583A4BD4499640416C603F5A6E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4443
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d841f4a-d171-485c-4886-08d8d191d385
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vnFfAu6akzU+Y98WQO6iJxzS5vWeNizR9m1YgEq7tLJlWTbtcDy6vuk9v5kOUTLOu4Q5TKlkbu/Ou+ebIKQYgDXnWl1nyxIGR3t5u9cWeM+P5fuqc44wSzj3MoAxef69EIt0Y7vKS/FobLByF/bHCQCu6Hkr3AGyEUnvgn1sVrPSn0FpqiSlXT3FCn42v20cR89NIdhKYqWupuz+apk7Kv3O++C/kkw5sAbusCIRkiZNN7WUmwnP1LfcM8DJQ3A3DTwv9zSMgXIRwVnBNv9xvGAhlhIXLJ70I2kZBCVK/PIa0PkrDrAZ473K6ehNLM3N4DTMbpffnAULb+94dq1AYm2TWjGCRjskdNaz2fYDSSDn2XQziDCqLgpZk4NTY1073UcZaciGpyFBuvlgfPMwcBQHbTwU5t9+DMU/OufVO0Cw6KoupJVHcFy7LqMp1eydpBtMY+wOnKkFc8Fw5AKXC6MIML+eoiWpN9w2tjMAw45NBjDDBaNU8xL8VgYU9/+0YmWu/iqQoC75XoFn9l4QD1ItBGUI6fKbnQbhbJg3la5oksI2NVius3alBRa5lrcTcy+sFDhsekxLBuEMruN1GPS8+9IGyTIwNOhXixiWuIjsRb4dEYgTLYGcSX9mLodj00fPmzktNIlnwBYjv+Ca+T39YAf+rODjFlCvTBuxGUZpb8QPj/1MU2bdKL9kEbEQ0l/UAakHUGRtTqpyfOQMNDGlFJK7jlYMUpghRLhP/BY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(46966006)(6862004)(4326008)(107886003)(82740400003)(70206006)(82310400003)(70586007)(6512007)(36756003)(478600001)(966005)(86362001)(2906002)(336012)(53546011)(81166007)(356005)(54906003)(33656002)(8936002)(8676002)(316002)(83380400001)(26005)(47076005)(36860700001)(5660300002)(186003)(6506007)(6486002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 09:12:40.5503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d8a071-d63a-4211-5ab8-08d8d191d888
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4695

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDE0IEZlYiAyMDIxLCBhdCAyOjMyIHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMTEv
MDIvMjAyMSAxNjowNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gT24gMTEgRmViIDIwMjEsIGF0
IDE6NTIgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+
IA0KPj4+IA0KPj4+IE9uIDExLzAyLzIwMjEgMTM6MjAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+
PiBIZWxsbyBKdWxpZW4sDQo+Pj4gDQo+Pj4gSGkgUmFodWwsDQo+Pj4gDQo+Pj4+PiBPbiAxMCBG
ZWIgMjAyMSwgYXQgNzo1MiBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6
DQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBPbiAxMC8wMi8yMDIxIDE4OjA4LCBSYWh1
bCBTaW5naCB3cm90ZToNCj4+Pj4+PiBIZWxsbyBKdWxpZW4sDQo+Pj4+Pj4+IE9uIDEwIEZlYiAy
MDIxLCBhdCA1OjM0IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+
Pj4+Pj4gDQo+Pj4+Pj4+IEhpLA0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gMTAvMDIvMjAyMSAxNTow
NiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gOSBGZWIgMjAyMSwgYXQgODozNiBw
bSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+
Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBPbiBUdWUsIDkgRmViIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3Rl
Og0KPj4+Pj4+Pj4+Pj4gT24gOCBGZWIgMjAyMSwgYXQgNjo0OSBwbSwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4+Pj4gQ29tbWl0IDkxZDRlY2E3YWRkIGJyb2tlIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcg
b24gQVJNLg0KPj4+Pj4+Pj4+Pj4gVGhlIG9mZmVuZGluZyBjaHVuayBpczoNCj4+Pj4+Pj4+Pj4+
IA0KPj4+Pj4+Pj4+Pj4gI2RlZmluZSBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nKGQpICAgICAg
ICAgICAgICAgICAgICBcDQo+Pj4+Pj4+Pj4+PiAtICAgIChpc19kb21haW5fZGlyZWN0X21hcHBl
ZChkKSAmJiBuZWVkX2lvbW11KGQpKQ0KPj4+Pj4+Pj4+Pj4gKyAgICAoaXNfZG9tYWluX2RpcmVj
dF9tYXBwZWQoZCkgJiYgbmVlZF9pb21tdV9wdF9zeW5jKGQpKQ0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4+PiBPbiBBUk0gd2UgbmVlZCBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nIHRvIGJlIHRy
dWUgZm9yIGRvbTAgd2hlbiBpdCBpcw0KPj4+Pj4+Pj4+Pj4gZGlyZWN0bHkgbWFwcGVkIGFuZCBJ
T01NVSBpcyBlbmFibGVkIGZvciB0aGUgZG9tYWluLCBsaWtlIHRoZSBvbGQgY2hlY2sNCj4+Pj4+
Pj4+Pj4+IGRpZCwgYnV0IHRoZSBuZXcgY2hlY2sgaXMgYWx3YXlzIGZhbHNlLg0KPj4+Pj4+Pj4+
Pj4gDQo+Pj4+Pj4+Pj4+PiBJbiBmYWN0LCBuZWVkX2lvbW11X3B0X3N5bmMgaXMgZGVmaW5lZCBh
cyBkb21faW9tbXUoZCktPm5lZWRfc3luYyBhbmQNCj4+Pj4+Pj4+Pj4+IG5lZWRfc3luYyBpcyBz
ZXQgYXM6DQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+ICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9t
YWluKGQpIHx8IGlvbW11X2h3ZG9tX3N0cmljdCApDQo+Pj4+Pj4+Pj4+PiAgICAgICBoZC0+bmVl
ZF9zeW5jID0gIWlvbW11X3VzZV9oYXBfcHQoZCk7DQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+
IGlvbW11X3VzZV9oYXBfcHQoZCkgbWVhbnMgdGhhdCB0aGUgcGFnZS10YWJsZSB1c2VkIGJ5IHRo
ZSBJT01NVSBpcyB0aGUNCj4+Pj4+Pj4+Pj4+IFAyTS4gSXQgaXMgdHJ1ZSBvbiBBUk0uIG5lZWRf
c3luYyBtZWFucyB0aGF0IHlvdSBoYXZlIGEgc2VwYXJhdGUgSU9NTVUNCj4+Pj4+Pj4+Pj4+IHBh
Z2UtdGFibGUgYW5kIGl0IG5lZWRzIHRvIGJlIHVwZGF0ZWQgZm9yIGV2ZXJ5IGNoYW5nZS4gbmVl
ZF9zeW5jIGlzIHNldA0KPj4+Pj4+Pj4+Pj4gdG8gZmFsc2Ugb24gQVJNLiBIZW5jZSwgZ250dGFi
X25lZWRfaW9tbXVfbWFwcGluZyhkKSBpcyBmYWxzZSB0b28sDQo+Pj4+Pj4+Pj4+PiB3aGljaCBp
cyB3cm9uZy4NCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gQXMgYSBjb25zZXF1ZW5jZSwgd2hl
biB1c2luZyBQViBuZXR3b3JrIGZyb20gYSBkb21VIG9uIGEgc3lzdGVtIHdoZXJlDQo+Pj4+Pj4+
Pj4+PiBJT01NVSBpcyBvbiBmcm9tIERvbTAsIEkgZ2V0Og0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+
Pj4+PiAoWEVOKSBzbW11OiAvc21tdUBmZDgwMDAwMDogVW5oYW5kbGVkIGNvbnRleHQgZmF1bHQ6
IGZzcj0weDQwMiwgaW92YT0weDg0MjRjYjE0OCwgZnN5bnI9MHhiMDAwMSwgY2I9MA0KPj4+Pj4+
Pj4+Pj4gWyAgIDY4LjI5MDMwN10gbWFjYiBmZjBlMDAwMC5ldGhlcm5ldCBldGgwOiBETUEgYnVz
IGVycm9yOiBIUkVTUCBub3QgT0sNCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gVGhlIGZpeCBp
cyB0byBnbyBiYWNrIHRvIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YgdGhlIG9sZA0KPj4+
Pj4+Pj4+Pj4gaW1wbGVtZW50YXRpb24gb2YgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZy4NCj4+
Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4+Pj4+Pj4+Pj4+IEZpeGVzOiA5MWQ0
ZWNhN2FkZA0KPj4+Pj4+Pj4+Pj4gQmFja3BvcnQ6IDQuMTIrDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+
Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiBHaXZlbiB0aGUgc2V2ZXJpdHkg
b2YgdGhlIGJ1ZywgSSB3b3VsZCBsaWtlIHRvIHJlcXVlc3QgdGhpcyBwYXRjaCB0byBiZQ0KPj4+
Pj4+Pj4+Pj4gYmFja3BvcnRlZCB0byA0LjEyIHRvbywgZXZlbiBpZiA0LjEyIGlzIHNlY3VyaXR5
LWZpeGVzIG9ubHkgc2luY2UgT2N0DQo+Pj4+Pj4+Pj4+PiAyMDIwLg0KPj4+Pj4+Pj4+Pj4gDQo+
Pj4+Pj4+Pj4+PiBGb3IgdGhlIDQuMTIgYmFja3BvcnQsIHdlIGNhbiB1c2UgaW9tbXVfZW5hYmxl
ZCgpIGluc3RlYWQgb2YNCj4+Pj4+Pj4+Pj4+IGlzX2lvbW11X2VuYWJsZWQoKSBpbiB0aGUgaW1w
bGVtZW50YXRpb24gb2YgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZy4NCj4+Pj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+Pj4+Pj4+Pj4+IC0gaW1wcm92ZSBjb21taXQg
bWVzc2FnZQ0KPj4+Pj4+Pj4+Pj4gLSBhZGQgaXNfaW9tbXVfZW5hYmxlZChkKSB0byB0aGUgY2hl
Y2sNCj4+Pj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4+Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9ncmFu
dF90YWJsZS5oIHwgMiArLQ0KPj4+Pj4+Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJt
L2dyYW50X3RhYmxlLmgNCj4+Pj4+Pj4+Pj4+IGluZGV4IDZmNTg1YjE1MzguLjBjZTc3ZjlhMWMg
MTAwNjQ0DQo+Pj4+Pj4+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxl
LmgNCj4+Pj4+Pj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaA0K
Pj4+Pj4+Pj4+Pj4gQEAgLTg5LDcgKzg5LDcgQEAgaW50IHJlcGxhY2VfZ3JhbnRfaG9zdF9tYXBw
aW5nKHVuc2lnbmVkIGxvbmcgZ3BhZGRyLCBtZm5fdCBtZm4sDQo+Pj4+Pj4+Pj4+PiAgICAoKChp
KSA+PSBucl9zdGF0dXNfZnJhbWVzKHQpKSA/IElOVkFMSURfR0ZOIDogKHQpLT5hcmNoLnN0YXR1
c19nZm5baV0pDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+ICNkZWZpbmUgZ250dGFiX25lZWRf
aW9tbXVfbWFwcGluZyhkKSAgICAgICAgICAgICAgICAgICAgXA0KPj4+Pj4+Pj4+Pj4gLSAgICAo
aXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgbmVlZF9pb21tdV9wdF9zeW5jKGQpKQ0KPj4+
Pj4+Pj4+Pj4gKyAgICAoaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgaXNfaW9tbXVfZW5h
YmxlZChkKSkNCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gI2VuZGlmIC8qIF9fQVNNX0dSQU5U
X1RBQkxFX0hfXyAqLw0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gSSB0ZXN0ZWQgdGhlIHBhdGNo
IGFuZCB3aGlsZSBjcmVhdGluZyB0aGUgZ3Vlc3QgSSBvYnNlcnZlZCB0aGUgYmVsb3cgd2Fybmlu
ZyBmcm9tIExpbnV4IGZvciBibG9jayBkZXZpY2UuDQo+Pj4+Pj4+Pj4+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y0LjMvc291cmNlL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
eGVuYnVzLmMjTDI1OA0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IFNvIHlvdSBhcmUgY3JlYXRpbmcg
YSBndWVzdCB3aXRoICJ4bCBjcmVhdGUiIGluIGRvbTAgYW5kIHlvdSBzZWUgdGhlDQo+Pj4+Pj4+
Pj4gd2FybmluZ3MgYmVsb3cgcHJpbnRlZCBieSB0aGUgRG9tMCBrZXJuZWw/IEkgaW1hZ2luZSB0
aGUgZG9tVSBoYXMgYQ0KPj4+Pj4+Pj4+IHZpcnR1YWwgImRpc2siIG9mIHNvbWUgc29ydC4NCj4+
Pj4+Pj4+IFllcyB5b3UgYXJlIHJpZ2h0IEkgYW0gdHJ5aW5nIHRvIGNyZWF0ZSB0aGUgZ3Vlc3Qg
d2l0aCAieGwgY3JlYXRl4oCdIGFuZCBiZWZvcmUgdGhhdCwgSSBjcmVhdGVkIHRoZSBsb2dpY2Fs
IHZvbHVtZSBhbmQgdHJ5aW5nIHRvIGF0dGFjaCB0aGUgbG9naWNhbCB2b2x1bWUNCj4+Pj4+Pj4+
IGJsb2NrIHRvIHRoZSBkb21haW4gd2l0aCDigJx4bCBibG9jay1hdHRhY2jigJ0uIEkgb2JzZXJ2
ZWQgdGhpcyBlcnJvciB3aXRoIHRoZSAieGwgYmxvY2stYXR0YWNo4oCdIGNvbW1hbmQuDQo+Pj4+
Pj4+PiBUaGlzIGlzc3VlIG9jY3VycyBhZnRlciBhcHBseWluZyB0aGlzIHBhdGNoIGFzIHdoYXQg
SSBvYnNlcnZlZCB0aGlzIHBhdGNoIGludHJvZHVjZSB0aGUgY2FsbHMgdG8gaW9tbXVfbGVnYWN5
X3ssIHVufW1hcCgpIHRvIG1hcCB0aGUgZ3JhbnQgcGFnZXMgZm9yDQo+Pj4+Pj4+PiBJT01NVSB0
aGF0IHRvdWNoZXMgdGhlIHBhZ2UtdGFibGVzLiBJIGFtIG5vdCBzdXJlIGJ1dCB3aGF0IEkgb2Jz
ZXJ2ZWQgaXMgdGhhdCBzb21ldGhpbmcgaXMgd3JpdHRlbiB3cm9uZyB3aGVuIGlvbW1fdW5tYXAg
Y2FsbHMgdW5tYXAgdGhlIHBhZ2VzDQo+Pj4+Pj4+PiBiZWNhdXNlIG9mIHRoYXQgaXNzdWUgaXMg
b2JzZXJ2ZWQuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBDYW4geW91IGNsYXJpZnkgd2hhdCB5b3UgbWVh
biBieSAid3JpdHRlbiB3cm9uZyI/IFdoYXQgc29ydCBvZiBlcnJvciBkbyB5b3Ugc2VlIGluIHRo
ZSBpb21tdV91bm1hcCgpPw0KPj4+Pj4+IEkgbWlnaHQgYmUgd3JvbmcgYXMgcGVyIG15IHVuZGVy
c3RhbmRpbmcgZm9yIEFSTSB3ZSBhcmUgc2hhcmluZyB0aGUgUDJNIGJldHdlZW4gQ1BVIGFuZCBJ
T01NVSBhbHdheXMgYW5kIHRoZSBtYXBfZ3JhbnRfcmVmKCkgZnVuY3Rpb24gaXMgd3JpdHRlbiBp
biBzdWNoIGEgd2F5IHRoYXQgd2UgaGF2ZSB0byBjYWxsIGlvbW11X2xlZ2FjeV97LCB1bn1tYXAo
KSBvbmx5IGlmIFAyTSBpcyBub3Qgc2hhcmVkLg0KPj4+Pj4gDQo+Pj4+PiBtYXBfZ3JhbnRfcmVm
KCkgd2lsbCBjYWxsIHRoZSBJT01NVSBpZiBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nKCkgcmV0
dXJucyB0cnVlLiBJIGRvbid0IHJlYWxseSBzZWUgd2hlcmUgdGhpcyBpcyBhc3N1bWluZyB0aGUg
UDJNIGlzIG5vdCBzaGFyZWQuDQo+Pj4+PiANCj4+Pj4+IEluIGZhY3QsIG9uIHg4NiwgdGhpcyB3
aWxsIGFsd2F5cyBiZSBmYWxzZSBmb3IgSFZNIGRvbWFpbiAodGhleSBzdXBwb3J0IGJvdGggc2hh
cmVkIGFuZCBzZXBhcmF0ZSBwYWdlLXRhYmxlcykuDQo+Pj4+PiANCj4+Pj4+PiBBcyB3ZSBhcmUg
c2hhcmluZyB0aGUgUDJNIHdoZW4gd2UgY2FsbCB0aGUgaW9tbXVfbWFwKCkgZnVuY3Rpb24gaXQg
d2lsbCBvdmVyd3JpdGUgdGhlIGV4aXN0aW5nIEdGTiAtPiBNRk4gKCBGb3IgRE9NMCBHRk4gaXMg
c2FtZSBhcyBNRk4pIGVudHJ5IGFuZCB3aGVuIHdlIGNhbGwgaW9tbXVfdW5tYXAoKSBpdCB3aWxs
IHVubWFwIHRoZSAgKEdGTiAtPiBNRk4gKSBlbnRyeSBmcm9tIHRoZSBwYWdlLXRhYmxlLg0KPj4+
Pj4gQUZBSUssIHRoZXJlIHNob3VsZCBiZSBub3RoaW5nIG1hcHBlZCBhdCB0aGF0IEdGTiBiZWNh
dXNlIHRoZSBwYWdlIGJlbG9uZ3MgdG8gdGhlIGd1ZXN0LiBBdCB3b3JzZSwgd2Ugd291bGQgb3Zl
cndyaXRlIGEgbWFwcGluZyB0aGF0IGlzIHRoZSBzYW1lLg0KPj4+Pj4gU29ycnkgSSBzaG91bGQg
aGF2ZSBtZW50aW9uIGJlZm9yZSBiYWNrZW5kL2Zyb250ZW5kIGlzIGRvbTAgaW4gdGhpcw0KPj4+
IGNhc2UgYW5kIEdGTiBpcyBtYXBwZWQuIEkgYW0gdHJ5aW5nIHRvIGF0dGFjaCB0aGUgYmxvY2sg
ZGV2aWNlIHRvIERPTTANCj4+PiANCj4+PiBBaCwgeW91ciBsb2cgbWFrZXMgYSBsb3QgbW9yZSBz
ZW5zZSBub3cuIFRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24hDQo+Pj4gDQo+Pj4gU28g
eWVzLCBJIGFncmVlIHRoYXQgaW9tbXVfeyx1bn1tYXAoKSB3aWxsIGRvIHRoZSB3cm9uZyB0aGlu
ZyBpZiB0aGUgZnJvbnRlbmQgYW5kIGJhY2tlbmQgaW4gdGhlIHNhbWUgZG9tYWluLg0KPj4+IA0K
Pj4+IEkgZG9uJ3Qga25vdyB3aGF0IHRoZSBzdGF0ZSBpbiBMaW51eCwgYnV0IGZyb20gWGVuIFBv
ViBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gaGF2ZSB0aGUgYmFja2VuZC9mcm9udGVuZCBpbiB0
aGUgc2FtZSBkb21haW4uDQo+Pj4gDQo+Pj4gSSB0aGluayB3ZSB3YW50IHRvIGlnbm9yZSB0aGUg
SU9NTVUgbWFwcGluZyByZXF1ZXN0IHdoZW4gdGhlIGRvbWFpbiBpcyB0aGUgc2FtZS4gQ2FuIHlv
dSB0cnkgdGhpcyBzbWFsbCB1bnRlc3RlZCBwYXRjaDoNCj4+IEkgdGVzdGVkIHRoZSBwYXRjaCBh
bmQgaXQgaXMgd29ya2luZyBmaW5lIGZvciBib3RoIGRvbTAvZG9tVS4gSSBhbSBhYmxlIHRvIGF0
dGFjaCB0aGUgYmxvY2sgZGV2aWNlIHRvIGRvbTAvZG9tdS4NCj4+IEFsc28gSSBkaWRu4oCZdCBv
YnNlcnZlIHRoZSBJT01NVSBmYXVsdCBhbHNvIGZvciBibG9jayBkZXZpY2UgdGhhdCB3ZSBoYXZl
IGJlaGluZCBJT01NVSBvbiBvdXIgc3lzdGVtIGFuZCBhdHRhY2hlZCB0byBkb21VLg0KPiANCj4g
VGhhbmtzIGZvciB0aGUgdGVzdGluZy4gSSBub3RpY2VkIHRoYXQgbXkgcGF0Y2ggZG9lc24ndCBi
dWlsZCBiZWNhdXNlIGFybV9pb21tdV91bm1hcF9wYWdlKCkgZG9lc24ndCBoYXZlIGEgcGFyYW1l
dGVyIG1mbi4gQ2FuIHlvdSBjb25maXJtIHdoZXRoZXIgeW91IGhhZCB0byByZXBsYWNlIG1mbiB3
aXRoIF9tZm4oZGZuX3goZGZuKSk/DQoNClllcyBJIGhhdmUgdG8gcmVwbGFjZSB0aGUgbWZuIHdp
dGggX21mbihkZm5feChkZm4pKSB0byB0ZXN0IHRoZSBwYXRjaC4NCg0KUmVnYXJkcywNClJhaHVs
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQo+IA0KDQo=

