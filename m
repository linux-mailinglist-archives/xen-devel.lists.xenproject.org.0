Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEA83BB76
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 09:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671368.1044674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSusV-0005f3-EX; Thu, 25 Jan 2024 08:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671368.1044674; Thu, 25 Jan 2024 08:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSusV-0005dB-BM; Thu, 25 Jan 2024 08:14:27 +0000
Received: by outflank-mailman (input) for mailman id 671368;
 Thu, 25 Jan 2024 08:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXBH=JD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rSusT-0005d3-Cg
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 08:14:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0201266-bb59-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 09:14:24 +0100 (CET)
Received: from AS9PR06CA0665.eurprd06.prod.outlook.com (2603:10a6:20b:49c::10)
 by DU0PR08MB8614.eurprd08.prod.outlook.com (2603:10a6:10:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 08:14:21 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:49c:cafe::89) by AS9PR06CA0665.outlook.office365.com
 (2603:10a6:20b:49c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26 via Frontend
 Transport; Thu, 25 Jan 2024 08:14:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Thu, 25 Jan 2024 08:14:21 +0000
Received: ("Tessian outbound 67699c3f02bc:v228");
 Thu, 25 Jan 2024 08:14:20 +0000
Received: from bc75081f3b19.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19E40153-13CB-4693-BCE5-27F88946C2E7.1; 
 Thu, 25 Jan 2024 08:14:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc75081f3b19.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Jan 2024 08:14:13 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VE1PR08MB5728.eurprd08.prod.outlook.com (2603:10a6:800:1a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 08:14:11 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0%7]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 08:14:11 +0000
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
X-Inumbo-ID: c0201266-bb59-11ee-98f5-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P9Eh/UgWlvAueuUasy04i0urfbbBm6+7/L6EyFT5ySPLyjlZWfPE3ZVBcFagdF690AX8Toxw5MKco1qjv8GdfFLgHUC3M+l5gzfgvWljWoDtHYs62J9AV39IoOwAvbtuVSfmwEkLh9iSQztUFOKS4TGTejwsChOEW3y+L87hdCmRu2BAGzELmU8czy4pDZUszyXzjsdkrVYw5cofLF31Xd4WfGwUBt0mJxyBgtd2jeBUsKYRxX1y14Q8LpbDOuzSpBfJV8WZ6+CWk7XuapdYCyAcypHrZ980KqsbBlVTIRRTu8nKHt3Xqyvu4z8oxSaPCxmHN9nJKyUrv25Zw3tzBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP+H53kxYLWzykxkSbENkcVzXQp0tirQrZogqVaHrNI=;
 b=M+AkAk2Cf5+VEhspYGfBhalr+vhoCO/NrwCHYQGFfhDYKp17fUw8F/2Lowr+SK59p/N5kD1uGn4a6WXYJPqfHh2TkiwaeWZmz4BZRuBGtLnTDlAyFqi2huUQPHAH1ONNDAXv8cOZABxSo3fjSu8oRDSB5RZTfDqZZP5Ly8wHYd9Fn4dX4Z+IJ1xu5TgV1x2xgCBIU89lpDkQZRTXPj9px2QF9rWq+7abAr9JviKafGxzi6qRh8XS6jcMeZmJMesnsj0Ozy5eNRUtkjG4zMwO6ap+wFvtCenSplMaza/gNSUMP73hneeLg5rzG2xLvN6Y6hU271/VUKzy5zG0M6c9Sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP+H53kxYLWzykxkSbENkcVzXQp0tirQrZogqVaHrNI=;
 b=d5Boq4pTGPovJyTDB1NqmVMgKecpE/gPcpcclL2P4mOOZebY/t8QFXY3kG7g21rBBPy5RTtGx0mUJ85CLDr2KpDxNXlaXJWEuW+wC8MnRO8tSow5Xp25xk5PDeNGDq9FTAeUtr3ezjoazIRwyZblZZWSqAIPWJFHgbRGOSywukc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ba8df456bae1c3a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXo+C6rcLmTw/ZcrP2H+1N9gYyiCfjNyzAn1PECnn3uDLbVPOpHg/1VPQYwFSqrUuf3v+2Hls3Qko+hP/ftlEqZWHMwCGQFJzMF5xYyy+E6MMldw6v+aDU/SNjDVjcNAq9di6670aIPHvfA0JyeImdw9pJZVqgV+BdB5qRcDp9R2sY6f8V0uvZEswd17mWfeCjX81VA1ujGfeuJTyNFqHpjig+6HjwVPhzPYov8WNHOAOcBfk0n+gw+STs88WXKopUGbExiYJnP5tklIH4kkDv3qMFTGMqdPy47yZ4GwqYB/xtxrxOaUFsE4KVQ/sVmQYUk2y/Wg+cqW54WwwCJ/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP+H53kxYLWzykxkSbENkcVzXQp0tirQrZogqVaHrNI=;
 b=Pl4lOg7KODEyAtbDWqyAHAP63qk0e3+HL4dVcRwa7XCByOvtTAJKklJpuMMUiKSDRC1VMQc4dd5Txuqbd5uSbSAzMdFlvJ7b6yttjnWW2ckfyhJKgrxI9MEVk7V7xV0iL/jqh5od+tA2nzKO9RSbwQgltOkhS1/m4gX61YJj9hqw6AyVRGKddofal6deH9dtSehK5Fe6IefZfYDY59uZi9ZG0a8axt72rOJL1JqofJcj+Vqai+1HXlAwJL9IsQN2GEShpnIHHxZZ07w013erDoTVw7hZJ1OWR1wZrsNVby1ikDXTxAguvxPZUUr3QGwHC9SFEooGwUemgNEyu9beXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP+H53kxYLWzykxkSbENkcVzXQp0tirQrZogqVaHrNI=;
 b=d5Boq4pTGPovJyTDB1NqmVMgKecpE/gPcpcclL2P4mOOZebY/t8QFXY3kG7g21rBBPy5RTtGx0mUJ85CLDr2KpDxNXlaXJWEuW+wC8MnRO8tSow5Xp25xk5PDeNGDq9FTAeUtr3ezjoazIRwyZblZZWSqAIPWJFHgbRGOSywukc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@cloud.com>, Elliott Mitchell
	<ehem+xen@m5p.com>, Paul Leiber <paul@onlineschubla.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dario
 Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Thread-Topic: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Thread-Index:
 AQHZ/gcaPQmWs3huW06NGLzfgAl1VbBVWRAAgIUTWgCAB8TBgIAEEyeAgAFsJwCAAo1CAIAAkx0A
Date: Thu, 25 Jan 2024 08:14:11 +0000
Message-ID: <5DA12CD1-9F65-43EE-BA11-0B4E45E3E44E@arm.com>
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
 <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
 <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
 <ZarcWQ6Ugwowy050@mattapan.m5p.com>
 <CA+zSX=Y=BsVEp3o6jRprn5sntWVA0Z6wNXUxtffDN+=fPv_Fzg@mail.gmail.com>
 <D2496DDC-78FA-4CC1-B7FC-EB62E506BC4F@arm.com>
 <211c5cbb-2269-48b6-91b5-3a1a8127ce48@citrix.com>
In-Reply-To: <211c5cbb-2269-48b6-91b5-3a1a8127ce48@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VE1PR08MB5728:EE_|AMS0EPF00000195:EE_|DU0PR08MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: dca1cc7d-ea1c-4dfa-c03c-08dc1d7da25d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oaeH+Ii29mhFazw3wHanR8xy5cbOw6/L2wrFqGHCnuWGAqz45T/Ko4nCDNociJrcrXUEAJLeek/drSJUQH0t2lrBVvQkSeuzTtYTdJrOUu2wOY6FCs5Mf1m5wPcj34QP7+1HwjnfeAnVwtMIJ54YM0EJnPWH0K25OVJyJwzJPKjpDjhW/AwcvfKe0SD4X5w4auUqnVAc/Khn/fRSEfHrQA7qxJ6oY52ICXqu4w5nhG+wI96a8hyALCd1t9PcMy9BE468DCpt3zFLtP63chGGPSbH9iOm/catkiHcPdR9ydzefr7s52bLDYKb4wSJHPifY583w1Kk+UK/+SKwWivCtvso+jiNoyyk8ImP5L5PceBeFkJqozZuMpAw6mtH3IrjVI42ZzSwlQO4ikWC/22QzFK/pQzDPIc30plBV/DSCgr7BE/rvmSYyiuGAmYw87djHwAmnYMiypi7IXzaDhHe761paviX6DBZX6oGOTdCLmJ0SPVV7qZev0q3VMtvYsiMiZdoicCoODQrK1AdxCIHF5o3PLnc3FERj9BiNAjWrq5kY7oLjHdN+gSipV4oYyzjNH2y5tTScoTH3OPsFPNVf4lQ5GDvRI1/JKFSbGCeI5sM+mvLAwLI0q/T8JaRxLAK9T4/lVw0gvaHt/xU33Oq3A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(122000001)(6506007)(53546011)(38100700002)(36756003)(71200400001)(2616005)(38070700009)(6512007)(2906002)(6486002)(478600001)(86362001)(33656002)(41300700001)(4744005)(5660300002)(66556008)(66946007)(6916009)(66476007)(316002)(66446008)(76116006)(64756008)(54906003)(8676002)(8936002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B02BE70CEAB1BE45BF9C6CA60D923DDC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5728
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	36433fca-8757-40ad-4851-08dc1d7d9c6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Kh1/K+lNOmMvtsAOzTAGhYEme5ALm1bnXPjGOt76fNFbvUy78G1IHVSdS3YDwQ4nMJhh1fYEE2Er91VpCkvjAafEDQs32mf8BrI0VhM70Sh54KlybYv/A2iEVZSqsnJ0o0NiOQleHHOgQWfIMPxkkgmpuW9UcU/q+FmmKJp/CqWTMBfLdly9hx4EV7os1jXRwnFRi2zWvQMcH15ELgaRzOhFO+NJHCGM7WjEbZLLCXdckkEJffVfRFOTza7fP1VaLVvn3JQET5CR1R6YCUKNs73KmzmfwcV2SkyMf3JXOEQsNOZMPoLtFD67HcetA6b8yuhq65FwyTdis/LrcEcFkFwwgd3b0tcqjY6B1aRdYuf5ePIGRhsBq3TPIv+qogJTlvaDf1vP/h/a8K8U3PPnlUShSir35rnnopD4z1p0XZOifBx96kwuTcwDXQ0ZGxfK8qyV53how9ZGTNvlcSFBlsPQckfbvkbQAxSH/r5rHmanF85Kk7lAuRrHLpWIv/eROHSlsAqI81Z6bNUluxNODpYtxLiKmv0DbjfzpxYDSNnH0kw3vqbhce98Ga03eUZBoRjdLpxoc82+zhtqvGAt19KWHG0Pk0qAnt5mTkL7KWwXYwl0J/2ZfPvnApGqbgqituxXDWZiz8l3Zv0eLuKvf4t5UplFiqOO9cXXW9EKFIoDiqtOhX9kAfUSLqx4MweNi0AQ6pVTEje2le/l7eghrE+RlpEhDfgO7YpVGqmDS1q+UO4e6CIJUrw+tHAMQf9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(1800799012)(451199024)(82310400011)(64100799003)(186009)(46966006)(40470700004)(36840700001)(41300700001)(82740400003)(356005)(81166007)(54906003)(70206006)(316002)(70586007)(86362001)(8676002)(8936002)(53546011)(6506007)(478600001)(6486002)(40480700001)(40460700003)(36756003)(4326008)(6862004)(5660300002)(36860700001)(33656002)(2906002)(4744005)(47076005)(26005)(2616005)(336012)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 08:14:21.1313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dca1cc7d-ea1c-4dfa-c03c-08dc1d7da25d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8614

Hi Andrew,

> On 25 Jan 2024, at 00:27, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 23/01/2024 8:29 am, Bertrand Marquis wrote:
>>> Thanks for raising the visibility of this.  I'm not familiar with ARM,
>>> but if I were investigating this I'd try to figure out what the
>>> "unhandled" error messages are.  "gnttab_mark_dirty not implemented
>>> yet" looks pretty sus too, and also sounds like it might be something
>>> ARM-specific.
>> I tried to explain those and they are not the reason of the problem.
>=20
> The "gnttab_mark_dirty not implemented yet" printk() should be deleted.
>=20
> It's /* TODO - logdirty support */ in a form that is actively unhelpful
> to people using a debug hypervisor to debug other things.

Could make sense.
It is true that this one appears in all debug log but it might not be
very useful in fact.

@julien and Stefano: what would you say ?

Bertrand

>=20
> ~Andrew


