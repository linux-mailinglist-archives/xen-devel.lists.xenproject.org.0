Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5995998D7
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 11:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390169.627446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyW3-0004lI-7H; Fri, 19 Aug 2022 09:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390169.627446; Fri, 19 Aug 2022 09:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyW3-0004hX-42; Fri, 19 Aug 2022 09:42:11 +0000
Received: by outflank-mailman (input) for mailman id 390169;
 Fri, 19 Aug 2022 09:42:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pvko=YX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oOyW1-0004hR-9E
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 09:42:09 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10088.outbound.protection.outlook.com [40.107.1.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f355d71-1fa3-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 11:42:05 +0200 (CEST)
Received: from DBBPR09CA0033.eurprd09.prod.outlook.com (2603:10a6:10:d4::21)
 by DB4PR08MB8197.eurprd08.prod.outlook.com (2603:10a6:10:383::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 09:42:03 +0000
Received: from DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::a6) by DBBPR09CA0033.outlook.office365.com
 (2603:10a6:10:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Fri, 19 Aug 2022 09:42:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT004.mail.protection.outlook.com (100.127.142.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Fri, 19 Aug 2022 09:42:02 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 19 Aug 2022 09:42:02 +0000
Received: from cfb93c8fffd1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0CF9A5D-C04B-4D4E-91E9-4F2ED00CBF4A.1; 
 Fri, 19 Aug 2022 09:41:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cfb93c8fffd1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Aug 2022 09:41:53 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB3150.eurprd08.prod.outlook.com (2603:10a6:803:46::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 09:41:50 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 09:41:50 +0000
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
X-Inumbo-ID: 2f355d71-1fa3-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lHKHHoh6cQyAQ9fBnXS5LVMe5S4/ie7nUttqxaGs9jZgLLigFkxDkRLE+SEd5mtxRzwRAj7xGKshOtEiY2D6k6G1YZzpsNP64zT4aNHcm5XUBs2ECRpOZb7PjN5uc2xeCv32xmJHW6NlavYJ/TshpHQZAMcAa8GDOnZatGFtOr0igUxob4Zfob8vs9QM1D3XhkP90bFy4NseGvBu+JUZz3PlG/ujSLvnWUiOgpFd+0c+O2CFXSANUzh/SlRkh6wD/9XDbj1UYTuSeEYGAPeHt1GIS5EeHEEGigbbmc1tBrcr5NCnNRC4sSux97yy/NP8QnJ0fpwMaxp6obQWgZLdlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D80xj0N6In7EC1i1ZDHyHZhg7/0s3Vu7H4GF4h6jeFw=;
 b=jeM9ocTYr8etnSBKKCNWCpfGMJ0mYmPtCxzVfQknoZmdWH+OAl3u3nOBX2pwlnehMvNALnuTMrWAabDNHRxxmTFCkXTeKn9VDVPH6wziNnVCiQK4QL26eBiPcREJVhyEmL9WxSjUB5p8yjLdbJT0/89303KAufO9DFBNE5wnyBL9x96LbXdqEUkdCGsYExDJKWvHryVeCJg4AO/Sf0ypZA6vbKW/p6Lb7UCnANk4mwcfz78b1/LRYFVm/HNL1zREhL3aBwRe6TBIfGjwqYbEKFVn6Gb9QNd7JQZ6NJgWoEHqAo8RkqUrZwG0HSjZvztUyWY35F91SsalVoDg+uqmJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D80xj0N6In7EC1i1ZDHyHZhg7/0s3Vu7H4GF4h6jeFw=;
 b=6OY7P374mQUGZTpJaj4BLgRBgub8IaJj2vIdpTVz/Ds8OX6m3g08IDyIzZbCiPXoCa3TN4nZgVJRyF2loMBsTQqExXiQh65KlfLIVRHEUEB5sMGreh3dsGY3LLaKYSQchBMQ7SvkSiYjrK236nnAgN5aArCT+PtbNgOWoSWxtWA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyEgiof4OT6VHvUeghYfbnCZxZAFxXtRpMmZinTbM/k8FSf4/2F4qGZUhsW2JAKVba5YwiVPrG6rx+YWTJw0ZEaq3pQKytxA/HIuGQ1l73c2z/E/mwQwzFZndJR8fVbESs9HDTXb75UbjMGPqLlq33CbXZyjTDsDfmDL7FMniaKxNKWbCsrNegKm7biUqYBOH7VR7Ci+5xUD31An7jyf8lxn6JcUdu2Bzc+8IVKuBQ8vhMGbDreJIqT3CmKSbqRpE2tbdNFL5ArUjFjUQv+Yp2E/RID9gQje70/ZB18nC2u+gSxZuUDaFTB1UV+t3Qfb8DymisM/2LP3JsvVJs7gmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D80xj0N6In7EC1i1ZDHyHZhg7/0s3Vu7H4GF4h6jeFw=;
 b=UgWWYhWNCDmQuDlrct337vHc0pWZRmcqMG4S/wvfbpeedCNb4T9+W8KIhwH91PkK19BH+uqhrBQCAWfxuRSs04kNImvJJalzEQdnmQYYCYADGKR99UQjRhdjeHhniCCFom4aXYoVc8a0W2APh3vG6qjao3YwvXP4m+yw3EvTwM5te0xkEd5wG4PGaKaKJ9AxHpawWqgFPc21mLDFN7elMfTABhJwNr60GR9tGZMbgSco3ImPQ4eNhVBYY9yLHknNiJntoL6Wpo4am6FKcIEd4awK8B88BlIUQrVPTTRaExOu3y8KFn86M8kgPubPv8SrbD/LhvEoFEDT+oZ4ZJ4eYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D80xj0N6In7EC1i1ZDHyHZhg7/0s3Vu7H4GF4h6jeFw=;
 b=6OY7P374mQUGZTpJaj4BLgRBgub8IaJj2vIdpTVz/Ds8OX6m3g08IDyIzZbCiPXoCa3TN4nZgVJRyF2loMBsTQqExXiQh65KlfLIVRHEUEB5sMGreh3dsGY3LLaKYSQchBMQ7SvkSiYjrK236nnAgN5aArCT+PtbNgOWoSWxtWA=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/2] Arm32: tidy the memset() macro
Thread-Topic: [PATCH 2/2] Arm32: tidy the memset() macro
Thread-Index: AQHYs6BtEnYIw9a2QEK+U+CB1vg/Xq21221AgAABzYCAABfasA==
Date: Fri, 19 Aug 2022 09:41:50 +0000
Message-ID:
 <PAXPR08MB74202616BCE3EB6B5F13D8EA9E6C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
 <PAXPR08MB74201D5D5741B9F19E3622A59E6C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8a80c79d-975e-3866-2419-f6ac5678060b@suse.com>
In-Reply-To: <8a80c79d-975e-3866-2419-f6ac5678060b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0F00A9422906F34587A9AE6DFCFEE2C5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fdd995fc-afad-4045-ac90-08da81c7122c
x-ms-traffictypediagnostic:
	VI1PR08MB3150:EE_|DBAEUR03FT004:EE_|DB4PR08MB8197:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KOM5esYTHt4KlDe/QubPl/SWcWDwQLnPgpDCx8h78mst0/E5Rry3p/SPefJuUJxCnFXdKTdngFc4s2jjTmoAY5cCsTsw5DSoWbVtqh3FW34y1PpZJ8B13Ra31MA44Tz3Oxw9bBUlfNm5mGaJkGRWk4GYWgOSK5ArpudAFSQTaDn7Cngfw8RYb/SHQzg2NN94uQbSv2zW9h18QH22iNjQ7jdUXvF0bUdf57026sHVJEHXeuZbt5gC6hPpA5CZxlJQGlbJroNRMkuGAoSDj4SClxr0Jt3hzgZLnPi77mCMshf/2VMgyn9Ds2wCk8Hfl3xck3oV6vV/OHTR/bNCJawJ3eubPU/rz6xiUxnllRUvsiIYwqm1qXCccrQRA2b7k/FT8+OVUAgFsZHp2Ufl0XB2vmlvCqgeuUuyy5Q67qYphReTe2VurPGM3ARnYSLNVL/PVWWehWltohHsCJQxxkLH/+Vp3PvZfwybiQP96hIHrU4XBTSg5sq4XrpZTi9eNBhH8sqMVnkYxQfi75D42GOg6ylVY450tiA0SZofKDfJL7qiaYmlsLLjGuOLQe9zJJWLCp4SP/90i31djLosb/8Z2cUm4TXz7Ds3ZHcynyOuInU93nQv6m4pmMe3oYKCG4lDnCRLz2F3OL9CILasJbEuzDlNzamvPAIgT1YFt69Fh38K1RLnjWvQJldRyKZ4PGa5iyud0mo3DPUjYrRqjGqcAC1djRzsqrkb7P+lQ5T2ftW5OUv05Ks1fUv8riJGG/JIPUKzYndCniI8FB/BpUUBlA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(38100700002)(122000001)(8936002)(26005)(52536014)(38070700005)(2906002)(186003)(53546011)(7696005)(6506007)(9686003)(41300700001)(5660300002)(71200400001)(66446008)(478600001)(83380400001)(86362001)(55016003)(33656002)(316002)(8676002)(4326008)(64756008)(66556008)(66476007)(66946007)(54906003)(76116006)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3150
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	421226b6-6b15-46d9-e6b9-08da81c70a8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j7c5aj+r3xHTDRdK4fLnVZZARHNh3tAWvRXK1hQjtDch7hYqYXyk7wA0kqcfN+lyn+o1elbufGtwYJVBtmagcq+UqHrQteMnoi7aOLA28ns+sLIgzmRI5Rlrk2L/SH3f8MYaHFF/cffZX87O/9YPo/Gu+VP+cRPzMn09osRy851siDuDf00PoktVksgYsGOQoD7VZUcrLcHLYlothVulXBsQHsRavbSScxMTMiq3HF5Lq7gvtwT1dzOOIhvji5VyWGYTaja6Bm465FkWkxGI2VdBX/PlzCXhgViKS4kQioUMNJd71uYLWpBgSzVjwXY531gHiq8xy8nHjyJS9+OyY/JCiLWDvzKLmszGfXx3MiBWFxmBminhG5K3Ac7LYmzMTNOp3BqaOp+ybdIGqY54Yv/NXtW1T+as3fb+gcIIYUS+BG5cXhCoN7Rp3weIlOnzj0yVZFdEBmgkmSiJfH5a3/VzBYwesgDFAJ/XVM+N3VfmPDLTwcJ0+XoSmZnYjYuEx7YZk5XJ+r4z9zCZNInjq96bAmNCFPOPoEkrnT8uY+65AmZqyMaLa5rdAIv0gQaW36WlQMQtYD1n/2J0dgvd6geDg+/whjpcs/nys0PGpswPy2YlEfjHvxTs/7Kg2pipd5z/tLoeNgycUT+3fSmT5PEWyoR7ROSYdJQIQYKqRk/x36Gij/nC3+Yii6wWNIg1hpWgAoB4ahAr/hIy3AVwBRhQ/uIQbtikSxsWQFuTftMoSKIMelIBhn0wlXq6LRVJL2qKd4tY+XKXTfHnjBpjEA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(36840700001)(40470700004)(46966006)(4326008)(70206006)(8676002)(54906003)(316002)(6862004)(52536014)(5660300002)(8936002)(2906002)(33656002)(82310400005)(478600001)(41300700001)(6506007)(7696005)(26005)(9686003)(53546011)(40480700001)(55016003)(81166007)(82740400003)(86362001)(356005)(186003)(83380400001)(70586007)(40460700003)(336012)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 09:42:02.9739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd995fc-afad-4045-ac90-08da81c7122c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8197

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDjmnIgxOeaXpSAxNjowNA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPjsNCj4g
QmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgeGVuLQ0KPiBkZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gQXJtMzI6
IHRpZHkgdGhlIG1lbXNldCgpIG1hY3JvDQo+IA0KPiBPbiAxOS4wOC4yMDIyIDA5OjU5LCBXZWkg
Q2hlbiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
WGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVo
YWxmIE9mDQo+IEphbg0KPiA+PiBCZXVsaWNoDQo+ID4+IFNlbnQ6IDIwMjLlubQ45pyIMTnml6Ug
MTU6NTANCj4gPj4NCj4gPj4gLSBhZGQgcGFyZW50aGVzZXMgd2hlcmUgdGhleSB3ZXJlIG1pc3Np
bmcgKE1JU1JBKQ0KPiA+PiAtIG1ha2Ugc3VyZSB0byBldmFsdWF0ZSBhbHNvIHYgZXhhY3RseSBv
bmNlIChNSVNSQSkNCj4gPj4gLSByZW1vdmUgZXhjZXNzIHBhcmVudGhlc2VzDQo+ID4+IC0gcmVu
YW1lIGxvY2FsIHZhcmlhYmxlcyB0byBub3QgaGF2ZSBsZWFkaW5nIHVuZGVyc2NvcmVzDQo+ID4+
IC0gYXBwbHkgWGVuIGNvZGluZyBzdHlsZQ0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IC0tLQ0KPiA+PiBJIHdvbmRlciB3aGV0
aGVyICJpZiAoIG5fICkiIGlzIHJlYWxseSBoZWxwZnVsOiBJdCdzIGV4dHJhIGNvZGUgaW4gYWxs
DQo+ID4+IGNhbGxlcnMgcGFzc2luZyBhIG5vbi1jb25zdGFudCBzaXplLCBqdXN0IHRvIGNvdmVy
IGEgcHJldHR5IHJhcmUgY2FzZQ0KPiA+PiB3aGljaCBtZW1zZXQoKSBpcyByZXF1aXJlZCB0byBk
ZWFsIHdpdGggY29ycmVjdGx5IGFueXdheSwgYW5kIHdoaWNoDQo+ID4NCj4gPiBXaGF0IHJhcmUg
Y2FzZSB3ZSBuZWVkIHRvIHVzZSBuXyB0aGF0IGNhbiBtYWtlIG1lbXNldCBoYXBweT8NCj4gDQo+
IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBxdWVzdGlvbi4NCj4gDQoNClNvcnJ5
IEkgZGlkbid0IGRlc2NyaWJlIHRoZSBwcm9ibGVtIGNsZWFybHkgaW4gdGhlIGxhc3QgZW1haWwu
IFlvdSBtZW50aW9uZWQNCndoZXRoZXIgaWYgKG5fKSBpcyB1c2VmdWwgaW4geW91ciBwYXRjaCBj
b21tZW50cy4gSSBsb29rZWQgYXQgdGhlIGltcGxlbWVudGF0aW9uDQpvZiB0aGUgY3VycmVudCBt
ZW1zZXQgbWFjcm8sIGFuZCBJIGRpZG4ndCBmZWVsIGl0IHdhcyB0b28gdXNlZnVsLg0KDQpUaGVu
IGluIHRoZSBjb21tZW50cyB5b3UgbWVudGlvbmVkIHRoYXQgaWYgKG5fKSBpcyBqdXN0IHRvIGNv
dmVyIGEgdmVyeSByYXJlIGNhc2UuDQpEb2VzIHRoZSByYXJlIGNhc2UgaXMgbWVtc2V0KHAsIHYs
IDApPyBJZiB0aGlzIGlzIHRoZSBjYXNlLCBJIGFncmVlIHdpdGggeW91LA0KbWVtc2V0IGl0c2Vs
ZiBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgd2l0aCBzaXplPTAuDQoNClNvcnJ5IGFnYWluIGZv
ciBjb25mdXNpbmcgeW91IQ0KDQpUaGFua3MsDQpXZWkgQ2hlbg0KDQo+IEphbg0KPiANCj4gPiBB
cyB5b3VyDQo+ID4gY29tbWVudCwgSSByZWFkIHRoZSBjb2RlIGFnYWluLCBidXQgaXQgc2VlbXMg
dG8gd29yayBmaW5lIHdpdGhvdXQgbl8uDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gV2VpIENoZW4N
Cg==

