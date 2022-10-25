Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1A60C574
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 09:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429601.680664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEUv-0002rv-4A; Tue, 25 Oct 2022 07:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429601.680664; Tue, 25 Oct 2022 07:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEUv-0002pf-1G; Tue, 25 Oct 2022 07:37:17 +0000
Received: by outflank-mailman (input) for mailman id 429601;
 Tue, 25 Oct 2022 07:37:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbGC=22=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1onEUt-0002pZ-Cm
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 07:37:15 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130084.outbound.protection.outlook.com [40.107.13.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d79020ee-5437-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 09:37:13 +0200 (CEST)
Received: from FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::15)
 by AS4PR08MB7508.eurprd08.prod.outlook.com (2603:10a6:20b:4fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 07:37:08 +0000
Received: from VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::9e) by FR3P281CA0144.outlook.office365.com
 (2603:10a6:d10:95::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.12 via Frontend
 Transport; Tue, 25 Oct 2022 07:37:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT021.mail.protection.outlook.com (100.127.144.91) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Tue, 25 Oct 2022 07:37:07 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Tue, 25 Oct 2022 07:37:07 +0000
Received: from e9c3bae2b94e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0F18671-8CB9-4B5F-B202-CAF78131D235.1; 
 Tue, 25 Oct 2022 07:37:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9c3bae2b94e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 07:37:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6328.eurprd08.prod.outlook.com (2603:10a6:20b:33e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 25 Oct
 2022 07:36:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 07:36:50 +0000
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
X-Inumbo-ID: d79020ee-5437-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZpE/WYIbMZIqRA82rem/2vpsxZYnVIQwzbDFDu348l5vSJmASs+YOuvmRw9c1ldMo+dGZiiOtSh5nShkb1W3hiOYFirze8+HKzNsYxI60YB5NpeL/y2ILiku9LhxWhYxyfHmi9iNqJ5wKxoPnBwaYETzBmY4RfToyXwQ9kmGIzwkl4llJegwrt/tXvjzL47fx465rJqL7XXXAxNJkvBSvHtGwpjeixRaNfykdklr4U+Z0lWvEbO33DH4UF/Ry/DM2puUStkilyi1FFUPwoKO0FLTgZE7t2Dq/+weDZ08Q9x63QiNPRQhY0PjJObzz0PbOZlJ5M555XlqUbn6x/9LJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+vHZb59A5QNvyJ+NKkFl4+p37pscCh3MHGL2aQuNPI=;
 b=jfcPcJbqSHdopKWQKH7rxT55K7qjz7/FHJMgufy90A3nkovViEhHcWQ3vUE4DrgSnASJOp5RN/xNt4o8SYlyGCNduzemHKc5jXhJYiq5Co/4yHWr28AElzp6nA1PsESNvKJHGRVlx7yeG3ZQLL8nCPhxfTg1WptWPSG0E6iu5FfAntKwBG9Zzy+jdLpzMtmmDOvk8DrLn2+76jjZPsDicMeEDricMzVjzgvODcW3C5rUVOIpiph3e8spUo3dsXksV3iqgDWe5kGnmLIfstlJSHy1jZ/+c3Vk5ALtDQnp7yTTkNlnU54HqZ4r8VdgTMWnt1eRllxxdDVHd73j8Nmk4Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+vHZb59A5QNvyJ+NKkFl4+p37pscCh3MHGL2aQuNPI=;
 b=b8CKcZ8Oarj9UoNqoV+DtkcUGh1r5zyx6OkAwGxPhnlBG38WDUpfJUeCiYM298oZFxWzFlQ6hzbcIZ8GRU7nJ2En1dzU/9BDyNJl4XBn1mRX1zzl67AN8pbgaVEiwJb/riHFjEMyQOhnkkd561jPO1ZjzjmnfkiLzAabzwDBdNY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 482558b6af2265d4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0VRAWx0RZcklsp3HzPRAiVKdxJLHPdT8Nklyh3uYYCOKPh7YqUayrmudaGXiZUFjI8gIJTbm4w6DhWGGrRdxD+kKGd5HjMU6MCfTyUpuHYkr5YkB82IArSXS8PU27Cl362ZF6YC8mtBzzvYlzvG163siai6ueWifKQg3TzdoOwVmzTZjTPjrr+KI7hUSsV4icfGbLXhB1fHyPdmHjIjWEFGq3GW9GFHNI9/gSplYiIs8PZeqWHhq3vyxB6ESVa9ZAqNl9oONB1uo2iT4R+sGmJ6gDZKh+PURZX8S3kYbOo2fjLRujgMqV56lL/Uxfduwcp3ixbwQPdZVgmmPINwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+vHZb59A5QNvyJ+NKkFl4+p37pscCh3MHGL2aQuNPI=;
 b=TBloC0z/Mvi2tiLzjgQ2PxNdYiRNrVUNMk7YiaYZxgVS7mtifTKol89mFoq/vjyLSTcVQ85ovVLdWdqbsweC038VTfi0h0RDPeIAQ7IrZ50Ivd6qZtTWUUiBjd5kaCkkfUwvpMrSxz946hYBYFrtk46JP286/lpISLJhdeqesCx8boYH2V2ZGjtNuiiRN/qIHH9KtAjxtf3DrTBbqjuAgjdp3Q2RiIyO/iIeIwZYxMkQ96Ez0ntM7+lliB9KnyQA7avYqGB4MXgdOkk/QtrmO6grIFPMLkEc+ZmD2Xwz2Pgq+FMXWRc/gKtMHifp8DzHtsi8y3Mqu7PZXsHxbm4T9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+vHZb59A5QNvyJ+NKkFl4+p37pscCh3MHGL2aQuNPI=;
 b=b8CKcZ8Oarj9UoNqoV+DtkcUGh1r5zyx6OkAwGxPhnlBG38WDUpfJUeCiYM298oZFxWzFlQ6hzbcIZ8GRU7nJ2En1dzU/9BDyNJl4XBn1mRX1zzl67AN8pbgaVEiwJb/riHFjEMyQOhnkkd561jPO1ZjzjmnfkiLzAabzwDBdNY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "michalo@amd.com" <michalo@amd.com>
Subject: Re: [XEN v3 01/13] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Thread-Topic: [XEN v3 01/13] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Thread-Index: AQHY59YEGqCNePqK20O7iZ+lc5NQpK4euWmA
Date: Tue, 25 Oct 2022 07:36:50 +0000
Message-ID: <54C7F6D2-98C9-4976-92E4-3B46F82CCA20@arm.com>
References: <20221024182518.65002-1-ayankuma@amd.com>
In-Reply-To: <20221024182518.65002-1-ayankuma@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB6328:EE_|VI1EUR03FT021:EE_|AS4PR08MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: c014b8c4-0f75-4cff-5925-08dab65bb839
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DHsm1gykBPlVLK/ElpD6MfZUFLGTLzkEAX6tEr89+I7+pGCezioquG1AwU/J4ATnxSbswRvK8LShfC85NlzmPCKZreLjCKFj7eeQVSOvNnpJcwP47lejMVaKqD7pxai4Ls0G0l5SOoXdADtB7HoCOjgqhgClua1idg4VKMSVmYEfRX0XXTHNNQqxTmKHgjRj9Cmv26FZ7tSN6omksLWAFQbS1MbpVUIV2O1D88534qzKUsINweLfUv+7oTCfAxPk1Htw4RQMkeYY+PJi9fuc8vGM2Tbtct0h1okxbuHI+no7MHmPctYxmRLoXjBYzMp/95cassZoCAmFQr8JtOagXj1YGK5Rexf1GSGl/qq02U+iy7qZdHWWPdmI25rBlD1B3imSwMjGuYTwLaap5tAFrrRfKXDgAVH9ZXLkaw0/EwBWn05YMi//fxG6e42g8BvY72oBhPeXwsfvFxkUBHoOSwvlLuuqtt48qAICu4VdxMt5I6Fef6u2HPNEr5PZsmgcKdl7MkS3Gdb+JJVIZ09UFeiewunDVKNimIsZGXEfcTJqyf+jLl3GneT5Tj9Xtvlm1M8WBt5bSN3npWJvNzBgD+8G7fnJ8FFsRpA3kJH9h38+Ru6tRMA9V5SM8q2SK5WaRzQcqLbnFK10XjoYQl3JeL9ld33/PBYjSxHjyJzfr/ejnfrVqEcUfs5Lh/2A1fr8aG69ruP6XqSp6WLB6IcC8nYiUFEBiUoxYoywyqW1CQ8mMtLyQaGu4LMSOMfAOWf55vRw7PPyjFXdPbypjTNCHG2kx2I3MbjgtXzO7MCWMsY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(66556008)(86362001)(53546011)(66946007)(66476007)(6916009)(36756003)(6512007)(38070700005)(316002)(6506007)(26005)(8676002)(122000001)(64756008)(66446008)(6486002)(38100700002)(76116006)(8936002)(71200400001)(478600001)(91956017)(4326008)(41300700001)(54906003)(33656002)(5660300002)(83380400001)(186003)(2906002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21F4569C789FAB4E9334E5A2E4B7A3C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8778de3-df1c-43ef-f066-08dab65bae28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t+wImTWXtB/M1mauDQkESbg674iX2CIVl6rOOOdPi9bUJunK1LdQdDU25db0IU/m45sz/u4k4sLmtV0A8tTsjLzl6gqFLWmh1MMn/x6ZCRBc3vl2DZrpgWnLpmC/5hQm9Vr+kCFrifhI87VfdaFrDC8HUjsrd8viIpxFsxCQDWLrVvfLvCXQXp8GdgUBECnyEzw0yr9VW1egqyFX7/UmD2ejW3/nIHHH2e1xZ1g0J/WVCTAcjpbHmyHzjeR5Dnbm6Iy/EwWNTwKC9s9a9CeFo/yUPiUFNMIT1XuUhBzo6jdoeO3vda/cL3+R4ZJwPBKPyVIv9ckuTJwbym3ASUg0Le4xKrwqVH8+M0UNNhQtZ16y7UXrUvodfWOWvQe6p30gH5S7fQgO5OuK7E12bZOkXT0uMGu1jP/cqLoyr51sw8tm3qLkGvhHBrt8KCRFPgg+mFas7iCVpCZOIAXufm9SctDtmlKGBxwOa5wwiZm6VyzNStwXgYgqAyAAgHmNeMLYBZm0eK0cCXFzubGBEA/rI9CtltOj6usI1WHZLydxzNL6u+dbGstp4iADoZomsuwKaKQzpWeMiiDINMVjyE7kH8pf4iY4yzmGRZJgs3YU0LU/miKz6iEYvKN3GOGFGhC/QXJShe0QjbC/XbKACQQiU0cO5I0mxb7qU8RKcTB4OxRb3tdqmW+a1isN6dhUVd229moTfzrHuVVLC3AMKRrUNZY6EPGYMtUcZ8lt9LE0afVfxPmt+iAnif+Tzk1htZfUUCALcAr4z6ztixQEYDKtJg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(4326008)(36860700001)(356005)(6486002)(82310400005)(41300700001)(82740400003)(47076005)(6862004)(33656002)(83380400001)(86362001)(2906002)(53546011)(6512007)(8936002)(336012)(2616005)(40460700003)(186003)(81166007)(5660300002)(8676002)(478600001)(26005)(40480700001)(70586007)(316002)(70206006)(54906003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:37:07.3985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c014b8c4-0f75-4cff-5925-08dab65bb839
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7508

Hi Ayan,

> On 24 Oct 2022, at 19:25, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR is emulated
> as RAZ / WI for the guests as "GICD_CTLR.ARE_S=3D=3D0" is true.
> Xen is currently supported to run in non-secure mode, so guests will run =
in
> non-secure mode only.
>=20
> Also, if Xen was supposed to run in secure mode with guests, the programm=
ing
> of the interrupts (ie whether it belongs to secure/non secure and group 0=
/1)
> will be done by Xen only. The guests will not be allowed to change this.

Thanks a lot this description is a lot better.

>=20
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I do not think this is something for 4.17 so it will need to be on hold unt=
il staging reopens unless someone thinks otherwise ?

Cheers
Bertrand


> ---
>=20
> Observed the issue while running Zephyr on R52.
> Also, found that KVM has similar behaviour.
>=20
> Changes from:-
> v1 - Moved the definitions of GICD_IGRPMODR, GICD_IGRPMODRN to gic_v3
> specific header.
>=20
> v2 - Updated the commit message.
>=20
> xen/arch/arm/include/asm/gic_v3_defs.h | 2 ++
> xen/arch/arm/vgic-v3.c                 | 4 ++++
> 2 files changed, 6 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 34ed5f857d..728e28d5e5 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -30,6 +30,8 @@
> #define GICD_CLRSPI_NSR              (0x048)
> #define GICD_SETSPI_SR               (0x050)
> #define GICD_CLRSPI_SR               (0x058)
> +#define GICD_IGRPMODR                (0xD00)
> +#define GICD_IGRPMODRN               (0xD7C)
> #define GICD_IROUTER                 (0x6000)
> #define GICD_IROUTER32               (0x6100)
> #define GICD_IROUTER1019             (0x7FD8)
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 7fb99a9ff2..0c23f6df9d 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -685,6 +685,7 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
>     switch ( reg )
>     {
>     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>         /* We do not implement security extensions for guests, read zero =
*/
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
>         goto read_as_zero;
> @@ -781,6 +782,7 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
>     switch ( reg )
>     {
>     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>         /* We do not implement security extensions for guests, write igno=
re */
>         goto write_ignore_32;
>=20
> @@ -1192,6 +1194,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, =
mmio_info_t *info,
>     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>         /*
>          * Above all register are common with GICR and GICD
>          * Manage in common
> @@ -1379,6 +1382,7 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
>     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>         /* Above registers are common with GICR and GICD
>          * Manage in common */
>         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
> --=20
> 2.17.1
>=20


