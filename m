Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0741B4DCB94
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291683.495258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUtAS-0004xD-Kz; Thu, 17 Mar 2022 16:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291683.495258; Thu, 17 Mar 2022 16:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUtAS-0004sF-Fz; Thu, 17 Mar 2022 16:40:04 +0000
Received: by outflank-mailman (input) for mailman id 291683;
 Thu, 17 Mar 2022 16:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YpXL=T4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nUtAR-0004f2-7K
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:40:03 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe05::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3afc30b-a610-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 17:40:01 +0100 (CET)
Received: from AS8PR07CA0007.eurprd07.prod.outlook.com (2603:10a6:20b:451::6)
 by AM9PR08MB7104.eurprd08.prod.outlook.com (2603:10a6:20b:41e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 16:39:59 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::a7) by AS8PR07CA0007.outlook.office365.com
 (2603:10a6:20b:451::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.7 via Frontend
 Transport; Thu, 17 Mar 2022 16:39:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 16:39:58 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 17 Mar 2022 16:39:58 +0000
Received: from e6ed72d37a45.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6DC15523-D72C-43AC-B22E-14DFFC80E883.1; 
 Thu, 17 Mar 2022 16:39:52 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6ed72d37a45.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Mar 2022 16:39:52 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB9PR08MB6538.eurprd08.prod.outlook.com (2603:10a6:10:23d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 16:39:49 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.029; Thu, 17 Mar 2022
 16:39:48 +0000
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
X-Inumbo-ID: e3afc30b-a610-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eed3G0V7/KFRb0VlF/TFmyVulJzJlI4f2MR6k25ZUf8=;
 b=h9aNM4yUecODgafhCvGuJOFnSrLvj49O2s21J1Gi/0fPlfMk6yhKhOj5Ap9Korzwwdr069oyitzLM0phzOtrBdBktvmweoYeVje4N+2jXrHZgXZXZCZ/f8ST3kOizjJzw19T8ndP5EEXFsf1NCSs6HexNGczDrTKO+lOrcn0kr8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ac808f8964228e1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNNd4mKFHnubz/XVddHpCLLI9TngTI/tjs+JKdXvC5M2/rS5Lr971CQFCHCk3We0171fefSvItCSQzSPZqBT2oxn37iY5G7+dH7NVHF7tWNBQC3LyQ/6KhF4hsBh50mYQgtNfMs3pVlOEwkhdWaL73fU9aJ8qarDI+Y3CbVZd2mWIALig71LoGMopFFcL4W0v1wVDsuCdT217+CuLO8SkcF/kNi++FZYQWkTSTNobGiJPAlqVJtuLpy3Zc3KRfNXJwh2eaw42aG1GBZmIYp33JNXo4a+M4vgnYR48ntDH8ZhUuQZf6w2qsbgBNBzcsVNwpkjsboyoEMPFY1UG5gj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eed3G0V7/KFRb0VlF/TFmyVulJzJlI4f2MR6k25ZUf8=;
 b=kocD3P3ZQdcRZLrq0jJmttObKy813Ae9XnbuLjYR6FC4RIfu+PZ7ROEMcgvuXWzi+Ocz1UJtd4MJKZj0P9N05cypxldnwSf1VKZGi6QmZoO6VuZuPS/czML0vkB3xY3+HyNPGFcMVH8iJLJ23zI+frxwIvXRAd1v1kRJP+HzmD+BSuRAJbb5fQ8ivghvybUCzzJuWVpKI+hMwxBFe9yCGlxBWzO+LcNjcdPv7M05nKjnwFgmSsZvx4bdBZDjFA3xFJzW6XlzTgGK8DJ6aa96PgdmxQ9hf+9vjOlJsLB+CY/wZ/cLn6LnEAh/5HRBfrgyikdhSjLAl4PDzhY/OXqWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eed3G0V7/KFRb0VlF/TFmyVulJzJlI4f2MR6k25ZUf8=;
 b=h9aNM4yUecODgafhCvGuJOFnSrLvj49O2s21J1Gi/0fPlfMk6yhKhOj5Ap9Korzwwdr069oyitzLM0phzOtrBdBktvmweoYeVje4N+2jXrHZgXZXZCZ/f8ST3kOizjJzw19T8ndP5EEXFsf1NCSs6HexNGczDrTKO+lOrcn0kr8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bjoern Doebel <doebel@amazon.de>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: Re: [PATCH] Livepatch: fix typos
Thread-Topic: [PATCH] Livepatch: fix typos
Thread-Index: AQHYNXvxoz4WGhFUpk2S+ASwUJUjCazD0EKA
Date: Thu, 17 Mar 2022 16:39:48 +0000
Message-ID: <92DB3A63-15FA-4967-BA39-BE14F2A3456E@arm.com>
References:
 <032faef0d56d1de17b9dd229b33bd755c402b978.1647025870.git.doebel@amazon.de>
In-Reply-To:
 <032faef0d56d1de17b9dd229b33bd755c402b978.1647025870.git.doebel@amazon.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ab9ecb20-e4c0-4034-c810-08da0834c67b
x-ms-traffictypediagnostic:
	DB9PR08MB6538:EE_|AM5EUR03FT047:EE_|AM9PR08MB7104:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7104416FB2AEF216254D20BDE4129@AM9PR08MB7104.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TTWQLBHFZfa7weH5LfKQpSZ89Q572DrbRTIyzMruXPMu23TEnHS2NP0Z2sVVb44Ci0M4lxc8RkwT5hz0+b/zeVOO0kJhrkTRyIK3qKZHo1ZxZ1p845R9ZEb/FNAfx6eUf6L3zVnnqb5fSNw2Orwscou+jss0tRRsPdkqsZLm5nMnxzw+sIuHSUMl6oVDnpiiIOFY4S/oKKplNhbaZ/J15g09TZpH9QJEXFV7830r4RlKn+li4+L/20WkIi8kPoH5nYMpQIk2VpfhguYjvIMLYRjlakmAjuIb4QIhc02aGvJ82MjRD6QyRucC7Vf1yANLoAD+P6MtjaBc0Ljs3bnIMIO3pmtu8D8D7qDFla4UeQ+7PFAWq1ZkLW0oUtYZJadoywj7dJsujKpUTJ2f78kWYdNfvE/deDax+2yQSVm83n1vMOHdb9t0a25/NmMbGbFpegM8YR6MXgqYD6BQp7rpyfmIsBqycU1EgUC+cg089VgAqB24XwWDil0Nd3qPn/O+VhCyw08upgJJXIIqxkx0Ydremh6yZIC2C/5BHP7t40PGQgRQu7nUiSOctS/nGMOmrQsh607G9KcOoXedmRQVZHTydc+Coy2RHOA5UgZtFgUNTCXtQ/sf+3hLZG/T/+cRUoKTpGvL2o8NvDE40G1cx3INcbhOSdt/XrzcLdGnrdORXPo7ZbLEceJAinTBR/XXfG92l/+XwrnYqR+PFbvsd5CNvSe0R1GL6LgsrvT42Dyg2GdU1+OyDzdHjKrgoBc4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(6512007)(53546011)(186003)(6506007)(71200400001)(6486002)(33656002)(508600001)(36756003)(2616005)(26005)(86362001)(38100700002)(38070700005)(6916009)(54906003)(558084003)(316002)(122000001)(8936002)(5660300002)(64756008)(66476007)(66556008)(66446008)(8676002)(4326008)(91956017)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B59D9E60603AAB4DBC7314BBF4D706BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6538
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	daebd3d7-2f20-4495-479e-08da0834c084
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RdbfOxc6X+fb2+m3nIUz+Q0eSjjApyWHhZkM3HRxsmo3nX+XDQ/bDR8Uu6Wd7aL4hi+GqXdciFt5T6ZXOmpgdY+hBPif07jtlD76wfVzlwyZ6ak5wd35xylcIDO+wj+pdY5Q6t87EPQ+HWCY1fvb+msAiam3o7LvVrIjUEfGe2+/hjcw4VQdJLo3nmRMy6l9WIupCtEtUHk1SHxd0xt3lJBfjLDWmWBxjTBG3f/zPGW5hNcTphJZneIasvrUwwzOQro826i4aq0CzCdOZckTmKnQY9wqhBhKTIc71mddt6ujkpTDkJeo5VjBkjuO9vxDURFbSUsSpzoFPzzMiJ4m/JfDB0NIDfdUd1nJ8eS++t19dXGkEQubrsc8gri6/PRynf1/x7WgozJ39rUNphiKDuo+ERHF2HuzvhyP76vwQwxWIJ9ozFtDrezsl8TMpuitgYPH5mL8N6GDCq2ak+hbXZY+sFzO3AhhZ3cAH5/rZpA6Oxqo4xrrRXuxyKVK9FBwwOol7lhndWJOK+v5TY+D78MOxnSezI2Gndc9H91rfrPbsRw2jd/Q+T7qJwVQSDRAhpkAPW3SQuRa+EjTKO0vKvh6s8Sg2+iewB/rUi/QsMuhxo8SNTlzcaukfiDkrmpLhIakD/bMf+58pNmeYCvx+/ywMoip5Gp/oftq9lfjv6yMIT4x2p6u98vT8SMZswZJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70586007)(336012)(70206006)(8676002)(36860700001)(26005)(186003)(33656002)(107886003)(47076005)(316002)(6862004)(4326008)(2616005)(4744005)(54906003)(82310400004)(356005)(81166007)(8936002)(40460700003)(6486002)(86362001)(5660300002)(2906002)(508600001)(6512007)(6506007)(36756003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:39:58.7045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9ecb20-e4c0-4034-c810-08da0834c67b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7104



> On 11 Mar 2022, at 19:11, Bjoern Doebel <doebel@amazon.de> wrote:
>=20
> Fix a couple of typos in livepatch code.

NIT: I would say: [...] in livepatch code comments.

>=20
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>

With or without it:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>



