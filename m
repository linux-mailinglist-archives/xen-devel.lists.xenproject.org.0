Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F24B54F439
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 11:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351236.577820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o28Ef-0002Li-7M; Fri, 17 Jun 2022 09:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351236.577820; Fri, 17 Jun 2022 09:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o28Ef-0002Ik-4F; Fri, 17 Jun 2022 09:25:49 +0000
Received: by outflank-mailman (input) for mailman id 351236;
 Fri, 17 Jun 2022 09:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxT3=WY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o28Ed-0002Ie-Lr
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 09:25:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77787cc5-ee1f-11ec-b725-ed86ccbb4733;
 Fri, 17 Jun 2022 11:25:46 +0200 (CEST)
Received: from AS9PR06CA0761.eurprd06.prod.outlook.com (2603:10a6:20b:484::16)
 by DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 09:25:43 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::ff) by AS9PR06CA0761.outlook.office365.com
 (2603:10a6:20b:484::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Fri, 17 Jun 2022 09:25:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 09:25:42 +0000
Received: ("Tessian outbound ff2e13d26e0f:v120");
 Fri, 17 Jun 2022 09:25:41 +0000
Received: from 1afc6d2d7871.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19D19E18-8679-40A5-AE23-75D66F53ABCB.1; 
 Fri, 17 Jun 2022 09:25:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1afc6d2d7871.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jun 2022 09:25:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5611.eurprd08.prod.outlook.com (2603:10a6:102:85::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 17 Jun
 2022 09:25:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5332.021; Fri, 17 Jun 2022
 09:25:32 +0000
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
X-Inumbo-ID: 77787cc5-ee1f-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L+PNvsLutLS+cySQG699rlXYjGBWukGTQ1nKS1uCIYrtiBW5npeFJMnD5/YYWgjuPA4WyUW2G92G+PiMzjFY2Uhm0TN+r8uH/3Jsb7QcMUM3nK0IiMU2i62mYP2eyfkCu3YhV9Df8bdR+0czyRKUIO7aMpePJL9tTJLhL4G4cfkubYwp4UPM4Aduyq8U4D+cHeF9RLospSnEfzyCOtQdFckJx47Kch6I8NDwWpFvDesepPrKkwxSggzW+qLggJAVl3woa/9JuzQYxGjFEav0Qt8DFc1aiGncQbykDo3TlEAq39OvOZcp9EDB98HNS30ABAlGR/Jc3e1Q8ojryToldw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uo+zauEWG+FJqJpZXcm9xKRVr1oloIRExHq6SRmPBzM=;
 b=JtdHHjG17E35VwN/PVPdSpFDR9U4Dp3O1wTq5+r+5Q6nhbDQm/dXHqAlUML0NNgIXCjoNOr+aa2AgV1s2QP/TbYUGQ90JZ7hFH3uk1mLCs9z22VqYKy/76sQjnaI5+6NaNQxPwJrsAXUXLT1bmygcYLzbYf/P3Egy99qTY+immgYnfM7y9ssin48d0n6rE3IKp4PCZBIlCBJI0g6gj74AfzGxlQ8CYyor6KBn34kBRdPoxFvfjsVHP8A9AejNMxFQlTZxyn+0TSqqPzk69lPDSeQ1xLqjUxt8PnUFflJj/kBpOtyUxxGSkZN9n2FFrJ1OxVzTBItvqkhV7iO7AnbHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo+zauEWG+FJqJpZXcm9xKRVr1oloIRExHq6SRmPBzM=;
 b=RWZELMy0flSQ61ObmaCnGGWNfRHEG9w1j3Ylx5PTiaEc4A5Wkz6wHOD8o1CF4KvPYbig3FvWvSE4gJI6OXtW9p1YW7aZKlNdAamxlrDJryxV+wBn7Bf1pxx5VwdybQs/mzsF3285OSyC5VisEI+hnKaMiihqvXjQfNSqk6eqzY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7680b667d39747b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVzWtSrc1YIa/81IRctPhGtivlIkGvtUvx33immFWmfkiqKT05rdNbTWsjM3ZepxgJksfqHjOXG7LD62Nn/bukdZxsjq5ABlqMpfYc8KT+YaLPZezIzF/7/YgZZhnRV1oDsZjcH83z77weXb7i8TL10MYDBY7kRf8AMxACekW3GvcIJr/a2FRxYnejcT3VocMOPZUae0HO6EMxGoPIXEzYQ+KuyMNhETryy2c5zZ+hg7Y4381Mtgc3UvCcK/osjW+VsCEDES09s0WUEZH136jy6dXwSH8uU9HZPyTb1F9mhFQqVMH42Z6bxEbpPzipnf6U/b/ZJblhh7DlgDV/8c4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uo+zauEWG+FJqJpZXcm9xKRVr1oloIRExHq6SRmPBzM=;
 b=S3xjqnOl+VlKZu2b5Zuo9pTm4gaX4ca0dzlWoMV8vrGLn1mbD9ZSwdRztKzoB2XTqw4T8aN7CJiEUofRPncE5T9SafP1KM41LmLXlIQejZDm8NCA4ekYMFJ1Kixa2UR1183/w+o8gLwDqf61SeOlbBqfa4XcHV0S84/M5z7GdcqaH8xoSMeb8S/ssnFQD+KvdAEqgN3ZHiAId9qbtTd9A0Mg7xAFzbElFYBz0aPHLUhowZWh825JNlnhO9ILJvh0yRL5ywE6WJz/7Wc8BJfZkiMPJ4DC3BR7LPXrOm/+pB4wMhaSN/UCCDhQMyVKNKP8T/SJUTXg8J342LhJylMqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo+zauEWG+FJqJpZXcm9xKRVr1oloIRExHq6SRmPBzM=;
 b=RWZELMy0flSQ61ObmaCnGGWNfRHEG9w1j3Ylx5PTiaEc4A5Wkz6wHOD8o1CF4KvPYbig3FvWvSE4gJI6OXtW9p1YW7aZKlNdAamxlrDJryxV+wBn7Bf1pxx5VwdybQs/mzsF3285OSyC5VisEI+hnKaMiihqvXjQfNSqk6eqzY8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, David Scott
	<dave@recoil.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [XEN PATCH v2 00/29] Toolstack build system improvement, toward
 non-recursive makefiles
Thread-Topic: [XEN PATCH v2 00/29] Toolstack build system improvement, toward
 non-recursive makefiles
Thread-Index: AQHYKlphduUE0nKqEECOcZhD0sFLT61Stk8AgAFNXYA=
Date: Fri, 17 Jun 2022 09:25:32 +0000
Message-ID: <756B5C19-C6DB-44AE-B98E-9257436E28EE@arm.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <Yqsw5mmC8KHVbtrb@perard.uk.xensource.com>
In-Reply-To: <Yqsw5mmC8KHVbtrb@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9105a9c8-3a99-4149-bd7e-08da504359b1
x-ms-traffictypediagnostic:
	PR3PR08MB5611:EE_|VE1EUR03FT041:EE_|DB6PR0801MB2024:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB20245639B95EFCCA926B9C279DAF9@DB6PR0801MB2024.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eN2JWtCpdDLJlLplinORCX4X6Pn40j4Fz/xDvscxcbx704bEyFrwwhVMP2F9jg/p78Fo3S7WfwCSkbOq4TCtWhaebLd9Oj+d6+aweOnRZtW06ZmRLXk1FR3baQV/DlofNz65o4hJoRHSVdhDmRzfvE6vz2Oi07au9mgFbkx/T4eHxEkJDdZ3Nw+z7EN4oUZY/PuTNdNdPFTsU9Wdwi5Eja8IbQNwXjnCWzWo0QqB7whBoBFsi6lEAvEon4VWBrwfUdW1MalohDyGcYZM8WkUHUcbzpzx6rcX+O9e/kNtR3i5Kh1n/s7M0w7frr7hSDvMJLdX0Qtg0iZ5m0kfBD8mXk65ufiFCxwc+H4aMMiRy7NRBUNF41P3PIEV4Vl2fSBz0QlH4mrnmbuqYhItbF/xm2vtb32v0ZhuJjWMJ7VNRd9AcvRQQXmCzNj272ls0EaaPuUYfpICfmuQkWW7T0wKp+1d+OJAj04KhO6RF/XTRZ+fSymfHvdMP+dx1ID7mJ/VLOZd17DTz+wJkgGS1iiOFRd3Fe7kk6ZAUaxRgi8JXkCwMADR7y9unATZhD9mzmYCLBQvwllvL2waXX5JUPYEBzdgSIWcHd2OuL5h/5gXZk3gEU2V5XizpQwOdtdKTBcSkTlBJzjJrrIEaxhQ4yNdUNB8/Dw2Er+v+cs24rSp1wAFI+AlAgvJ2gjARZ9KLOGoURS/QG4dFVhvId/qMytOBWX9/YaIOmyGPVywCO2osO/Pm757WAbVHrCCrAp23EEz
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(76116006)(53546011)(2906002)(64756008)(6916009)(5660300002)(54906003)(26005)(8676002)(6506007)(186003)(6512007)(2616005)(122000001)(33656002)(66556008)(38100700002)(4326008)(38070700005)(6486002)(7416002)(316002)(8936002)(91956017)(66476007)(498600001)(86362001)(66446008)(66946007)(71200400001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2C72CB236CBC4E449D152A5D98A38736@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5611
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b5adaf1-667b-474a-4d32-08da504353d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NpOcWdPLejR4E1dUI/rxmVLyBibC519OzaoKFjlolY8eLA8oFcjwIqa6qUblxA5TQH2HUOVOzZKzxbMkGNxwoCBAH/SJA2mjaN8RkfqkOabh2U6MrXBWtY6geR/59v6SItXsXGuRO3VmI2wpzkFfEAutIqjbE5PhPpOVKVKzBIRODmcKjlAg+jmUpPE/8l4K8QZYNwV+lUVEOH8HXTpmmZA0EByVOLYEhwdH9lxr/MOYQSEfJtA0nOJoip5qitOW5+c9K+RjX7ksPQmAUsV4uzBW4tXCMGgsLNidEhrGFfXNuqhgeLjOVrZe5+Jmmjlm9LMYk3ShjBIh2WGIxwvMhn7jJxpnwBOiuZhc/YllxnyQGejNs4uYLvAD1DxFoGEwz4EcXgzdy7lWWJAZ5K4/pJoLG5aMhk1YpNjnLB2qPEOwTXcGSVzW9tBXXUbrXYaFbRWn6P5SZcwP7Mjbl/EleWOxmk9+VCz6TgKDwKzeuSnx1zM3W3LRyUT071z8ODDk9EAH2c+L/HQOSV4LoYdF+eYmAxJ1OSl70+M1YDErjD9QfobZeCyJkaVhyo6mZcQYzn72iOuX+MrfkeJU86ZYTeDEessQxS6t1zxIY5m3/FCxLxJijrL1SDHy7BLRm5wmMmefqnwU7TBPbYpas4VJnB1vmlh65afrVZMwo86BwdvYAD1Pq8a+ZaW49TWEPT5d
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(6506007)(8936002)(53546011)(5660300002)(70206006)(4326008)(70586007)(6862004)(8676002)(498600001)(54906003)(86362001)(356005)(316002)(6486002)(81166007)(36860700001)(2616005)(186003)(36756003)(40460700003)(47076005)(336012)(26005)(82310400005)(2906002)(33656002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 09:25:42.3104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9105a9c8-3a99-4149-bd7e-08da504359b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2024

Hi Anthony,

> On 16 Jun 2022, at 14:32, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Hi,
>=20
> There's quite a few patch in this series that are reviewed and could be
> committed. The one reviewed don't depends on the other ones.
>=20
> The list I've gathered that I think are reviewed properly are:
>=20
> 11: tools/xenstore: Cleanup makefile
> 14: libs: rename LDUSELIBS to LDLIBS and use it instead of APPEND_LDFLAGS
> 15: libs: Remove need for *installlocal targets
> 16: libs,tools/include: Clean "clean" targets
> 17: libs: Rename $(SRCS-y) to $(OBJS-y)
> 18: libs/guest: rename ELF_OBJS to LIBELF_OBJS
> 19: libs/guest: rework CFLAGS
> 20: libs/store: use of -iquote instead of -I
> 21: libs/stat: Fix and rework python-bindings build
> 22: libs/stat: Fix and rework perl-binding build
> 24: stubdom: introduce xenlibs.mk
> 25: tools/libs: create Makefile.common to be used by stubdom build system
> 26: tools/xenstore: introduce Makefile.common to be used by stubdom
> 27: stubdom: build xenstore*-stubdom using new Makefile.common
> 28: stubdom: xenlibs linkfarm, ignore non-regular files
> 29: tools/ocaml: fix build dependency target
>=20
> (I didn't a run with them on our gitlab ci, and no build issue.)

If you do not mind resend a v3 with the remaining patches rebase on staging=
,=20
I can spend some time next week to test and review them.

Maybe you can also put in the fixes for the header check.

Cheers
Bertrand


