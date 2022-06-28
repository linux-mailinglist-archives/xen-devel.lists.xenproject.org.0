Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4B55E539
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 16:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357130.585559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Bvi-0000Xz-3q; Tue, 28 Jun 2022 14:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357130.585559; Tue, 28 Jun 2022 14:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Bvi-0000VX-04; Tue, 28 Jun 2022 14:11:02 +0000
Received: by outflank-mailman (input) for mailman id 357130;
 Tue, 28 Jun 2022 14:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAZO=XD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6Bvg-0000VR-Q2
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 14:11:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 226b7715-f6ec-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 16:10:59 +0200 (CEST)
Received: from AS9P194CA0025.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::15)
 by AM0PR08MB4595.eurprd08.prod.outlook.com (2603:10a6:208:10c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 14:10:56 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::1f) by AS9P194CA0025.outlook.office365.com
 (2603:10a6:20b:46d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Tue, 28 Jun 2022 14:10:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 14:10:56 +0000
Received: ("Tessian outbound 514db98d9a19:v121");
 Tue, 28 Jun 2022 14:10:55 +0000
Received: from dc528320ab94.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C2EC5A66-627C-4E60-8946-859FF7F1F546.1; 
 Tue, 28 Jun 2022 14:10:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc528320ab94.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 14:10:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBAPR08MB5848.eurprd08.prod.outlook.com (2603:10a6:10:1b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 14:10:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Tue, 28 Jun 2022
 14:10:47 +0000
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
X-Inumbo-ID: 226b7715-f6ec-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=C6EMfvJgI/XbBbzmASxgDRnZ7yPB8MxDFqpE55CInlUg3cPMPbw52OFCMcDpK5DYXvgEiuo+DOQw4G8HVgNQ3EzKlr9whLAET7Brkqpl5n2RY0VsGIlinum3TWfyX6+x7N8z6A21fI34MCHEZajBdOwdmvE3wN88WjKWGQMb9xw9bGNpc1k4m2B+43wTV92PfoGaCM/tkA8bEv5qjLkJx9YzrYI1LZDXESWciLodP7FMk0Xsdo50Q+hkY5yNf731knoPnaGxyDT0rx/KuOcoEqBNhYBxDUPODXSchrfHH0iWPoBNf8cBjTKe2xUN6/LANKu1WAVH6Sr3dndIVQPdig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btgu3gFaOZvs/7oOpXmKYmRQ9KcHhN6NVAvkKMpBd8E=;
 b=RUI3ijXShf47jm+fmsiEd7RCO7e6tFYYqt12yZl0ovTD5bVr2VBM6k7Daf+iid1BmSjo6ca5oAKvxE/7rqhE6AnsRabAccC0m4Q/z+jEzd/S5Kc9NpkFgos4mNuDi2PTiVjP48CCKFXKoSbynI1pO/LPBr6woNG2Pg+rCWH5+Uxzz4WlIRQT05b7TJE9JEh9bApPI54Fd+XUDJfBZGUkt8pj2Sv1FZMGH0PHISbWnx4VCF7tm9sQ0TAJLqCxDDxecKHhcq7/DwhyXGsDnCN8WLDyeaTELy4OC1lZO8/DsWEgSZ4YGaUpp7WuMmD5JYYxFpQtdCx0yekGfRjEKmYhMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btgu3gFaOZvs/7oOpXmKYmRQ9KcHhN6NVAvkKMpBd8E=;
 b=ZdRFZp9KxhqXgx/5st4vGF2nyKEwsLGgbuzILolefSiljgYkfODWTW7BGfRFKxmppRAdIWpY4KSTSDyBJrMITDKWLC7wfrnpQJK7cqfLCV+vN7kCpwYoRonX57wTjSTryPgeQ5gS7CyOqacebMxWJxnbcbLmIoFHtcsPO8VdWHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7918aa1eb295c601
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW8e7AoRqDFhdZb5vzJZyPd78K5v88JFKw3Rw71Ng5oDtw+PfUGW7xuq9Ib2FTw4DnxWwAwrk4uQEUugW9TSuyptprBF3HeoVUY2fehG27gPuTEWfluAXHc5248b6zideD+k6FK07V6/VIZagoogwE5ezZhl3fymeIJlzB/giccMZLlpeYibKtrlbRH570gxdQVrbk7PZMih8/u47du/bxvrmj29Ez2h7yosNt3T1qHaWdOD+Z1NwAwoo6/hRxtGExoTb4qxQIBbei++/MhjYinF7p3HgOK7Y1+ReFDPns5cQjlnr77/pquLYyfaC6kEXqfrxIEiNq4PbFdhASetfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btgu3gFaOZvs/7oOpXmKYmRQ9KcHhN6NVAvkKMpBd8E=;
 b=iEj5/u7VWyKIq3eBmZGIZJdO3eV+Iv/TIvhWgHGZ4unCrjDH8+bTM6aZ5y0mnm3GvfiHmcx2AJ8aJNWVztnlEYU+mAlRIo84ZZn4OvMSwYpZuW+pVOwjRcqXvnYIPR8DgRhNBka9+iKEMrT2TlNFHxpm0AN5VxBe+I3hWIXxBlF116MM+H6KeG4fr8AnKG60DNlgIm2D5J+xT8OaEM066adj3NAZaGsBb1a9uIbjF/B9HC8C/CWVDmCUmGDaSFYtCI+s4NcKMD67frAMtxPF5jiaEA2raeTxtxisSiZxgFAUvUVevZVhJiESstS7k8JzBAak0L4/sXbwpyQYyOBRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btgu3gFaOZvs/7oOpXmKYmRQ9KcHhN6NVAvkKMpBd8E=;
 b=ZdRFZp9KxhqXgx/5st4vGF2nyKEwsLGgbuzILolefSiljgYkfODWTW7BGfRFKxmppRAdIWpY4KSTSDyBJrMITDKWLC7wfrnpQJK7cqfLCV+vN7kCpwYoRonX57wTjSTryPgeQ5gS7CyOqacebMxWJxnbcbLmIoFHtcsPO8VdWHY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 5/5] xen/arm64: traps: Fix MISRA C 2012 Rule 8.4
 violations
Thread-Topic: [PATCH 5/5] xen/arm64: traps: Fix MISRA C 2012 Rule 8.4
 violations
Thread-Index: AQHYiaFo/vW4vxzYIUWAwsr8WvFDwq1k3nUA
Date: Tue, 28 Jun 2022 14:10:47 +0000
Message-ID: <B2F18894-0287-4B04-9062-2F8AA448F55F@arm.com>
References: <20220626211131.678995-1-burzalodowa@gmail.com>
 <20220626211131.678995-6-burzalodowa@gmail.com>
In-Reply-To: <20220626211131.678995-6-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a733ac62-80a8-4346-0065-08da591004d7
x-ms-traffictypediagnostic:
	DBAPR08MB5848:EE_|VE1EUR03FT017:EE_|AM0PR08MB4595:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cfLBSHggKJJClyZIQPAnKMMWWjluJz3yy4boXTZ/GrlRPsiiF6MiU4SfC+Ws2dLEp0agkqlbezYhmyH5bzJz8IJE1FfBohqauzkyt0NlZh2k9AW9ZB3pUHqXCgGQ65G+9hhOa3ZgRcFRw5AO4TnxOO7cOakno6CHY71s+n80wX2DGgKPJETSO2634uMGksTdvPxz2n3qcWBB+1YQJuyUrWwgYG8asN1KK15GCiIFm9EraVw7KnqJN15aVj9/ZGkOmYUlk2tq6OeacmVE6OEjSvp7E+uMVWXCT1KRe7akeRV/B+vKGLZW7+1uvOtwg5flgO3Kv/Mk5LLtUYxF9zGYgaFY6B/4NN9F8Spax9aYEfiTn/gxnb93BUJDP0qEUwUqE3VveSnTgmJwzWNws5/Sy/lWiefH82GHIXrW2WOXqDt2pQMX381UB557d93mR9GJX1G4Th0bNvWdvSavXsnYZekUUJJrMO3HzZ/j1kuBZ454AtPEfXx37KD0TeZi4U9NrDd5QUvcRzslCmuUweHJW9IZaiBC+azGyYEOOgB1Wld9m8DQWV7SeKvrbcYISnCZXhxK05n1+74RmLvvR/6dD9yvGSV1kn92meAnHYhsQKvGNWRDPuSxSeEpGoAPU/qj+ndDXzadJJTRK/0XayOW622YRDuLz9NOKUrZH4yWLox3EkShHM1o2rm1tcjtThTOHUnBOtzAmavhlCTeV1SYUQju/M6bIJDfB7GOZLFTOcVo3dH3J55t2Y0cHhGs78bGz2naIaeu+Z+iWUmqMyFECSjjxj63iYXQCFElfgJVW7ObR5cbJ7kaVF78L7jexcBWtGQwogbp/K/l6u/BEIkkMw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(53546011)(76116006)(316002)(64756008)(36756003)(54906003)(478600001)(91956017)(71200400001)(38100700002)(26005)(4326008)(6506007)(6512007)(2906002)(6486002)(66446008)(2616005)(5660300002)(41300700001)(38070700005)(186003)(6916009)(8676002)(66946007)(33656002)(86362001)(8936002)(122000001)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <882CDD81444C92448797352E0B476392@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5848
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40b2e281-a62a-4480-2c83-08da590fff6b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AsKZrKIZDQ32JaULLu8ngs49z7u8OMFHqFquE09HaNLmTlgMvo0XbbbXd/Oz/imTan05QzSAK6zFqxkJC9BJbxCrpHAJ8T1a/Rr+4plShy44aJ6jg6o/9p4yjlSyFgJJzv1aBgxGPB2iF4Alu/QzQfakger9q8A4gLXVWpsPIsSSmacAjupJJ9MGHZkTyRIId+CcohtvyDWC+K98jd4ICGqg/IXubq5tNgW3Ls1Zgg+SfVEuQnYlVw/5cXT1UL2vd2ExjDN1vJR4ax6wL0EGi1avgn7PQBR5My4REcgBtp/2GG49tdZhj1NxJ+ROjsBXQkeLM51FeaBzXmXfRazMAtJvevcXRmRPhvVuznZ9BFp7kddJ+r6TQ6fLakEAPC4lrBpL4wDvsZdS5P6yH6v6UPKT5vqlF0uf/KaBfWaaR5oo2wFmmeTSuDmKvmtRC5h/ktEKgzNKX863kfQhowtBwQSZ78fWBw+iXp1X7JFxWcfwL/PsJa9FaV8Y7GO933+hsh5ggAluDcDadNhCXySId8MlwbdCVV01HoV39Iqgn5f/qd3s3oLaS0TXzKtucg3Mqqo5Ej27qdbO3UCKS6PllcD8WZ3Ydqn8w/p3VZoEZSsiiBEFPb48P63SoI8y/E9rS5MmHhDgEq95pBeMBuPpvB6XnRY60EPQSdXtdWuKOmFkmuZSFkgkcYx0G3aVOORD8gxsBf6W5IkXvVK9lf52HvQV0VHj9tolkT3U/DgOx2Cfqd1mn4+Q8+igIJBapMKSiroTgeTwIYaBN4aQvCjpk3oUirZrhTrKIcQqRz/hxXs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(186003)(6486002)(107886003)(478600001)(5660300002)(2616005)(33656002)(40460700003)(336012)(36860700001)(40480700001)(41300700001)(82310400005)(6862004)(47076005)(83380400001)(36756003)(26005)(8936002)(86362001)(316002)(81166007)(4326008)(54906003)(53546011)(6506007)(70206006)(82740400003)(70586007)(6512007)(356005)(2906002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 14:10:56.0957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a733ac62-80a8-4346-0065-08da591004d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4595

Hi Xenia,

> On 26 Jun 2022, at 22:11, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Add a function prototype for do_bad_mode() in <asm/arm64/traps.h> and inc=
lude
> header <asm/traps.h> in traps.c, so that the declarations of the function=
s
> do_bad_mode() and finalize_instr_emulation(), which have external linkage=
,
> are visible before the function definitions.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm64/traps.c             | 1 +
> xen/arch/arm/include/asm/arm64/traps.h | 2 ++
> 2 files changed, 3 insertions(+)
>=20
> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> index 3f8858acec..a995ad7c2c 100644
> --- a/xen/arch/arm/arm64/traps.c
> +++ b/xen/arch/arm/arm64/traps.c
> @@ -22,6 +22,7 @@
> #include <asm/hsr.h>
> #include <asm/system.h>
> #include <asm/processor.h>
> +#include <asm/traps.h>
>=20
> #include <public/xen.h>
>=20
> diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/includ=
e/asm/arm64/traps.h
> index 2379b578cb..a347cb13d6 100644
> --- a/xen/arch/arm/include/asm/arm64/traps.h
> +++ b/xen/arch/arm/include/asm/arm64/traps.h
> @@ -6,6 +6,8 @@ void inject_undef64_exception(struct cpu_user_regs *regs,=
 int instr_len);
> void do_sysreg(struct cpu_user_regs *regs,
>                const union hsr hsr);
>=20
> +void do_bad_mode(struct cpu_user_regs *regs, int reason);
> +
> #endif /* __ASM_ARM64_TRAPS__ */
> /*
>  * Local variables:
> --=20
> 2.34.1
>=20


