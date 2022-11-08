Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33ED620EC8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439969.693999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMgt-0005tx-2L; Tue, 08 Nov 2022 11:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439969.693999; Tue, 08 Nov 2022 11:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMgs-0005rM-Vd; Tue, 08 Nov 2022 11:22:50 +0000
Received: by outflank-mailman (input) for mailman id 439969;
 Tue, 08 Nov 2022 11:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuAS=3I=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1osMgs-0005rG-8i
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 11:22:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acf48838-5f57-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 12:22:49 +0100 (CET)
Received: from AM5PR1001CA0009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::22)
 by PA4PR08MB6013.eurprd08.prod.outlook.com (2603:10a6:102:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 11:22:43 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::8c) by AM5PR1001CA0009.outlook.office365.com
 (2603:10a6:206:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25 via Frontend
 Transport; Tue, 8 Nov 2022 11:22:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 11:22:42 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Tue, 08 Nov 2022 11:22:42 +0000
Received: from d997d50dcdbb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 39028DED-C46C-4702-8E79-7DA1C3F76738.1; 
 Tue, 08 Nov 2022 11:22:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d997d50dcdbb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 11:22:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5812.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 11:22:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 11:22:33 +0000
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
X-Inumbo-ID: acf48838-5f57-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m+NPF3pZAWUjPQHkadOmUXe7VkoL9RdBxlfNiJRbiFvqRU2a1VrSKcG+jn+m/nInIZV2A4YFRuWQYvz8H+qQzShaexVsmjltLB7tCwMWzpzGLptyRN0QEkQ3e6IQgDG6FuPCRrDV1n3aD0fPcMVpQAI0QtMsDJzF0v/5D9rf4emVZ0dUVjWVNG3tDEqOFouXkcpvKqtlXFj0qhrskZNP8oXa7/SwTPFOPmus28ExWSSDVlRbqVyzj6W6K98Bi5eDMC4IzDqn5Tu2gxC+l9i790W6P63iJfR0CWO45Kt37WLJK0YvyJOK3u16SfiyViUKblPzMDqZpALcCJkgYsmcpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctSarpqe0aWgVPoCD6N3eCH6G/W3lXgybkfIntDyAis=;
 b=JTFCuRGXOyyMi26pxGhGboFGR86NJi8tLzMoy0Oa1nN8Wx92yw0w75nTY6006EVTpRZ2GwqW7uySFPbJY82HIZWRfhxS5OnwjPjToNDHhFu6h0Xz65rOMmTo5LAUo2qpIffAZiQuVHKpGIvIjrdb3/GVXZA/f3ONkPTQ0mfKpOELOLJnhoOv5QkV1uBNRKHnbl7u+YHZNmInaIHC4dxescvIDQ68HYC082HOtcpRJHiAWLjQzjEgNFccqA/vWh5GDB3hzsXbZcR8CWwGz7Cn19tf0xBkgqG++GdU+gMHJPr+1vh+sd8FzI0JluCWNfjPTJs+DCRcp2QoNd9iqPmsLw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctSarpqe0aWgVPoCD6N3eCH6G/W3lXgybkfIntDyAis=;
 b=uQZ4vzsBz5qpuMK1Sc5vcsDvHJrZjtwz4LBt0j5a8f7dyB0ewUTIDJR+alIbaoLiTOwi6YZYm4gHcLo59WWRTMSzdbUrwwRI2gDZva3UyEfwBnpjuLEVyrbXt98U6Rfl7IqAHf6WJLSXhiPqhOYPmnavUt84bsz4oyuH73nmQfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dcc1c955151afcb6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMQ536QVJPiYI5eNZXMhdzhbGNN12v/u1h5Djoo1mQ5ZE5AXnb9nag+591WfJSNPrDyCt8djYiw/9Z7o8RYpjlMHqOs+X29fo1+eJ7RS70WMIHjXxLkpgMtZBBcrB/qGHuC9baYR30UfYRmChnCHCRsgX4M7OX5hv2TK/aOxAYz4bfq9IAvApo5JJMW82gI1nywVQhgRBLqLFAqae7Ao/y2wQ18RgmrU4v7Ym5ZqKNpvaxTWC9nE/ESo6QsSpy15ilPaW0lBddflZZQw/cf72ASgvVzpM3cnlGXNjnBnjMT91e65HfjpYcmItq5Kxpy1fXyZlHHVO3f2mHFEnV2tIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctSarpqe0aWgVPoCD6N3eCH6G/W3lXgybkfIntDyAis=;
 b=Aw9J8sEc5GXxpD28+BaCrpTs4oGbpYYXshi/Bv2FRpzSEM4wlwtQK+mQGkpZnEJSzYB2sON2wZ173Q/+laoEIMyVmmZQR5MH/eE+GvJzcyMRdQvlso8kFVaRqOD8g4KeD+bYtaQD0U31K+rp+RN71j/SXSorzTS/kzRGWG9I8L7/+E4E8h6FJjKdp6J9NMqQX35GSODi/xaRQrSAdFVQCk9htRh2ZLeAny+ryQwWhVMMYhTiTo3sPj4PhHuYWXiN/MuCUD37pP0MZqOUWT49LCY57SOVHUL7eu477+oONLnDIpQQ1VhxaNTh2ZTK+s3677XXZ9k6Vf8O/7lRFKdQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctSarpqe0aWgVPoCD6N3eCH6G/W3lXgybkfIntDyAis=;
 b=uQZ4vzsBz5qpuMK1Sc5vcsDvHJrZjtwz4LBt0j5a8f7dyB0ewUTIDJR+alIbaoLiTOwi6YZYm4gHcLo59WWRTMSzdbUrwwRI2gDZva3UyEfwBnpjuLEVyrbXt98U6Rfl7IqAHf6WJLSXhiPqhOYPmnavUt84bsz4oyuH73nmQfQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "stefanos@xilinx.com"
	<stefanos@xilinx.com>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: Re: [XEN v3] xen/arm: Enforce alignment check in debug build for
 {read, write}_atomic
Thread-Topic: [XEN v3] xen/arm: Enforce alignment check in debug build for
 {read, write}_atomic
Thread-Index: AQHY81buqq5XOHkvVUuD4StMug7I3a404hsA
Date: Tue, 8 Nov 2022 11:22:33 +0000
Message-ID: <DF3DE2DE-01CF-4929-A1C4-A41E928AED3C@arm.com>
References: <20221108094503.40253-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20221108094503.40253-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB5812:EE_|AM7EUR03FT038:EE_|PA4PR08MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f13ca81-3998-452a-9da1-08dac17b8db7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HRvwRL7DeukP3DtdNzM/qp2QWsJkyXOVhcoWcVYVfYM94wYO0oCyNi2b4xbOJbOYNKh0CcpfikPHHObzfWXSFL96ZyiksVNaLHOI4jJ52liSir99ewk/ArDm3VGF1zTtyLEvs7j/JxLsK8Q2f/mROuhqoZ6Bf3WMRfXMSWb6cwiGTnfqGhQc+g9TRia1g6D/eparGDabIG1o+xb2+vTNBqbgH4aR02yspDDQySxwg0ZpUjZP+XExG/q63YdL8sSlce5uE4TYCjXkx7ZQBB+cMr4lU47orFCLHlq2VVWbB517gtZ7pj3q0xEXiTQwA7WPiDNKY/sHHP1BZcjSlpch6A6DMCJKm9n3z2z8oC0plhfFNVyspo57JMGQkOeQXVjd9eiK5zKqtusMvPB7qIPmvhTAdZNrN3Wa6j0DoEmZ6uwNiq6ukOehznjYzVoN1Ppeh7De/KXL+DX3eB83ledsUda6l+F9iCI2HTSkESDRPsGPorGsHkV1KY3oXqMrxFKaszEK9qYV0GmF5iTHnzx8+3XZWjyyVkZZuJioCMIrH9iLKl3tcRiOud/iNz+N6EZEum5zAg0HxbpjuJsaRjydGnOZ66Fk3LiWkm/0ZWyhkJymQcKOb3oWsK+H/u4Z8PaLOU79AluriC7zXFD0TCtioCQr9WdldYS5OWXtH0DhoWng/8rH6WsSDwo8YX5Q8rUDlWU8/bVLUtiBIrVfDFsrdUpaaVU7aDvqMUBMNT8skhmvtm+qucqMcOkg3TQhKoxWkCjpoee2e8J9qdwLFH37OdE9engqjJVLUjHSB2KYEc4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(8936002)(2906002)(66946007)(4326008)(66476007)(66446008)(8676002)(64756008)(478600001)(91956017)(76116006)(6486002)(83380400001)(71200400001)(38070700005)(33656002)(316002)(41300700001)(66556008)(5660300002)(122000001)(186003)(6506007)(38100700002)(86362001)(6916009)(6512007)(2616005)(26005)(53546011)(54906003)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29DDA9CA941DBD4890D18625C28C0172@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5812
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	539eff3e-9142-485b-e580-08dac17b8810
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4KE9IPpK+d7Eyq9w8dmOzmUHqnPzuMscUaYNABSKMEEOjv4iSxDHiql1fzxze9Fa2amwUNwBGXtlq+JRS5VqA2wK6tUqEWXgoDf4G49/ZyLqd/lDd7UXmo90VKmhOwj+1SqfV2hOHeiHcaklxKboIW9cJaV5RDnQffoPsIPfG5jJ/r+gT4UONlVkDX7v4CX/vxYFB2DQBLKt8ztkSc+UGKYlL1H9CbNCPCQfXYUmkTs6GH9FDyY+6vGqOhBaWPf4LXGby5f5PidIj1BIaJu1yAa0zgLZmjJl1qCGqJVTUWvYftsLyVAKLn27Cox5knRonD3OA9Jl2AtYX3o4E0oA5tfIjgDWFcsloEpVfdBwA5GqKPQMSsgPEeqKqSE4AkvW26RMswjQqXw38x4yFf3OqH2xdMw0lNhSclQnxzHONJnyGrmehefj6+JU+TMVoZ3OGgciYNLYlHwDeNu9Ld7rhhBFU3K1B3+S13dKWH3zZwBLd2GUWKNEb0z5vq3owV5nfTu7gYvvYxqCMKrhLgVeKggJE5cddn/TBnH4Zaed9xSTgOF1/RvKsWOP+SUc1DeUwDHZvj0PbDftliuJz+dTd9x3s/k0q7WlclhmPMocF+tY35AiirlLty4Ywv0EVNVJmKyTcuFai4iBiFEKX2uAlk/PuZ09D4fSr2xw/S+r7ZJe65mgHbtdXGAvjHREVpv98xYsOebTO6XioScu4kt8CsOyuZN+xBxe8/8RMM2uley12uwBZmdx4AEwEIdMtvvqlJLe/9+F1kVSa7XocErp4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(478600001)(47076005)(5660300002)(6512007)(36756003)(8936002)(33656002)(26005)(36860700001)(6862004)(6506007)(53546011)(316002)(336012)(86362001)(40480700001)(186003)(4326008)(54906003)(6486002)(8676002)(70586007)(2616005)(40460700003)(70206006)(2906002)(82740400003)(356005)(41300700001)(83380400001)(82310400005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:22:42.8636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f13ca81-3998-452a-9da1-08dac17b8db7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6013

Hi Ayan,,

> On 8 Nov 2022, at 09:45, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> From: Ayan Kumar Halder <ayankuma@amd.com>
>=20
> Xen provides helper to atomically read/write memory (see {read,
> write}_atomic()). Those helpers can only work if the address is aligned
> to the size of the access (see B2.2.1 ARM DDI 08476I.a).
>=20
> On Arm32, the alignment is already enforced by the processor because
> HSCTLR.A bit is set (it enforce alignment for every access). For Arm64,
> this bit is not set because memcpy()/memset() can use unaligned access
> for performance reason (the implementation is taken from the Cortex
> library).
>=20
> To avoid any overhead in production build, the alignment will only be
> checked using an ASSERT. Note that it might be possible to do it in
> production build using the acquire/exclusive version of load/store. But
> this is left to a follow-up (if wanted).
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Julien Grall <julien@xen.org>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I confirm my Reviewed-by.

Side note: You should actually have removed it :-)

Cheers
Bertrand

> ---
>=20
> Changes from :-
> v1 - 1. Referred to the latest Arm Architecture Reference Manual in the c=
ommit
> message.
>=20
> v2 - 1. Updated commit message to specify the reason for using ASSERT().
> 2. Added Julien's SoB.
>=20
> xen/arch/arm/include/asm/atomic.h | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm=
/atomic.h
> index 1f60c28b1b..64314d59b3 100644
> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const volati=
le void *p,
>                                            void *res,
>                                            unsigned int size)
> {
> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>     switch ( size )
>     {
>     case 1:
> @@ -102,6 +103,7 @@ static always_inline void write_atomic_size(volatile =
void *p,
>                                             void *val,
>                                             unsigned int size)
> {
> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>     switch ( size )
>     {
>     case 1:
> --=20
> 2.17.1
>=20


