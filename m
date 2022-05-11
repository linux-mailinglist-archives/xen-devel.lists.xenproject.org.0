Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93436523676
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:59:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327022.549720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonnB-0003GT-ML; Wed, 11 May 2022 14:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327022.549720; Wed, 11 May 2022 14:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonnB-0003Cz-JI; Wed, 11 May 2022 14:58:21 +0000
Received: by outflank-mailman (input) for mailman id 327022;
 Wed, 11 May 2022 14:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KGj=VT=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nonnA-0003Ct-0t
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:58:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca66f277-d13a-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 16:58:18 +0200 (CEST)
Received: from DB6PR0202CA0045.eurprd02.prod.outlook.com (2603:10a6:4:a5::31)
 by PA4PR08MB6078.eurprd08.prod.outlook.com (2603:10a6:102:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 14:58:08 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::3c) by DB6PR0202CA0045.outlook.office365.com
 (2603:10a6:4:a5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 14:58:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 14:58:08 +0000
Received: ("Tessian outbound c1f35bac1852:v119");
 Wed, 11 May 2022 14:58:08 +0000
Received: from d521a7cde713.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED9A6D0F-7AA2-4159-9937-109F8C9CF490.1; 
 Wed, 11 May 2022 14:57:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d521a7cde713.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 14:57:57 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 DB6PR0802MB2200.eurprd08.prod.outlook.com (2603:10a6:4:83::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Wed, 11 May 2022 14:57:56 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:57:56 +0000
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
X-Inumbo-ID: ca66f277-d13a-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=juOP6K2fvmu3onDl7+QX5K+T0lbLN43Z/RTL+OMpBL3z8AsOS5/YZMZwARF7d/SJRBR7tcPrSq4bSrMqrz2KWO9l61O3TCnLF7UWjo6rfBdQmWEZVWde9Ahi9GqxJo6LeqFvVtLAkKe9bl95XL/5C1ywG5SKVOcpMlQ23pHuxOlm1U+/H4NlPw85xNETiECA0a1wbv/guOT9AUnMl6czREMB8w2ifTGZVBHzSSwl7clgsBozUvrTS1Mx6icQ63f5JdOWGhXNISaIShNFj0oO/PpYtmyAFLtCo+c977Llqi0Ihie5Z/2cSK8TgHU6Jbyx942Q4VnLl8OgmGinj0IEFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLHtBLWkBOqd+gMLtMaMwYdsUIXaCyT1Ym12+p8w9Lc=;
 b=Aq/HQTq3k+JIKgNPtTQvMPzXKijk3XOMA+NkJCRZJnxhDOpytn2xD/8RFZkE95eUKnKIMZ7okXgfjcEbjk2NiZYCXDWhIUYbJROZ+5F4ondIIOJH3PcW6awyNW2LmS2KqaTfWgmLViFxL0EozspbxVujuMSc9b0B+cmm4TsZcYGtDjsD/2c1sAlvWHqx+TGkwHioISnJebU09RhHqIM0DqVWoAV8gm1Ztd22Ekh0AXMAG7tOEtyArufX1zv0Q19DvRC0QEQzS4vLaI1Gdut5zer082+nYZgPw5yRo4n858eqBg6FnfOxAjGJTPeqvvabN1qudzLFM8WLuFj+DNhmvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLHtBLWkBOqd+gMLtMaMwYdsUIXaCyT1Ym12+p8w9Lc=;
 b=W44cBJP3Qz6SZf3Pc2DemWGP8BX6nmTNRMzSgsgRlKZY6S9YrxwbJ/gyC6RzExHymANFtJNcu63sgCFWEds0UwLH03502uH5VH8TyUztZ6J81eAI7ewmKOvskUp2OId8c7U6qovYULLDUCTXC0FEnMfueDVaV089/uX76QhAmkw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 67e6f56e53907984
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+iwQ5UMjqzSMT27ngk+/Lx+RgIikTm0dfhEfWmPu/s13LNp9xDb9TBhJKOyXzjDb53q7cHy5QskCmHfOc4K5A94ZdALpnlfi7q5KN4kMNPC69vm/HWmWKrdSLr2ZAaweVMJh/anRxygoxtWTwyMK6X695cjb91SYKaijYEzPfwBeqYYaGAQW5VIdMBO6YGUCaIwQkf+39hbfHFgstbkX1VFIhRe09xu0nttD9RgSNxHnFAg9UcZiuliTiqb88/Utkbq431m9V1dTM3E+CLBeM4F2tbgttwmzOoK4EcxRjOo2xfW8+MvAtiYqdbQznLZIc55TlJN8GELMWVeYoW1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLHtBLWkBOqd+gMLtMaMwYdsUIXaCyT1Ym12+p8w9Lc=;
 b=OhChF3w6LHFLnj80rpsnUGFy4AclDmfSDjNgfreT4xg6m6qKS0UKsR9WWOVK2KI9GWEgUClTgZ6MlUhjdgt9bTiWuGKGuPFNVjZrkLs7DschFFKQEwZR01bIClhGRkVF0JtMLp76fDg14c3MMe1U0xTQFK73bAMC0eA+Bo7RONc4zynGhAM49mqXcCAtcydHJ97w5zyzvzLyGc7w4BEVqjkHygWEH3ICrViscDm6fdKed/mJRyCTR2L9MMexs+C3U2SzQDYdcFPIGLQkvODCxFhWQAZdwGnfmsx/GK8aOw4tkb/xfI4UP/iJoLqNckQ+F85Dkw8XmBnOUh2HQEtVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLHtBLWkBOqd+gMLtMaMwYdsUIXaCyT1Ym12+p8w9Lc=;
 b=W44cBJP3Qz6SZf3Pc2DemWGP8BX6nmTNRMzSgsgRlKZY6S9YrxwbJ/gyC6RzExHymANFtJNcu63sgCFWEds0UwLH03502uH5VH8TyUztZ6J81eAI7ewmKOvskUp2OId8c7U6qovYULLDUCTXC0FEnMfueDVaV089/uX76QhAmkw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Luca Miccio <lucmiccio@gmail.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Topic: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Index:
 AQHYYBWH2ZK8TL5ueU+mSOXui+uVga0YVmwAgAABRACAAP62gIAADosAgAACPoCAAAaAgIAAAkiAgAAaewCAACa3AIAAHamA
Date: Wed, 11 May 2022 14:57:56 +0000
Message-ID: <3AC1200B-4F64-4828-8EAF-E6039E3613F1@arm.com>
References:
 <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
 <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
 <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
 <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com>
 <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
 <9707ACA4-711A-4691-BA2A-FCDDAFFD9DE8@arm.com>
 <10151DF3-A3C9-49FB-8F2B-B36407E5CE82@arm.com>
 <573e94c4-7de0-e442-c9d8-559b55ae3144@xen.org>
In-Reply-To: <573e94c4-7de0-e442-c9d8-559b55ae3144@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9fc62071-adbc-4259-283b-08da335ea92c
x-ms-traffictypediagnostic:
	DB6PR0802MB2200:EE_|DBAEUR03FT019:EE_|PA4PR08MB6078:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6078310AE2F4C6ABC3568275FCC89@PA4PR08MB6078.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WWtjcqbVxfn/jrKNjHzCNscGVMlx5EpSCOLkqcQQt+T/FBOOItkFEVYVPZyJ+DLXpHbOAipLrLkJ/zjHDZO3dXuM1mXjUXandK3fSyyoXbxjs2PqlpQ2tl01t07gdPmoRr2UqcAvPYAY/Cst/bXJXUsFEOGTVG5tjxA5DD5DuOM35pcouYBKP/eVFZVK01TGPXTzacX/u+N1IXY01hDyxrrDyMhJjpJwqZarti4CNtGU7Y8W4c+hd90b+idoYvjN+JqbS3MyxR9D1sB8jR4Ja+iNPZyNRIUT85S/s9v04qc8A6zUFF2Xr4NC+h+it5VFTTt1aS+tOIIAZE6QUnll+5bxexKICc7Suj64u0+7rjrURqgSmCfj0qOcoylnChA6DtZu8h/zAfBZFtyiyugzBV9kO/sePhogQlOuZ0n7U1+vVGHKI8YrshwCzTuTOTHQ4pLMR5Woj9J1OY6JobDNmyQFOiunRi8f9vsRtoR4tbrYy/CG65sBhUorsqASai9oXM3TJAyojgiIpL1mELtCar0IJ+FYJedU0aMvNfk4VdTSQb5Xu6QI0yb/b5VAta+FponhoNLLb/Abj46WcjzDh7gPgaCp1M5DXL2adikhBRLGYpuGMF778BwkVqodM6cgEtujZpM8B/4KNFdce4/7tzaYpFTgbJCZVjwBeRXwlMzeN7WFLNpn2Gv+uB07c7QHIWyLTzwlY4vjhs2Sr9u0m88LhHk/yPo5akI0rZbGeGXz7Lb+7yb8TBXDQzonTR+sPdvPVcOUkz1aftkEcK12YA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(33656002)(53546011)(8936002)(71200400001)(6486002)(26005)(2616005)(5660300002)(66476007)(2906002)(186003)(54906003)(6916009)(38100700002)(66556008)(86362001)(316002)(36756003)(76116006)(122000001)(66946007)(91956017)(64756008)(83380400001)(508600001)(4326008)(66446008)(38070700005)(8676002)(6512007)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F9071E37D82D74A92BCB97B40214EB8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2200
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebbb488f-bd42-4c0b-3030-08da335ea1d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tbcbzJhPBaGOUl2a/KeF3NM9bzbVOgcU6m9Lfft3g0Hz2K2z7eKa/hPFKyXNw00JuUfQOisnZY4mQvkUN/beNjxC8p/w/gdXncnVKHdxq0J5JhxOukAsOeSyR8ZGhDnf28O3hLm6OfC+ofPOy6iOFOg2cHNo/ssg/Vta4VtqWS/eQSdFu6dhK2/nGydHvFbyIeo4KEon24FhOM6zUpwRHSWp2xJl6vq+AuMaD/O1ecWnK76gyCcWxXLKPvd1RdBbwY36A0quPHC5HHncYBwXwuehiovsnvouNXz51HDaFYzYn1m5okAsIawOzbtdla5P1TUI1b/n1M+T0IfQT5YWIlqIFuqopnF7TAIfaHlHM3NEi7LosMkLcNkSel0wyhJRPq4RKFsapMgPkqa8mkvxhXapgDyGebs9v3PyhlUcAP6KyXQQcCjF4cK7C/4K5gtslzLrXIfkxHIihaJUWopvQ29r0um38yEVl5YSLniSD4+rCpgc/2hFj6BpiCygTYBxtthBxfiDogiF2W0TsNmfj54ICk3rtSgSMKdpSR3GZ2CX9driSedxqt4G2f/Zcd7CPXGENOqcSj5HOU+mwb1odQXOppmcCAMZrzGRyMX9yilpnf7IoHGnH5I0anSE0/BofxSgO1LIooVQf7HiNLjFrUqALSu5uxe6kVOzcolCOVM/WphRXOEV/LXi6emPCWyu+xcjn75gj7ePGGA2eE5NsQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2906002)(508600001)(356005)(36860700001)(6506007)(186003)(86362001)(8936002)(336012)(2616005)(107886003)(36756003)(6486002)(70206006)(54906003)(33656002)(26005)(70586007)(4326008)(8676002)(6512007)(316002)(40460700003)(6862004)(47076005)(53546011)(81166007)(82310400005)(83380400001)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:58:08.4376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc62071-adbc-4259-283b-08da335ea92c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6078

SGkgSnVsaWVuLA0KDQo+IE9uIDExIE1heSAyMDIyLCBhdCAyOjExIHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMTEvMDUv
MjAyMiAxMTo1MywgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gT24gMTEgTWF5IDIwMjIsIGF0IDEw
OjE4IGFtLCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3Rl
Og0KPj4+IA0KPj4+IEhpIEp1bGllbiwNCj4+PiANCj4+Pj4gT24gMTEgTWF5IDIwMjIsIGF0IDEw
OjEwLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhp
IEJlcnRyYW5kLA0KPj4+PiANCj4+Pj4gT24gMTEvMDUvMjAyMiAwOTo0NiwgQmVydHJhbmQgTWFy
cXVpcyB3cm90ZToNCj4+Pj4+PiBPbiAxMSBNYXkgMjAyMiwgYXQgMDk6MzgsIEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IEhpIEJlcnRyYW5kLA0K
Pj4+Pj4+IA0KPj4+Pj4+IE9uIDExLzA1LzIwMjIgMDg6NDYsIEJlcnRyYW5kIE1hcnF1aXMgd3Jv
dGU6DQo+Pj4+Pj4+PiBPbiAxMCBNYXkgMjAyMiwgYXQgMTc6MzUsIEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBIaSBSYWh1bCwNCj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4gT24gMTAvMDUvMjAyMiAxNzozMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+
Pj4+Pj4+Pj4+ICsgcmMgPSBldnRjaG5fYWxsb2NfdW5ib3VuZCgmYWxsb2MpOw0KPj4+Pj4+Pj4+
PiArIGlmICggcmMgKQ0KPj4+Pj4+Pj4+PiArIHsNCj4+Pj4+Pj4+Pj4gKyBwcmludGsoIkZhaWxl
ZCBhbGxvY2F0aW5nIGV2ZW50IGNoYW5uZWwgZm9yIGRvbWFpblxuIik7DQo+Pj4+Pj4+Pj4+ICsg
cmV0dXJuIHJjOw0KPj4+Pj4+Pj4+PiArIH0NCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArIGQt
PmFyY2guaHZtLnBhcmFtc1tIVk1fUEFSQU1fU1RPUkVfRVZUQ0hOXSA9IGFsbG9jLnBvcnQ7DQo+
Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gKyByZXR1cm4gMDsNCj4+Pj4+Pj4+Pj4gK30NCj4+Pj4+
Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiBzdGF0aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tVShzdHJ1
Y3QgZG9tYWluICpkLA0KPj4+Pj4+Pj4+PiBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5v
ZGUpDQo+Pj4+Pj4+Pj4+IHsNCj4+Pj4+Pj4+Pj4gQEAgLTMyMTQsNiArMzI0MywxNCBAQCBzdGF0
aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tVShzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4+Pj4+
PiBpZiAoIHJjIDwgMCApDQo+Pj4+Pj4+Pj4+IHJldHVybiByYzsNCj4+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4+ICsgaWYgKCBraW5mby5kb20wbGVzc19lbmhhbmNlZCApDQo+Pj4+Pj4+Pj4gSSB0aGlu
ayB3ZSBuZWVkIHRvIGRvIHNvbWV0aGluZyBsaWtlIHRoaXMgdG8gZml4IHRoZSBlcnJvci4NCj4+
Pj4+Pj4+PiBpZiAoIGhhcmR3YXJlX2RvbWFpbiAmJiBraW5mby5kb20wbGVzc19lbmhhbmNlZCAp
DQo+Pj4+Pj4+Pj4gew0KPj4+Pj4+Pj4+IH0NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gSXMgdGhlcmUg
YW55IHVzZSBjYXNlIHRvIHVzZSAiZG9tMGxlc3NfZW5oYW5jZWQiIHdpdGhvdXQgZG9tMCAob3Ig
YSBkb21haW4gc2VydmljaW5nIFhlbnN0b3JlZCk/DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4gSnVzdCBi
ZWluZyBjdXJpb3VzIGhlcmUgYnV0IHdvdWxkIGl0IGV2ZW4gYmUgcG9zc2libGUgdG8gaGF2ZSBu
b24gZG9tMCBkb21haW4gc2VydmljaW5nIHhlbnN0b3JlZCA/DQo+Pj4+Pj4gDQo+Pj4+Pj4gWW91
IGNhbiBidWlsZCBYZW5zdG9yZWQgYWdhaW5zdCBtaW5pLW9zIGFuZCBjb25maWd1cmUgdGhlIGlu
aXQgc2NyaXB0IHRvIGxhdW5jaCB4ZW5zdG9yZWQgYXMgYSBkb21haW4uDQo+Pj4+PiBTbyBkb20w
IGlzIG5vdCBtYW5kYXRvcnkgb3Igc2hvdWxkIG1pbmktb3MgYmUgc3RhcnRlZCBhcyBEb20wIGZv
ciB0aGlzIHRvIHdvcmsgPw0KPj4+PiANCj4+Pj4gSW4gb3JkZXIgdG8gYWxsb2NhdGUgdGhlIGV2
ZW50IGNoYW5uZWwsIHlvdSBuZWVkIHRvIGtub3cgdGhlIElEIG9mIHRoZSBkb21haW4gd2hlcmUg
WGVuc3RvcmVkIHdpbGwgcnVuLiBTdGVmYW5vJ3MgcGF0Y2ggaXMgcmVseWluZyBvbiBYZW5zdG9y
ZWQgdG8gYmUgcnVuIGluIERvbWFpbiAwLg0KPj4+PiANCj4+Pj4gVGhpcyB3b3VsZCBuZWVkIHRv
IGJlIHVwZGF0ZWQgaWYgd2Ugd2FudCB0byBydW4gaXQgaW4gYSBzZXBhcmF0ZSBkb21haW4uDQo+
Pj4gDQo+Pj4gT2sgdGhlbiBEb20wIGlzIG1hbmRhdG9yeSBhdCB0aGUgbW9tZW50LCBJIGFtIG9r
IHdpdGggdGhhdC4NCj4+PiANCj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4+PiBJZiBub3QsIHRoZW4g
SSB3b3VsZCBjb25zaWRlciB0byBmb3JiaWQgdGhpcyBjYXNlIGFuZCByZXR1cm4gYW4gZXJyb3Iu
DQo+Pj4+Pj4+IE9uZSB3YXkgb3IgYW4gb3RoZXIgd2UgbmVlZCB0byBzb2x2ZSB0aGUgY3Jhc2gg
YnV0IGlmIGl0IGlzIGZvcmJpZGRlbiB3ZSBtdXN0IHByZXZlbnQgY29taW5nIHRvIHRoaXMgc3Rl
cCBlYXJsaWVyIGFzIGl0IG1lYW5zIHRoZSBjb25maWd1cmF0aW9uIGlzIHdyb25nLg0KPj4+Pj4+
IA0KPj4+Pj4+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgY2hlY2tlZCB3aGVuIHBhcnNpbmcgdGhl
IGNvbmZpZ3VyYXRpb24uDQo+Pj4+PiBJZiBkb20wIGlzIG1hbmRhdG9yeSB5ZXMsIHdlIHNob3Vs
ZCBzdGlsbCBtYWtlIHN1cmUgdGhhdCB0aGlzIGNvZGUgY2Fubm90IGJlIHJlYWNoZWQgc28gYW4g
QVNTRVJUIHdvdWxkIGJlIG5pY2UgaGVyZSBhdCBsZWFzdCBpbiBjYXNlIHNvbWVvbmUgdHJpZXMg
dG8gYWN0aXZhdGUgdGhpcyBjb2RlIHdpdGhvdXQgZG9tMCAod2hpY2ggbWlnaHQgaGFwcGVuIHdo
ZW4gd2Ugd2lsbCBwdXNoIHRoZSBzZXJpZSBmb3Igc3RhdGljIGV2ZW50IGNoYW5uZWxzKS4NCj4+
Pj4gDQo+Pj4+IEkgYW0gZmluZSB3aXRoIGFuIEFTU0VSVCgpLg0KPj4+PiANCj4+Pj4gQXJlIHlv
dSBzYXlpbmcgdGhhdCBkb20wbGVzc19lbmhhbmNlZCB3aWxsIGJlIHNldCB0byB0cnVlIGZvciB0
aGUgc3RhdGljIGV2ZW50IGNoYW5uZWwgc2VyaWVzPw0KPj4+PiANCj4+Pj4gSWYgeWVzLCB0aGVu
IEkgdGhpbmsgZG9tMGxlc3NfZW5oYW5jZWQgd2lsbCBuZWVkIHRvIGJlIGFuIGVudW0gc28gd2Ug
a25vdyB3aGF0IHBhcnQgb2YgWGVuIGlzIGV4cG9zZWQuDQo+Pj4gDQo+Pj4gTm8gaXQgd29u4oCZ
dCwgd2UganVzdCBuZWVkIHNvbWUgb2YgdGhlIGNoYW5nZXMgZG9uZSBidXQgd2l0aG91dCBzZXR0
aW5nIGRvbTBsZXNzX2VuaGFuY2VkLg0KPj4+IEBSYWh1bDogY2FuIHlvdSBjb25maXJtLg0KPj4+
IA0KPj4gV2UgbmVlZCB0byBzZXQgdGhlICJ4ZW4sZW5oYW5jZWTigJ0gZW5hYmxlZCBmb3IgZG9t
MGxlc3MgZG9tVSB0byBlbmFibGUNCj4+IHRoZSBldmVudC1jaGFubmVsIGludGVyZmFjZSBpbiBk
b20wbGVzcyBndWVzdC4gSWYgd2UgZGlkIG5vdCBzZXQgdGhpcyBwcm9wZXJ0eSB3ZSBjYW7igJl0
DQo+PiB1c2UgdGhlIGV2ZW50LWNoYW5uZWwgaW50ZXJmYWNlIGluIGRvbTBsZXNzIGRvbVVzIGd1
ZXN0cy4NCj4gDQo+IElzIHRoaXMgYmVjYXVzZSB0aGUgZG9tVSB3aWxsIG5vdCBrbm93IHdoaWNo
IFBQSSB3aWxsIGJlIHVzZWQgZm9yIG5vdGlmaWNhdGlvbj8NCg0KWWVzIHlvdSBhcmUgcmlnaHQg
aWYgd2UgZG9u4oCZdCB1c2UgInhlbixlbmhhbmNlZOKAnSBmb3IgZG9tVXMsIGRvbVVzIHdpbGwg
bm90IGtub3cgd2hpY2ggUFBJIHdpbGwgYmUgdXNlZC4NCkFsc28gaWYgd2UgZG9u4oCZdCB1c2Ug
InhlbixlbmhhbmNlZOKAnSAgdGhlcmUgaXMgbm8gaHlwZXJ2aXNvciBub2RlIGNyZWF0ZWQgZm9y
IExpbnV4IGFuZCBpZiB0aGVyZSBpcw0Kbm8gaHlwZXJ2aXNvciBub2RlIHRoYXQgbWVhbnMgbm8g
eGVuIHN1cHBvcnQgZGV0ZWN0ZWQuDQoNCj4gDQo+IFRoZSBwcm9wZXJ0eSAieGVuLGVuaGFuY2Vk
IiB3aXRoIGFuIGVtcHR5IHN0cmluZyAob3Igd2l0aCB0aGUgdmFsdWUgImVuYWJsZWQiKSBpcyBt
ZWFudCB0byBpbmRpY2F0ZSB0aGF0IFBWIGRyaXZlcnMgd2lsbCBiZSB1c2FibGUgaW4gdGhlIGRv
bWFpbi4NCj4gDQo+IEFGQUlVLCB5b3UgYXJlIHN1Z2dlc3RpbmcgdG8gY2hhbmdlIHRoZSBtZWFu
aW5nIGJhc2VkIG9uIGRvbTAgd2hldGhlciBoYXMgYmVlbiBjcmVhdGVkLiBJIGRvbid0IHBhcnRp
Y3VsYXJseSBsaWtlIHRoYXQgYmVjYXVzZSBhIHVzZXIgbWF5IHNwZW50IGEgd2hpbGUgdG8gdW5k
ZXJzdGFuZCB3aHkgWGVuc3RvcmVkIGRvZXNuJ3Qgd29yay4NCj4gDQo+IFRoZSBjdXJyZW50IHBy
b3Bvc2FsIGZvciB4ZW4sZW5oYW5jZWQgYWxsb3dzIHVzIHRvIGRlZmluZSBuZXcgdmFsdWVzIGlm
IHdlIHdhbnRlZCB0byBvbmx5IGVuYWJsZWQgc2VsZWN0ZWQgaW50ZXJmYWNlcy4gQUZBSVUsIGlu
IHlvdXIgY2FzZSwgeW91IG9ubHkgd2FudCB0byBleHBvc2UgdGhlIGV2ZW50IGNoYW5uZWwgaW50
ZXJmYWNlLCBzbyBJIHdvdWxkIGNyZWF0ZSBhIG5ldyB2YWx1ZSB0byBpbmRpY2F0ZSB0aGF0IHRo
ZSBldmVudCBjaGFubmVsIGludGVyZmFjZSBpcyBleHBvc2VkLiBYZW4gd291bGQgdGhlbiBjcmVh
dGUgb25seSB0aGUgcGFydCBmb3IgdGhlIGV2ZW50IGNoYW5uZWwgKGkuZS4gbm8gZXh0ZW5kZWQg
cmVnaW9ucywgZ3JhbnQgdGFibGVzLi4uKS4NCg0KT2suIEkgd2lsbCBjcmVhdGUgdGhlIG5ldyBw
cm9wZXJ0eSBzb21ldGhpbmcgbGlrZSDigJx4ZW4sZXZ0Y2hu4oCdIHRvIGVuYWJsZSB0aGUgZXZl
bnQtY2hhbm5lbCBmb3IgZG9tMGxlc3MgZ3Vlc3RzLiANCkJhc2VkIG9uIOKAnHhlbixldnRjaG7i
gJ0gcHJvcGVydHkgSSB3aWxsIGNyZWF0ZSB0aGUgaHlwZXJ2aXNvciBub2RlIHdpdGggb25seSBQ
UEkgaW50ZXJydXB0IHByb3BlcnR5Lg0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

