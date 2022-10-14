Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B85FEDD5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 14:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422851.669166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojJWy-0002s8-3i; Fri, 14 Oct 2022 12:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422851.669166; Fri, 14 Oct 2022 12:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojJWy-0002ps-0d; Fri, 14 Oct 2022 12:11:12 +0000
Received: by outflank-mailman (input) for mailman id 422851;
 Fri, 14 Oct 2022 12:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojJWx-0002pm-35
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 12:11:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46254805-4bb9-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 14:11:04 +0200 (CEST)
Received: from DB7PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:52::16)
 by PAXPR08MB6591.eurprd08.prod.outlook.com (2603:10a6:102:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Fri, 14 Oct
 2022 12:10:53 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::ff) by DB7PR02CA0003.outlook.office365.com
 (2603:10a6:10:52::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Fri, 14 Oct 2022 12:10:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 12:10:52 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 14 Oct 2022 12:10:52 +0000
Received: from 82e858498529.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3DFE2B90-6492-470E-8445-64B2BCC284A9.1; 
 Fri, 14 Oct 2022 12:10:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82e858498529.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 12:10:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB8PR08MB5355.eurprd08.prod.outlook.com (2603:10a6:10:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 12:10:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 12:10:38 +0000
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
X-Inumbo-ID: 46254805-4bb9-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kNrnunlGyrYJWDtvWrsRUag5bCic1XyTgDtdgz4yWfuVWhYFiqX7Ze5aCYBYn92oIrPhur6vPqeWvcQTe0qKsnZhHvBVxZWffyBMa3M04YY3eHFHEsWTCbiIntYsJ+tqK8ovYBUNyvhqAX8rwR+dVBiuBDgEjTviX9skuFVzXDzcKuuHjZ/lkWoiuRxnI+/McwJ6lLgPwldVjDjYcL8GLOVSV/1nD+Z5sFZOnujmt7mofKE9zXyj7jqPLYRIZj8FkR7VGwZ7IAF2nfJidsu1SiB2FojfY7b81ociu1/fCxIDUTkJ+4LPP+i3mPIwMbWXbWvAWziqx3khH0m70X76iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhGkMGBtWQoFDpTCLjROZmvmBwHuk6kZyrUC2Qf9RXk=;
 b=Y0JfrWKVFC72ZXEu219i7ZOZaBazyhqAe1U5oeFEcdWme5kJeYLLlreVjzuoUvcsyrTAQBUpbWAjOmLweWSohm9cqljoVQOJMuTFtGuOhW0bXLMGNzQ2FX33rc0n7wpB2CQFTBGi9GuAVxiJikRIy+60dzrvtG6VoNdhgEpMAidlwSMf5O/7m3jsPpQpqn1oKctol7Uyn4csls9Own9oPsOHM53aHXLmi++4SEuHAg7bhsCZZE7vAG7I/WOIRgRUAVJ4VT1h9SoPvVIElw/jfyOd7otFLDcnc4aI8vcuADSIvuw+Af6ZyKJiQJPVBM444E4WaxqzWZv5YmUiGsH9rg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhGkMGBtWQoFDpTCLjROZmvmBwHuk6kZyrUC2Qf9RXk=;
 b=kLYzCRm1T3SWedhULpwgfZX+0XIyMQI0xn7pXjBG/RdPTEb3PF2yIV7tWTF9W5Lx+fj4GrYySSrNMYDT9xvC5TDNmfRz1u1crTVvVbjZxiLNPXFxkEBm5eFjrIfJfrKdRTncCrYbZJol43uNDerqAU58Atb0nY780WO4x1g5Yog=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtywUq3tbC3scmkUCyWWNIoWIrDSAZJOAbA/EIfcimEDNMPGJrXa72NhCxQN0HhDThFjbSy7I/BDFj2RT329kIk+wwLUoVGe0UJbAOX38fZq697lhOKBJ4x9RLzpsO3t1RuVL/W/AEEHV7urEwOVOIsrdOO1wrKFPhUwgCOikMAA5Rta8Hvs0pLimg9Ai/shxF3G4GfVNh7FaY3Mwz+uysLWbrSl8b0GA+Yhtr1n1YEpUngCGWB0SI0LBiliN601fVwoKDnjwOABlSU4c/iUcmnhNmzl1KQ6Z9QRAY7DCq9pDKfA6ybjZIxDmQ3DzRZQE3sBgCA7u+FleFOEvknkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhGkMGBtWQoFDpTCLjROZmvmBwHuk6kZyrUC2Qf9RXk=;
 b=ZrboU0cdIASj5WW1D5s3sU8jnMT5h49S4FKyFB2FcJYrGu0Zbyiei4F10IL1aPqdpnaBpI+jHqrRnDOrlY7q1722gZCjilOa/oTFUatxcmPEewTTexBFunDVvbT45uGMdH9XHZzvonhcH4GiNqEWTHTMOItbDBT67goKucUR0odfDrYq6pNibKYseF1QgjWSBmVcn/hQ5SuSzjJdFWSTFOA5h1ETq1gUf4EJJP6eYuEtKDuuK8rwEuGJQ8JevpRSeD4nrMalP5LntRQ04MtVZQlGsYEcabye9Qb3lhGa8/1QUuZP4scZbKu8qRXuYHEl2FOr2dGktzgA+1XeVkU+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhGkMGBtWQoFDpTCLjROZmvmBwHuk6kZyrUC2Qf9RXk=;
 b=kLYzCRm1T3SWedhULpwgfZX+0XIyMQI0xn7pXjBG/RdPTEb3PF2yIV7tWTF9W5Lx+fj4GrYySSrNMYDT9xvC5TDNmfRz1u1crTVvVbjZxiLNPXFxkEBm5eFjrIfJfrKdRTncCrYbZJol43uNDerqAU58Atb0nY780WO4x1g5Yog=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY36RSrOIThkYtnEq9RrtWc+uYX64NnUwAgAAAd5CAAA4NgIAAAPkwgAAIMgCAAAAtcIAAA6oAgAAAMLCAABDdAIAAAGAA
Date: Fri, 14 Oct 2022 12:10:38 +0000
Message-ID:
 <AS8PR08MB79917BE687706A4DF51860DA92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
 <AS8PR08MB7991B0B2400B1B9D0E6B1C4592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <db3e4568-edf4-c5c6-4f99-3444a38cc40a@suse.com>
 <AS8PR08MB79919FFC44E975825EE9CB3392249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e60803a6-44c5-9d22-88b5-c924ee854fca@suse.com>
 <AS8PR08MB7991A81D931E20A000FEFE0092249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9adb1562-236e-2856-5977-0c563b0af024@suse.com>
In-Reply-To: <9adb1562-236e-2856-5977-0c563b0af024@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 52DB0AE3EEFAD8469DB7538CD94C362A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB8PR08MB5355:EE_|DBAEUR03FT032:EE_|PAXPR08MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 221c4c78-2a81-4380-76c6-08daaddd23c1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d3IcYc+fnsv80ENaOtDXFxZSPPO+i/4GibcHLL/FmlUQYes1z1M9g7nQbwMrYIYgfpQ1+7g2rellQkAZhEWJ/d4DXBOn0/3/JcZK5oZEG8A4lvERG6XptdDAGuv1rZz6bdAwCGjntldC6g8V1zQuWMvJNFdSzMGDOk0ovQ5coW3gZSMfiB7HMIwjrR1FZold8Vuf4qCjpp5kU/LgbltpYAWbbwnKQYob8GXfsC2EwBDPauJWgtSSgpZnhUyjDP+V24iYJA49ZiUH6vFDOySFvKPcDmsNUOXGrUy81xQFn4uY/pzvHdC94CwbPJvmFpETniVxwXv2WBi/Rph3MywliLnXZgeX2EMv4U4HEne9pAUSGSR2H8oAPNTwvTY5t5gaznDMRwrTwietTaMXHxxx19imsktLOLk0eG8UE83KJmuse5rSi4bBz6Ps4fAm2Gx/q/IaSHxqRkdPxPZ4Qy/njMU0NbZH6h8mVzL7kp/R6tY+XZ20BnlXZH63sf2hzyetFqSJEDlQ5zyHEpvXa7isbE6D9MlPITOcZ6npY3Lm46fMnv580x1fIp6+Z4RihX6OUASP3wx5eM4ckDATeUrvLYvJ3/RuGyTkjFBvPUQpxzKuAb5C1kRaN1PepWEBR7vcSs2BbQ9yQl4TCp6nZG/oCfrFfg9NliKb3mVMBDspYXeXWZFCxf4/BIjyEJVQINIAnyYLQuZX5rC7/2pyPiabrCXz6upn5zVZdZRC3oqRdunPshKg4OcQx4xsTOAh0AZVoZi94Ss/p33q/M8/t2IbJwi3P8yiS3yB1bRVaqJS7Ow=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(71200400001)(55016003)(38070700005)(26005)(66446008)(4326008)(8676002)(53546011)(64756008)(9686003)(66946007)(66556008)(66476007)(76116006)(33656002)(2906002)(6506007)(966005)(38100700002)(8936002)(86362001)(122000001)(478600001)(316002)(52536014)(7696005)(54906003)(41300700001)(6916009)(83380400001)(186003)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5355
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52d2377d-b09f-4241-feac-08daaddd1b5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yha1NP7KYYIpcpVE/jstYRDJEbRGtwqNzzr87wS3r5+M9Pr5ZjW00W/4seHyRJDJmgGOz3EjibS2PaXd7P3RQW5G5HyHCljFIe+pN7b/xJHL1VY+J1iRoho7RxQhaU0a426vRTbo/9Gnf5ggJHHvBo+bguk5P6J5yGjgXQ7SsgrRWDAWktI2G3Jiv6Dor0PSzLXjzldQ5sGtjbsRQbJqzuD2lmRAFaxhGfotfzPEeW6pSR9eE35JQxkiT+vEfn7bQG35bMLh5Z0+/nKRKbgGEKKyvi0beTtELH6ocIwGKDGrY1SM60Cjpk5rRxkRJDC3ls4WH5RgMnCfw+Ydh9nt1yu5GR0aBj78oe8SBC0WFPAhDmTcTvEcHIVa78kHJsE3np8ioE+TidR8dQBK4dm4NiOGhWHlTkJoz/k8YY/J8hIOXM3unA5gHlVPkHGmUQlUwJt9F6H3/HRa3fL1/YmIwyO41QsqV8/04Jx7QRvDpkz0XK/QkwxQquboTGth4Savye0BszhO42hk2IU4l2uZQLjohYXa6K9MO0xpoaT60R6gfkmiiamVqWa3KQz/9Je7WzwswPmBID/69GaQGVe+5mpAsuxsG9khuu9NyWvsZyuy4Gp7JF371E4j7eWP4tW6zXxLnTmdYhHc8eNro0JZ5Lb9nzw8A0CWfxeItAMOkO/mcJiaKgGypIzinnoho3Qxf1T36uuCE0pK61Oo4rGCKKaspCDdsmaxei7n1MuL6a9W+HrZ7xL4fb+/KJK/Ao9fEBe/RnhrZG28RltS4HL5WXwwNHwwiVAEZjZAHnmJ2BM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(52536014)(86362001)(33656002)(2906002)(81166007)(82740400003)(356005)(6862004)(336012)(186003)(47076005)(8936002)(40460700003)(55016003)(40480700001)(5660300002)(83380400001)(26005)(7696005)(36860700001)(6506007)(9686003)(53546011)(54906003)(316002)(478600001)(82310400005)(70206006)(41300700001)(70586007)(4326008)(966005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 12:10:52.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 221c4c78-2a81-4380-76c6-08daaddd23c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6591

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuL2Fy
bTogcDJtOiBQb3B1bGF0ZSBwYWdlcyBmb3IgR0lDdjIgbWFwcGluZyBpbg0KPiBhcmNoX2RvbWFp
bl9jcmVhdGUoKQ0KPiANCj4gT24gMTQuMTAuMjAyMiAxMzowNCwgSGVucnkgV2FuZyB3cm90ZToN
Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pg0KPiA+Pj4gTXkgaW5pdGlhbCB0aG91Z2h0IGlzIHRo
ZSAiZWxzZSBpZiIgcGFydCBpbiBwMm1fc2V0X2FsbG9jYXRpb24uIEl0IG1pZ2h0IGJlDQo+ID4+
PiB3cm9uZy4gV291bGQgdGhlIGNvZGUgYmVsb3cgc2VlbXMgb2sgdG8geW91Pw0KPiA+Pj4NCj4g
Pj4+IGludCBlcnI7DQo+ID4+Pg0KPiA+Pj4gZG8gew0KPiA+Pj4gICAgIGVyciA9IHAybV90ZWFy
ZG93bl9hbGxvY2F0aW9uKGQpDQo+ID4+PiB9IHdoaWxlICggZXJyID09IC1FUkVTVEFSVCApDQo+
ID4+DQo+ID4+IFN1cmUsIG9uZSBvZiBzZXZlcmFsIHdheXMgb2YgZG9pbmcgaXQuDQo+ID4NCj4g
PiBUaGFua3MgZm9yIHlvdXIgY29uZmlybWF0aW9uLiBKdXN0IHRvIHBsYXkgc2FmZSBpZiB5b3Ug
aGF2ZSBtb3JlIHNpbXBsZQ0KPiA+IFNvbHV0aW9ucyBwbGVhc2UgZG8gcmFpc2UgaXQuIEl0IGlz
IGEgZ29vZCBvcHBvcnR1bml0eSBmb3IgbWUgdG8gbGVhcm4gYW5kDQo+ID4gcGVyc29uYWxseSBJ
IGFtIG5vdCBhIGJpZyBmYW4gb2YgZWl0aGVyIGRvLXdoaWxlIG9yIHRoZSBpbnRyb2R1Y2VkICJl
cnIiDQo+ID4gd2hpY2ggaXMgdXNlZCBvbmx5IGJ5IHAybV90ZWFyZG93bl9hbGxvY2F0aW9uKGQp
LCBjb25zaWRlcmluZyB0aGUNCj4gPiBwMm1fZmluYWxfdGVhcmRvd24oZCkgaGFzIGEgdm9pZCBy
ZXR1cm4gdHlwZS4uLg0KPiANCj4gUGVyc29uYWxseSBJIHdvdWxkIHByb2JhYmx5IGhhdmUgd3Jp
dHRlbg0KPiANCj4gICAgIHdoaWxlICggcDJtX3RlYXJkb3duX2FsbG9jYXRpb24oZCkgPT0gLUVS
RVNUQVJUICkNCj4gICAgICAgICAvKiBOb3RoaW5nIC0gbm8gcHJlZW1wdGlvbiBzdXBwb3J0IGhl
cmUuICovOw0KDQpUaGFua3MgdmVyeSBtdWNoIGZvciB0aGUgc3VnZ2VzdGlvbnMhIEkgZGlkbid0
IHRoaW5rIG9mIHRoZSAvKiAqLw0KcGFydCBhbmQgSSByZWFsbHkgbGlrZSB0aGlzIGlkZWEuIFRo
aXMgc2FpZCwgYSBxdWljayBzZWFyY2ggb2YgZGlmZmVyZW50DQpjb2Rpbmcgc3R5bGVzIGFuZCBJ
IGZvdW5kIFsxXSBtZW50aW9uZWQ6DQoiRW1wdHkgbG9vcCBib2RpZXMgc2hvdWxkIHVzZSBlaXRo
ZXIgZW1wdHkgYnJhY2VzIG9yIGNvbnRpbnVlLiAiDQpTbyBJIHdpbGwgcHJvYmFibHkgZm9sbG93
Li4uDQoNCj4gDQo+IG9yDQo+IA0KPiAgICAgd2hpbGUgKCBwMm1fdGVhcmRvd25fYWxsb2NhdGlv
bihkKSA9PSAtRVJFU1RBUlQgKQ0KPiAgICAgICAgIGNvbnRpbnVlOyAvKiBObyBwcmVlbXB0aW9u
IHN1cHBvcnQgaGVyZS4gKi8NCg0KLi4udGhpcyB3YXkuIEdyZWF0IGV4cGVyaWVuY2Ugb2YgbGVh
cm5pbmcsIHRoYW5rcyENCg0KWzFdIGh0dHBzOi8vZ29vZ2xlLmdpdGh1Yi5pby9zdHlsZWd1aWRl
L2NwcGd1aWRlLmh0bWwNCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gLiBPdG9oIHdp
dGggdGhlICJlcnIiIHZhcmlhYmxlIHlvdSBjb3VsZCBBU1NFUlQoIWVycikgYWZ0ZXIgdGhlIGxv
b3AuDQo+IA0KPiBKYW4NCg==

