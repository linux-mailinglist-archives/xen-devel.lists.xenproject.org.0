Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1E589E36
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 17:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380554.614758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcSF-0004xr-9D; Thu, 04 Aug 2022 15:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380554.614758; Thu, 04 Aug 2022 15:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcSF-0004ug-67; Thu, 04 Aug 2022 15:08:07 +0000
Received: by outflank-mailman (input) for mailman id 380554;
 Thu, 04 Aug 2022 15:08:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HjU9=YI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oJcSD-0004uH-W2
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 15:08:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80078.outbound.protection.outlook.com [40.107.8.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d1e95f9-1407-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 17:08:04 +0200 (CEST)
Received: from AM6P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::14)
 by AM0PR08MB3697.eurprd08.prod.outlook.com (2603:10a6:208:103::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 15:08:01 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::c6) by AM6P191CA0001.outlook.office365.com
 (2603:10a6:209:8b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Thu, 4 Aug 2022 15:08:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Thu, 4 Aug 2022 15:08:01 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Thu, 04 Aug 2022 15:08:01 +0000
Received: from 755d239f8905.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CDA7AE3C-9B51-4B77-A72D-D045A2F2BCF1.1; 
 Thu, 04 Aug 2022 15:07:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 755d239f8905.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Aug 2022 15:07:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3370.eurprd08.prod.outlook.com (2603:10a6:10:41::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Thu, 4 Aug
 2022 15:07:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 15:07:51 +0000
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
X-Inumbo-ID: 3d1e95f9-1407-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TC3+bDTfCJruvuA3UA/C4EiLJbvdGdzmy1GDruamGvI8WaQoElHR/AQXCOKf8nEBsiahlrxo+xMQZ9KetX2/BlbeZP/cVSSPvxH3tbu8OpyQRw86XXbcRTZPNQGLVZ+9JyJXCB7sqM+qbHfNA+rvBbITUr1u/Sf+w5v37MFS/1OIv6HaIBhMB1qZdXLdbvIsbPkv6Spkt5UimLeuebzO2dBWWejk9OYQcmm8UxAJzQ+1tEitNHH1jvCzpI8KFL81cyeVfcafJVaBPbC/T3sGznc8qEai6vbLDUQfu3Xdp2etks4Lj/omU9G5S23Gc3ZyrIiySUAsfJZZthZ7CrA9Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3HJgREWPQHHrprlmL/3n5Py3MtRlKxKH8p/s3OyqpI=;
 b=ekRcdfTBMMKxxamc5RP4oHbxmJhuttT6VLQO+3Qj48zZLUPiTG52jD3nndM7znBpPB42/zYPw+Kiu9UO0ml3H/yfnr+n2Pko+Al/garLs0RdFs3F9eiU3XxqLoRlBfwICM0+TlluWqYCPZc0c6OrSmtPvRDVsWkrGJOtOhb5X90SGv8VHF5beetv5pWX/KjIupLGs7Kv5O3cYj8yPonaiu2c0KFj7+ge7LZugDBMMNilNElrhyP9OZCWg8HsxoHSs/Y+lGiS8IfcQMX8Vt7x97Orhq2trfBkpGbKgOhnMG1C1QWdpez7gQ7NXEz7xC7PKRlrMG359Msldx5XEXz5kQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3HJgREWPQHHrprlmL/3n5Py3MtRlKxKH8p/s3OyqpI=;
 b=sPIeSrfq5dIOSIMS0Rw8+/1bPFFzMTKtDkc4CLYAb9qSeRkxywYlN3CstbOXq4EnKmFH2oGAKYFxf3x4g3ZgpMKz8yisJiE9/+aJNckQMTsoFj8Bs6sPstpU6UmH5iu+oBSWQIor6bz0FR3Yqw0UJkHel0/ZFxFWcDBe3epF1UI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d41f0af7d12bdc2c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADOY0/rNzr/zvwgQEaWKdKRCeKCU50Z82Lh4Cz8Ms6/6MHXcrxxIRI7kowEkoN+CA1bAN/w0gsPD+0SB1U2pYacSIhB9O45i9u04z4T1OTzh+mKNNDZTH26xVl9k+KCTqFgbRSEeIS3Mba03DUoxTYGRFn6RmOQl4jwW0dzDSL7NCkWxZjbt790YpM2aeuBGZIBuFdgWJb+KGm+bT4bInbFmb/za26LypBWRjIO87A6QypnXg7GSPYGSDGUOa8V/fKypzgIPRm6Hj0TYf8NkbMLAfJQolNCYgINOY6hjDPQZLNh2me5RPGvCk4S1terfzinmwHDPPo9yCBbi9k9opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3HJgREWPQHHrprlmL/3n5Py3MtRlKxKH8p/s3OyqpI=;
 b=iyEHOyuhmWtad6rfZc7h3+Ua59cOgx2uixCp8xJySDvibQOr21kU56Qz4EAuPrJigYgMMvhyn32rG/HDIdA04A2hs1xViOQiShQD2VYN95fjLduBcnMCdmx+GKAnAZ8VmYvvCAdqumU/1bMiRCm53KzM1BadCVKyHV24786Y1eMpbagvM7g/2TfTdkmYTS3fI6tgC7nElGUsCcCMHd3dVHyQmB+PQJbM2v1beNlybF/P+VoTVGkbj5P7Ty6KRGWf2cdx8PEEJwa1iDMhmYZnXXI8OccQi68WOuchKQuC/SVnpE+zLw8f2e1M2+S1lGL3MTKMX8BFtcWK4iyXYTV/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3HJgREWPQHHrprlmL/3n5Py3MtRlKxKH8p/s3OyqpI=;
 b=sPIeSrfq5dIOSIMS0Rw8+/1bPFFzMTKtDkc4CLYAb9qSeRkxywYlN3CstbOXq4EnKmFH2oGAKYFxf3x4g3ZgpMKz8yisJiE9/+aJNckQMTsoFj8Bs6sPstpU6UmH5iu+oBSWQIor6bz0FR3Yqw0UJkHel0/ZFxFWcDBe3epF1UI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] doc: Add git commands to generate Fixes
Thread-Topic: [PATCH] doc: Add git commands to generate Fixes
Thread-Index: AQHYp0dt1L2bMKjw90+5sUGUPO+Pi62ewIcAgAAY2IA=
Date: Thu, 4 Aug 2022 15:07:51 +0000
Message-ID: <CE812F61-3A0D-4E5B-8FC6-54FA40F84E14@arm.com>
References:
 <b57628b8cf8355a5f4f32e6ea577689ae7450a69.1659537759.git.bertrand.marquis@arm.com>
 <688de547-896b-da29-9137-44cf2c20227a@xen.org>
In-Reply-To: <688de547-896b-da29-9137-44cf2c20227a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fe4722fb-bf69-4528-515f-08da762b1fc5
x-ms-traffictypediagnostic:
	DB7PR08MB3370:EE_|AM5EUR03FT012:EE_|AM0PR08MB3697:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 11DI5KBvpQJ0e29hP2CzIEHceIfy0DcUU/0QUT2D5duMBIVAa0+kVdSX/sKX8KyR3goC1FgD6saeSHfXFu2WzoxmPGsYvDZpbCaROA1AXHC+ClFdSb/iMPZgOZ1Gnuq7ABk+u0L9m9xKOCkqooLc3Vt9Cjl85gH1Xr5pTwqLd+V0G9QlOJTVbbPWA/R12QvEB2BFR5PpBXB+BxiLKzNZA7pEEA0VeXFgFOSOszYSGLhUihU80IS/RTcTWNDNKfMKiMzT388SZcA6MJ+F+o5DD5Sxr7pJKvrFmisCBRX3bkTrHK422LKk8hy2Kktxu71fxdZ2EZovQxDMzRUHpIS+yOa149bAs5KviV+JiqfBUAbxef5blbnGf9b1hwiOfugjCBHRsOYsCwwwBgD9+/hBh3jrOkr0vcvCFHDH4z+kXmDzU7EZ64BR96hgh9YwSK/KoqQZ7IZOHCnTp9MnBYLJTE95bYLqpjrFpW3Gz6xHnliAleadQThfmnRmV4UeJMSL+RsjVf82xwqf7lyiFK3aNar06FYaUIVR+oPE8DT1xEsP1TMFsl+54S/Tttp2WLnTLnldOw44F8ceSCkuO0DxzsoPXrhuvUwR7T3HFrByh7fcfPiA3bV8mRA5lh4o6xMHvGmv5myeKZqB40/InP58i2hVnlKpuiZ5b2zexB/i19Q8oUZivgF0E30aNcG8FmcclzFcA+ouBuRtEVBi6BRqzkoEf/V365HRYUrSC7EIqqB+5+BPxlxlEjc0X+9MVrZBddDaV9V51b90ezCv6HPrGMS+lbAIpXxM39zv5yLaMoR68kZ/CClclr+kg1HenIyFQNYQsYlyjG2k6uQKDtOwxQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(478600001)(26005)(122000001)(38100700002)(316002)(6512007)(71200400001)(6486002)(186003)(2616005)(54906003)(8936002)(41300700001)(36756003)(53546011)(6506007)(2906002)(6916009)(33656002)(8676002)(76116006)(64756008)(66946007)(66556008)(91956017)(66476007)(86362001)(4326008)(5660300002)(66446008)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <526B9735E9D30F4AA98C43A330CAC191@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3370
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc9512a5-aaf4-44bb-ff00-08da762b19eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jEgqOHxXVTaUCdKAfVfD3Lglj1t4tCWy/UI1fnq829v8Qt1d58uLSCkdfwIEj2LMSFl8UBUe7d/l8Cp9DQoiw2I09bp7k1bdGP8UmqR900hQNRwPXkHThtMGdhqKuqxapu92MAWWUb+xE2Jf16x9aPdybIocAyDP57N9swBpIJHH5yAYKws0KU5b7aVhoBQb+I9WnIJuSuxX4e5n9epUjvhyUcAD3iZUsWdtSLd9r5onA/7DdmQG2GxzWc93Jsr0qxdkmgmJW+0fQxDpcRQ3x+vRISmyK7XnJo20RRq+2PVZN7/WOzdxj8FGBUaXqC1cDYLkk94XTC4aqkzT7GRpql/1OU6t1ElWwmWWcL9Iekh6cuZ9OzsOCURK4hvA2goDeSjDuhfAB8vJij1o+bmlUJR+KVsfr1f+0A+wwZfmSNWPSfX2gfDs1LFL/Naa7icoWTLbHskwVDoDX5VZ4rSfb7ra7Vqnp4SJc4o+o2joqD7ozXkoJxwwIlEZZLwrT0YYMclKWUJt3NHwjLRzjILf1NcYNfANrbulOXJPnxrN4F3h2dbdrVjM5PzMEHYuCzYYoiwdgWd1Q2PKGPl8Y9Ze4Yl9sK6eY4DtWo/1TzK2M4LRHTFCWb6ZrZdiczWDXXQoD5U7yI3dyrEQeEVEtZvzlgF8yQEMcuW8OTjAVhDrB2hop3nDfMEfIQocCt+6At+BDBqK5wxTG4K/rjkbwu0HUToBOes08n+2THEy6+9wfPkcoCrBVszks/h6J3MRKEc143b+YHlGb/WC3eMZPmXpjezdTTCbmAVisFcPE02f7dCoJs83VYpDWyIx37iPx2kS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(36840700001)(40470700004)(186003)(2906002)(47076005)(40460700003)(336012)(41300700001)(26005)(6506007)(53546011)(33656002)(356005)(82740400003)(2616005)(6512007)(86362001)(81166007)(40480700001)(82310400005)(36860700001)(6862004)(5660300002)(36756003)(70586007)(4326008)(70206006)(8676002)(8936002)(6486002)(316002)(478600001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 15:08:01.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4722fb-bf69-4528-515f-08da762b1fc5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3697



> On 4 Aug 2022, at 14:38, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 03/08/2022 15:43, Bertrand Marquis wrote:
>> Add git commands examples that can be used to generate fixes and how to
>> use the pretty configuration for git.
>> This should make it easier for contributors to have the right format.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  docs/process/sending-patches.pandoc | 4 ++++
>>  1 file changed, 4 insertions(+)
>> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-=
patches.pandoc
>> index 7ff7826c992b..9c4c4655323b 100644
>> --- a/docs/process/sending-patches.pandoc
>> +++ b/docs/process/sending-patches.pandoc
>> @@ -102,6 +102,10 @@ E.g.:
>>        Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting cer=
tain indirect calls to direct ones")
>>  +If git was configured as explained earlier, this can be retrieved usin=
g
>> +``git log --pretty=3Dfixes`` otherwise ``git log --abbrev=3D12 --onelin=
e`` will
>> +give the proper tag and title.
>=20
> Rather than "proper tag", do you mean "commit-id"?

Yes you are right commit-id is better.
Can you fix on commit ?=20

>=20
> Other than that:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20

Thanks
Bertrand

> Cheers,
>=20
> --=20
> Julien Grall


