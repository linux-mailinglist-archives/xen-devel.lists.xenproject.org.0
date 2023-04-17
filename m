Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71F6E4194
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521797.810678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJa0-0006Iv-NJ; Mon, 17 Apr 2023 07:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521797.810678; Mon, 17 Apr 2023 07:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJa0-0006Fm-Jy; Mon, 17 Apr 2023 07:47:16 +0000
Received: by outflank-mailman (input) for mailman id 521797;
 Mon, 17 Apr 2023 07:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RDw=AI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1poJZy-0006FN-Ug
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:47:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10e2b9c8-dcf4-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 09:47:13 +0200 (CEST)
Received: from DB3PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:8:1::28) by
 PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Mon, 17 Apr 2023 07:46:36 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::7b) by DB3PR06CA0015.outlook.office365.com
 (2603:10a6:8:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 07:46:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.17 via Frontend Transport; Mon, 17 Apr 2023 07:46:36 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Mon, 17 Apr 2023 07:46:36 +0000
Received: from 5900bcb80821.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B35F3962-BA04-4C96-9487-C730389847F2.1; 
 Mon, 17 Apr 2023 07:46:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5900bcb80821.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Apr 2023 07:46:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8883.eurprd08.prod.outlook.com (2603:10a6:10:47e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 07:46:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 07:46:21 +0000
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
X-Inumbo-ID: 10e2b9c8-dcf4-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cItfq53Pg6byDbdG9uVNgWkA18BfqckFsGFCdIja904=;
 b=wzVxHoY3IyBK9duTwaCKjPjuc2lcb+BjK2wUWgobl3bG2a3WhrJItqx3RtkkgkAI3VnXwqyAkmaI3o28D9kg/Ilbbz2YbtAGvE/DlnZgrTnyzzD9A2Dx7SrZ5pW0HwHGWhOWFv4pNTmHCWM5upzbfTtEfaftzPGXZ9LkwaKJfko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1b10918e9a6aa59
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4GQrCpYpWN5Y8+leMhdtNcSfTJ2AzIVrkWMrF1tUn//7ZGnK9qfDjjNM6iVnvZw9Oi/MQaNRGf+3pUeWjmt4pGPEfXE6uDK7SeG4cdxmn2QwbJd+u0QhInQZSiqzHv0PNUwL2EByzr+sUUrj6jFWGobsheGV98IOl+moktMAs4Tf5fYAEJ8Q0W4ZSdZwTZgvmJwN4VuYL3SnaeFfjjvycPfXfU2TkojJVWu/pLT9JFgzBNYtyAxLL041a/VUxc1wXBYhysB+L13Dp3T/eiQZAvfwh14JditAH3qRWQIBa+umdAHloMfjwM5NvX4SO8bBAq4FuIsTQha2rPOsttCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cItfq53Pg6byDbdG9uVNgWkA18BfqckFsGFCdIja904=;
 b=MjU6dRcHMMuX7FimzFoliZL2rTdY9mXQRDDNLCHENzR7qQbnnFRhLxKBW6Om9K4TUB+sqF1+tKG/qWtv73hfMwChXOu8pQVTe3D202n8v87UcKKmCU8c1EoLRW/Uoa9sGgBRXuCYR2k7R2d4wgxmk9b2JEIYzHymVMRLr+0mdSkqqxJZgZijGqx2BxWCoUXaKBuHVQ13WiwBFRkEBloUYBXO5Oy9L8/f/tBDrXKfrnGDKeUkzikkh/fwrIRqDMdNoLdN/X+Xi9VjuI39tZ65UxKKPsUCMdfU0SlfPaDW/M0FzwcLUfTZbRCo6ZE5aLfF9ziZBxITezuPZ5T9S4CWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cItfq53Pg6byDbdG9uVNgWkA18BfqckFsGFCdIja904=;
 b=wzVxHoY3IyBK9duTwaCKjPjuc2lcb+BjK2wUWgobl3bG2a3WhrJItqx3RtkkgkAI3VnXwqyAkmaI3o28D9kg/Ilbbz2YbtAGvE/DlnZgrTnyzzD9A2Dx7SrZ5pW0HwHGWhOWFv4pNTmHCWM5upzbfTtEfaftzPGXZ9LkwaKJfko=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH v7 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHZcHBP636VZKQlJkWnTIQrYG+QeK8vIIIA
Date: Mon, 17 Apr 2023 07:46:21 +0000
Message-ID: <72C49710-B8D2-444F-A547-4D574D70E2B0@arm.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-4-julien@xen.org>
In-Reply-To: <20230416143211.72227-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8883:EE_|DBAEUR03FT017:EE_|PA4PR08MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 44667e34-dc54-4fcf-b954-08db3f17df1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Kq9v7FNnaTQfr8nea7Yeig29Deo9bE3iRD5wCnCL8HcW0ggpFQaZav7Y1t82Splqzl/gNE1cHZl71m0hi05ezgcu9ofEM6M1Nb/JOj89v//Nve1KMWD6yPXnLtZ0/QqItpOSqZllXSavdNhJOhKcs1UhnARLP1PDKCVsDCABQaUUZJEu4Wgvjb71gCuXl5QYOaABLIwpUfE/Y8oU6swJ8kBDxgLUIrW+kjVK/t790NVZqMqLDNk6QwKzBZoYEAMTOuWd0dkKteA63RQs+mjeJkM6DhdRD82n7vljCK/RI5tbR2hbg1+x5pksIR/WaEELdLRQBfTM68Y7GD72Llo+2ymay/L0Oqv20Zws8L/9PtwAvPeGZPBh3PWZybq1aR2HeHZl2443xuKOAppvrUMvGd/w0V7JbpdJhLs/Chyct/aZFk8xl6mofAvmurcjlSzjDhZepn25nMd7qPJdGki8muuO9wbUlJACH912QH16FGlhz5M/IICZWAxDGb5pb/qmAq3sj19YztMlihbbx9jhx65Cm52tdh8cJO59Gu4Zk5/cBDv5oLcblcmKnVWNUoNtfu5OKXJ5Oo+/zeLXzbOK1h9Zkeo3RgORcThJUA9S2Zsot9biuAQ2acKEEehuBA0F4cMGxpf0yR/3kQW3HDjTiQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(2906002)(4744005)(8676002)(76116006)(33656002)(8936002)(5660300002)(478600001)(91956017)(41300700001)(316002)(64756008)(66946007)(66556008)(83380400001)(66476007)(36756003)(66446008)(54906003)(4326008)(71200400001)(86362001)(38070700005)(38100700002)(6506007)(122000001)(53546011)(26005)(6512007)(6486002)(2616005)(186003)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0434824A92B8C04E9068805BE43C8FDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8883
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d87341d-cefe-4994-2732-08db3f17d633
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+6bDdcLvhzvT+3XcQRh+SyHgO4xKKsYt0N5K2jECvgHupPNDnpen2uUyZOmJcpPEkcTNU+7uTv5cHIUrPl8OUPSMR3L1UpMv7RH/ZVuMDEbYN5A7dzXXZSmrBamkoBxoHiGyvLjGHyGsHu3q2yKqfzv5Pw0XcRIpv+9riABRnpgydmWa/6QNeeME1RAB1HCY58dcPxwpT+k+G1z3m4hsFzQZFDvhUSeyH5XKXYPi2d0+RsA8hhKF0WE4ib4yB9bS4nYNbBZvm+ZcXCkTqMJmWK9lan/Bu2vj7/W5piidpxzzI+n9JYyVA0t3rQ/rPTCvqG72WxZFONKUxVl29jsqM4UYocn+FdKjgDDWIr831Qpb8LPmLdFu93aqACz0/vONlUme8Il3h5YlExb/Rq5pWDDjpB1GXScUq60Q7VX/S1h3cRcvJ5Szj1bTwsfwjTODvfvB5My7VvU3HsUYwGLrryo2KBNXqN96I2pjpDvm99gWmGgiGan1uQUldLLUgwc038dYGnnIz3cr25/IOZfXA/xvTrYwaXWB+qc0AqtTfSKPOKjlyxMHxqrVkh2EhYGL9os9XAlVTq3+UKh5I6ibMSu5RtBLSsFs0+qIdMXKczVa8awMhrB7KI8YXDiISy8sWu1anl9oUTx5CesRdqAqeGVxmWu6hhsGIfDhGxCpQPwoeuXjO9YM4tsHxTprTe9PP2LXcKuk19MBjnkEl5NXwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(336012)(6486002)(86362001)(478600001)(36860700001)(2616005)(47076005)(36756003)(83380400001)(26005)(33656002)(40480700001)(107886003)(6506007)(186003)(53546011)(6512007)(40460700003)(82740400003)(82310400005)(356005)(70206006)(70586007)(81166007)(4744005)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(6862004)(41300700001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 07:46:36.2769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44667e34-dc54-4fcf-b954-08db3f17df1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207



> On 16 Apr 2023, at 15:32, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
>=20
> On some platform, the identity mapping may have to start at 0. If we alwa=
ys
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
>=20
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
>=20
> Two new external helpers are introduced:
>    - arch_setup_page_tables() will setup the page-tables so it is
>      easy to create the mapping afterwards.
>    - update_identity_mapping() will create/remove the identity mapping
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20

Hi Julien,

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


