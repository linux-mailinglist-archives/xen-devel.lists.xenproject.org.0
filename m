Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B487E5A07
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 16:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629328.981473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kWB-0004bL-VU; Wed, 08 Nov 2023 15:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629328.981473; Wed, 08 Nov 2023 15:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kWB-0004Y1-RW; Wed, 08 Nov 2023 15:30:59 +0000
Received: by outflank-mailman (input) for mailman id 629328;
 Wed, 08 Nov 2023 15:30:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfAH=GV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r0kW9-0004Xd-Pr
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 15:30:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceca618d-7e4b-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 16:30:55 +0100 (CET)
Received: from DUZPR01CA0183.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::21) by DB4PR08MB8005.eurprd08.prod.outlook.com
 (2603:10a6:10:38f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 15:30:52 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::dd) by DUZPR01CA0183.outlook.office365.com
 (2603:10a6:10:4b3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Wed, 8 Nov 2023 15:30:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 15:30:52 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Wed, 08 Nov 2023 15:30:52 +0000
Received: from 5bc8f35369d4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDCFE0C5-A4C5-49F8-95F5-2C0F2BB0B66F.1; 
 Wed, 08 Nov 2023 15:30:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5bc8f35369d4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Nov 2023 15:30:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB5891.eurprd08.prod.outlook.com (2603:10a6:20b:2da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 15:30:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 15:30:39 +0000
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
X-Inumbo-ID: ceca618d-7e4b-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jxiRBWIaLh1i3BmkaHr5NSiL0YzcnGzYA5JdZcli1e4I5ot/ik6Z5NpGFuSXL/xW/gpbWEC1OGLE4QkC11JsJLjcppZfzDkDFa5UJIU5xVA1U9c4eFgJoFj0UHWgiqeklCe51P/3+vvvGWaXLFKxf/8CHR/YMEcM8doR2pTwyqJPq0SZiGeZjjLIwlyNwv13+ZoDeqCQd8gvuJmxFpzZ5rz4L0Do47NbLdGDdC3W9UiDpU3TVhe1poXqu8wX2ZgcHfUSsmpUM7u1aseKG49gtR/Zte6Ow7fqDAGX3b7TFzo8J066wj8r+drVVdIdojATSN97VpqR/iPQQDLEm9tAqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvPoSM6qGI5xJQqJZBspoymTpXQyKl2zMA1yo6eGV4g=;
 b=Au1zXUFfsTyYxNjPnup1yTQciCV+M1uIXckGdjaQIPeql7vtcI7NnmNQe1XzkX/rvmuPIwXXE2V4bX7mtqqjKqLW6dWJzILH54mi5aJjSJ7fAsoKsEptN8++K1E9BO9cX5QPA/9GR2XYNMVDSDDzUpBoRs0qyiecLu0Epvx4fe+GS3mrEkSs5r6fuQ1hyxAFCg+/z0lCMATAR1VfsQpUfJxqX4BrnKvCgji3SWATTbZxjk2oxAhxvyrVVNe4ayOsLreFLS95xAfOu4wAem5WMM7IWFsJVTTzVftuXI39kIQG+P8m0dQuxfch6HF2f5dGwdzZYfR40m5mvRkPvrBUgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvPoSM6qGI5xJQqJZBspoymTpXQyKl2zMA1yo6eGV4g=;
 b=iOo8OVwYLmFdITwH6CwXTkeLsLNNLfOxbtns+wfJTaOjDgRDmjAXqYhWeirJkjtuJvKc4pEp0idwBZ3rpsOvQ+/tJY6Gkp0LEJVpm+4I0JVYAkI889RRPLxzmT30/kIM9GivLhwyxj2QfSM13GfIo+8+j3RncXcCN4TBz9fNRHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a5f313f6acb36ec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwLZYPbuUxZTEqzXFprG9eaSGo9mVen7m6eS9Dk2LhoKQnoPMrlhTaJ7qHdunyKYeG6Kp+sF5Dx047Zxk3zNtdC8tCa7xNGLOdGjHRoyxYX/i9Y6xY0joZygSKtaSghl1yUG6telw3/0HKTkpbjk6/YqpIe7IIM0Qi98cZYyp8R5zO/V0UzAs57A8WejhtI4avphLOs77oElI1aqgbJ8beem/0Qy9Jp6mWZvWcAl89jh1OYbLmKzDD3FColE5c5f2kvhvTG+oSnn1sYISygDJuNDPXIrs3Zy7907PONDfMgn9Tort4JdUny7+baounOIsmcMvly+z3Rrjns9OfMNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvPoSM6qGI5xJQqJZBspoymTpXQyKl2zMA1yo6eGV4g=;
 b=HvdOK2/TYiMea1PiqHnk2RSxwaniNe+Ns2F0X65LBAkU6pDocbfxpNDi5aHBrVP36f+Kabw2eK/5aCicR8zMI3STRje2fY6mslIngs8n9Z+0bt6t2kqgFdfwTcdBkyQDXF5pQO/XlPapGyzHDntxVM9rhz1FykBsesMWcwkyJ0qXMixHTZY9PDl8CxnoNilkMJ7h03iZPJl9xY0KXso7bfZRpMb5Ov2fsOBnO546FdS8uBu0PowjW5NXCzHR6i1FdeXUZIS4C8qoxHhwNMCKtmtWaPAFmxQQoC8buAI4BFyikt/c1vJIedwK7mCbcI8V/3xGO/Zv5ZWdoBI8y0Zgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvPoSM6qGI5xJQqJZBspoymTpXQyKl2zMA1yo6eGV4g=;
 b=iOo8OVwYLmFdITwH6CwXTkeLsLNNLfOxbtns+wfJTaOjDgRDmjAXqYhWeirJkjtuJvKc4pEp0idwBZ3rpsOvQ+/tJY6Gkp0LEJVpm+4I0JVYAkI889RRPLxzmT30/kIM9GivLhwyxj2QfSM13GfIo+8+j3RncXcCN4TBz9fNRHY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18 2/3] docs/sphinx: Fix syntax issues in
 exclude-list.rst
Thread-Topic: [PATCH for-4.18 2/3] docs/sphinx: Fix syntax issues in
 exclude-list.rst
Thread-Index: AQHaElgomb1OqAEcd0WYXxuMqcqFm7BwjFAA
Date: Wed, 8 Nov 2023 15:30:39 +0000
Message-ID: <4477F755-39D5-4560-98F1-92D37343088F@arm.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
 <20231108152727.58764-3-andrew.cooper3@citrix.com>
In-Reply-To: <20231108152727.58764-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB5891:EE_|DB5PEPF00014B8B:EE_|DB4PR08MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2ef4d1-340d-4504-6d5b-08dbe06fb148
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZK72LVIxAf/ZhSDqgzNgKh2KCaWZ6nbeRaNODSy7Jf23BeiyFAlL9tY+MmW5G6u7MylG5epme3kwk6ON86C+fH50K+hbGsyOaV2D0BHELoxOhNXpaeFpZkdui8pkAwtVN3D8w0tu3OZZYD80frvC92AfjJ4yZcBo9SokBzIo6UyX8wbGVQJIsIGVetpMC+fCQ+OFITnRrlGM7whpgVcxgtcggoAipKfn61QsifBwMvkcZjw+uPcKtbtoupEu48BwM7CAzUvH9XcYGZZ3zvm8RFIpgPdBZClVYmdbwfI0eQy+1vKG6hXufHSbEJTCRvjotKiIZh9x3WnLC3hFWvYq69R+l7QpQNiGhhzngjUOqUDKnv4b20IFRwZwZAP1FoFIpM9AuXUye59biBfoPqG+5ZoCE7Qq8WzCMH0zfI90twi1d/O+KQRKqBpulx7qYhpiilhlPIlm9xc5qdbDG31PrAowGW/LoMb0vRZq8nmpUimFGcQwrgU/kg8kRokj76AkEdyupodgKgfuDrxR6zVjvaGE4yV+tnokghhAoLGFn8uPcn1eCJf38smmZqaEW9psb6e9PxZU7YnExikeNqtSwHT6WAluQV/UMmN3Yo0sXWGObYzzRoJUUUHQg2YCHcBspEALfNRKd70VbVdDT3VD3tMp8UyK1OAYSlatH++eCk3KKq54RYZb2945W+sGecvE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(186009)(1800799009)(6486002)(478600001)(38070700009)(122000001)(33656002)(86362001)(36756003)(38100700002)(66556008)(83380400001)(53546011)(41300700001)(6512007)(66476007)(66946007)(6506007)(91956017)(76116006)(64756008)(66446008)(26005)(5660300002)(6916009)(54906003)(71200400001)(316002)(2616005)(4326008)(8936002)(4744005)(2906002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD5F8C279D9845418F2A4E97E6280F8B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5891
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc693b41-2cc6-4b79-5e5c-08dbe06fa989
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/3V8e+JMhDBGmHTTITZipVwiKDEQnYxiLT/SFqtDhzdYXGovDb3a3LrUgAo0cDI80/NIfTVFrKqd7wnN9j20MNmznsCuowxTKR8vdQxElKEGl2idMa5KNfeQigNUmRqyOoQvEXulDtMKR/HfLBkVvlqTWH5wXcb3VVUEE8PJ+JkUMexqy6g6q1jfMQu+3svAhBypFufnnbq3Ny4iRgHXokZn1ksxA3hLw7MOpTlVSRaTKgZziGv+pxF4/54N1pxhDXnLVeTdygYHjzghJIoquXi7hd5k2x4FxhIcRGf+Lkr5TK/SoC4xycFY904nYs0D/4H6l7zbecyLRXQgAVNBzN1YojAwOKb822v0eEnS6DiyQ1s6VvFSTG5DMf8/cTJceAQc49sS7UDUNsF/lioJn+5oPlIW5u4S0Hm1iUMEoEIs2J1xgsFlscvhn+IdJHhFnTJe/D7ciyDrQZ+S2XtU7ZWYfkZNc4vtCiu+EkS9hB0V5rg0btxn8/Pgq3uK7g4pN8LXzOnOAaV+hiP0YLRbYJ3kz4E8UCnKRai+pb6iCMnlXp0WZsYifEAasWv4vVcWMyRh+0FNcp40OIjc3kWHZEwWXqoMgFX6BiKdSjMwylMZY0Ji3RsMj0JGzqc3RdjElR84IuiIkDfXD34zJozOzMq+ucjOxQ59s1+NFK0qocbxMzzBjNe1l7Mj99tXtyvAzPKHDs5h9iRakTDmyIJu0FYpsmlairqgE7BvciROYzgHC44mw2cG+1kUczrTUD2rsbLjMZ6N1qC1rg7wfpylVCQL0MVXzCcbWwXjfDXQ0qE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39850400004)(346002)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(356005)(6862004)(8676002)(4744005)(4326008)(8936002)(36756003)(82740400003)(47076005)(41300700001)(81166007)(36860700001)(83380400001)(26005)(336012)(2906002)(2616005)(86362001)(478600001)(53546011)(6506007)(40480700001)(40460700003)(6486002)(70206006)(54906003)(5660300002)(70586007)(33656002)(6512007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 15:30:52.3206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2ef4d1-340d-4504-6d5b-08dbe06fb148
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8005



> On 8 Nov 2023, at 15:27, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> sphinx-build reports:
>=20
>  docs/misra/exclude-list.rst:47: WARNING: Unexpected indentation.
>  docs/misra/exclude-list.rst:50: WARNING: Inline emphasis start-string wi=
thout end-string.
>=20
> Nested lists require newlines as delimiters, and * either needs escaping,=
 or
> put in a literal block.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

Thanks for that.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca




