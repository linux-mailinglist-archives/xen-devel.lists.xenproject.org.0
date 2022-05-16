Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156DE5280D5
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 11:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329708.552956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqWxg-0004KM-AI; Mon, 16 May 2022 09:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329708.552956; Mon, 16 May 2022 09:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqWxg-0004Gs-6b; Mon, 16 May 2022 09:24:20 +0000
Received: by outflank-mailman (input) for mailman id 329708;
 Mon, 16 May 2022 09:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HoMZ=VY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nqWxe-0004Gm-5H
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 09:24:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3eabf91-d4f9-11ec-b8b8-f95467ff1ed0;
 Mon, 16 May 2022 11:24:15 +0200 (CEST)
Received: from DU2PR04CA0318.eurprd04.prod.outlook.com (2603:10a6:10:2b5::23)
 by DB9PR08MB6908.eurprd08.prod.outlook.com (2603:10a6:10:2a0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 09:24:13 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::ae) by DU2PR04CA0318.outlook.office365.com
 (2603:10a6:10:2b5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Mon, 16 May 2022 09:24:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 09:24:12 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Mon, 16 May 2022 09:24:12 +0000
Received: from a0fbfcca318b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 706B2764-BA99-4C9A-90B9-E084859705E3.1; 
 Mon, 16 May 2022 09:24:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a0fbfcca318b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 May 2022 09:24:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3265.eurprd08.prod.outlook.com (2603:10a6:208:56::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 09:24:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 09:24:02 +0000
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
X-Inumbo-ID: f3eabf91-d4f9-11ec-b8b8-f95467ff1ed0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iQ3rRUPezfVlEiNcnr3THAW9fmgpX+srOmwaN4SY/ZUc11yVGd0BxVo3s0gCxRtQaHLgsloY0xYCEgxfMBOYfKo1tFXN3Tae2Y01AM/yWTrPEefCdktdqPehNcIpGsf70pLjuaI46ZsTpBnid8yzTRbyocgLDpCgMxJPB8/AHpdfagfldYMU3Sz7EeoNPi6j5oIdLXoIwOklSNA1F35LuxEymzdkMNh6tvcHuBNg2SESNZ69cWMpozQY12cW4KhDy4nHfNbNfLZ+qClshGsHhqNkyizezbF+TqeJRoKwhjVAYGCFkta1sHVld78s5thmme6A20op6bWKVSP1vi1q+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVbPCDFxyAP+r+z3b6GliUc8MmqU/UawYx8E3bV3zJ0=;
 b=X6pqZW8Vpeunmcpts1gCsRmlPDeCzkYOQX4CjJ8ELOpipCti9j78Lh2o5Q9MSaUfXSNe20JwI7oC5v0N/pgRP9ETQzLc7R09a/+QSQM/KYUpYWuPiq8yt92CWtZlkGsz76J4ellDjHT1Ias7IlVOiCLvnixfg30W07llnx5VHop5lf7hH5ECprv2ucnGRrTxH4l6zPF1wFbu+f0k3I+WHdGrrhKvHw1ixVNfypjT1XlyifsQje0vxS8R4PTOexjs+JkQNzLvIFd2xZHS/ft826oLpXTpYIwB3Bemf8Jg4Tu6Wvvv3+zHD6JMhKdzSw6oMZWkh44fsStiu8p2hrPI1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVbPCDFxyAP+r+z3b6GliUc8MmqU/UawYx8E3bV3zJ0=;
 b=rlMTzuCXOOxvlzxMxp3xgmgnM5V4fSmqlJvwwdB2wF0gt0TwAP7ZA424ljFqIC7KNYDgNvDIuX0txggsL2Wl7rBJ+9yuVPqOjCkc8ZTrfVNFqcEwJezaVa9u137R5/kPQX9Vva/4wGr9Gk7X+WyBBufTOvSwIsnxJxYQtvw/tUQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22f16e89858802dd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNGMkSRgjljT0lFFqToGVGKaRiMcyLbCKkPhP1lwGV3eIvtnmp8ZBlL90er8eK7CTF6Znherwzl1XuXjbu8ohF2ysAY2X9PO1eht85R3Jc73ewzNuvOgCAoMJRCh+q4KF8AXqke1LHduhtEy0AzXPeN9AskuPn0JoaExe75tpv3PVjYcKFaKvmPzkKcX/Yz253Rz511p0VXvfmdGoU47y3WaVSBpKcpfvPjwptvOJuwVfT6wrNt4Cf+VG7LSBESjkDBO6rvS+eT3klY3TBt+C7AU4+4Q1+g/+tyD8h34Zom4LZwmufRi2XhHKo+P96Bvbh3WnepkgaNp2Mj52YeZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVbPCDFxyAP+r+z3b6GliUc8MmqU/UawYx8E3bV3zJ0=;
 b=Dyhf2TLGd6tziysi0vG86QNpyEUGtDTXZLn4sa846KEqd3ccwOgtd9AGHOUU0kShoS22ts2rHhQzByvNy744mYXHJflOMHXKZGhm1PNMPS97ld+2y1U0HjqKBpyWAKlopsb4kSXxTiU0vLkDYgdGQgUTApca393C1Grh5iC9Nr9Q+hRnOYpXx3P85rdxLH1SJFl37+KPE7FJAafgRMcRU/G6lXyhL21Cjv1M0YNi+sx5+yBcdX/oTTKWAuPLfhtas/kEAIR79dXhLtKO3VeLVTiivNIq+QDEM6Gmg13vBfBB9q/950kFXd03Eh2N9kqIhd+Vbx4t7O+3PtXXCAFQ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVbPCDFxyAP+r+z3b6GliUc8MmqU/UawYx8E3bV3zJ0=;
 b=rlMTzuCXOOxvlzxMxp3xgmgnM5V4fSmqlJvwwdB2wF0gt0TwAP7ZA424ljFqIC7KNYDgNvDIuX0txggsL2Wl7rBJ+9yuVPqOjCkc8ZTrfVNFqcEwJezaVa9u137R5/kPQX9Vva/4wGr9Gk7X+WyBBufTOvSwIsnxJxYQtvw/tUQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
Thread-Topic: [PATCH] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
Thread-Index: AQHYaQFPaa+cmN6NyUGhGvdTzOfzhq0hO1kA
Date: Mon, 16 May 2022 09:24:02 +0000
Message-ID: <2E233152-FF46-42CF-B2CD-62E0BBE793C3@arm.com>
References: <20220516084517.76071-1-julien@xen.org>
In-Reply-To: <20220516084517.76071-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 73a406f6-9958-4a36-f4d8-08da371dd6e1
x-ms-traffictypediagnostic:
	AM0PR08MB3265:EE_|DBAEUR03FT045:EE_|DB9PR08MB6908:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6908FD2BF890714EA271EF509DCF9@DB9PR08MB6908.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 quk/fo7ndgy3WgPKmy1mq0FjU+DoL/uO24L6bLsZ9SKaMFZW4kpYAtXGmTTJdKzeJJJRAUIJoubGd8Ppol1jO+oFknhzvyvRQ9AAsJK3dEf6qX0gEsnCtEndeboazCW6uNTH6OdAAooGcKAXrfZBWZAh0i4EbW5gOmcaO9fUVgh9gYw84aLO4IV57G+vuNMD0NRZFZ6D6liKdpRJgkazW0Y268mx4vGm8zPNUYGztUgMtD9U1yPEygCN/jR2dmpbXRosPAM71oQoUi3iKPjD0SWf5OG91Q+A34h0wtX2u7iIyNfa/Qo2OVg4cY3EV68ZsLmOxuoYk5Qw8iBnf4mxwc8oiNGj1Dw+hNo1GkcAkYSGtmo2xu9uL23l4Mkim/ROxmn4fsFZ3t5BDTl234jiWnnlsRsnqWDkehu6GFehnuiBDuPRFbA/MW4EFF+9Tuja0+K6JbvTGyxRRR3CA2L7IANOs1GEqxiiAjKlCyFhsv7cqdahf/i0N+P+XHD4d1l7R0ZBm/OSckWYPDYoO9tN32L+bDcRQTvA9bt2G+uw463tTNnEkGNKSmx7v1lKmQgVN69idkHfivQmTORLhg/KCD2HIBsCAdlRsjP4iHUPn36TM3RJadKjRWdIGz772rfqkISGbMcznRNnM+N4zCEC/HmPaNPaekVPye+lty5egOMQybjiyUp7uYEsCBDMUQ6wVXeT2mit9DweX6sTQ64ThP7gNp6XgzZvpxC2F/vu7Ic10tbMUrVBI2KFGzrku0DP86tDhgMX73rs3tu8P1tFgoCbOv1RWU0S/1KDvPH/B1bPa0/7Q1Pp6yjEjDjW55Vc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66476007)(122000001)(33656002)(4326008)(38100700002)(38070700005)(64756008)(2906002)(66446008)(86362001)(66946007)(76116006)(5660300002)(8936002)(508600001)(71200400001)(6486002)(91956017)(53546011)(83380400001)(316002)(186003)(36756003)(26005)(6512007)(6506007)(54906003)(2616005)(66556008)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90D17E66D5CB8F4584199E0DDD861D82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3265
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b9ed01a-f71b-4bb6-6e0c-08da371dd118
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0yAB7UWgodgLSiGJk2kipB4T6uBICombjP7FWXNqcE1+hlwGi819+kR/J8T+I0QLXQngsjR2ZdYg8XPgTIiJJDWcL3+6g3SeEu6Hrv4Yc9y/P18wqfmAznaUTQfyLyI2uRAGN1/4Nuv2Lj861R/ZGuX/evb8zWYMZv9xtoGVOmNc3s7xtbUA/sUoPoy3LOaMi2xUsRCga3JZtXYCDpz2RigylMiORaDeg2amYJwSSKICDU10NMNi1yViUijTnmFs4fUMzidC7YcGbW+hsx+uKmvQRfB4AtHLQC9BnkKYFnUQ32rCmLTRyXGnXsl3MbAcF3KsT4fl5fMrlzk6qMC04hsrE8turAqrVM+Eo+ufJglb1u3lSstnUt7ApMZBWtZrVYAxn4GTiH5jGE+uMqD1npz79w2q5Il9EzwC8OoorxQXVa8DhmBqZjJBngCQTC8/j4zbDODqSaeP3JXS91oDZMY7dwFMKyUHLZ4eRgoDriFagMWCkETMzGNlrGk+3noMw5RPor29zB3E7VLZmiKtoLma0LMyJ4qNLUDA7/GyyG29ExKUYUltFOYgFqUXgC938pFGYlUCIRLCoWpLXccDWK3bl4+HDE5Q04Qpud2meCww1R4inRRKKVkcstM5J+N32puO8fmOQj2MInwuzm9gyNoARb8sHBfs2kC0us78Do++pQQSaiu8O1Tn73EYWKGTZhGQ1pEXL0r6rFlCbxY2IOTftz1RvZ5DlCnwiNzwPXXdcMKSlzL7EHsSGGBx6eHT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(6486002)(316002)(70586007)(2906002)(8676002)(8936002)(53546011)(54906003)(86362001)(33656002)(36756003)(5660300002)(26005)(2616005)(107886003)(6512007)(82310400005)(6506007)(356005)(81166007)(83380400001)(336012)(40460700003)(47076005)(186003)(70206006)(6862004)(4326008)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 09:24:12.5058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a406f6-9958-4a36-f4d8-08da371dd6e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6908

Hi Julien,

> On 16 May 2022, at 09:45, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
> alloc/free" extended the checks in the buddy allocator to catch any
> use of the helpers from context with interrupts disabled.
>=20
> Unfortunately, the rule is not followed in the LPI code when allocating
> the pending table:
>=20
> (XEN) Xen call trace:
> (XEN)    [<000000000022a678>] alloc_xenheap_pages+0x178/0x194 (PC)
> (XEN)    [<000000000022a670>] alloc_xenheap_pages+0x170/0x194 (LR)
> (XEN)    [<0000000000237770>] _xmalloc+0x144/0x294
> (XEN)    [<00000000002378d4>] _xzalloc+0x14/0x30
> (XEN)    [<000000000027b4e4>] gicv3_lpi_init_rdist+0x54/0x324
> (XEN)    [<0000000000279898>] arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46
> (XEN)    [<0000000000279bfc>] arch/arm/gic-v3.c#gicv3_secondary_cpu_init+=
0x20/0x50
> (XEN)    [<0000000000277054>] gic_init_secondary_cpu+0x18/0x30
> (XEN)    [<0000000000284518>] start_secondary+0x1a8/0x234
> (XEN)    [<0000010722aa4200>] 0000010722aa4200
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 2:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus(=
) <=3D 1)' failed at common/page_alloc.c:2212
> (XEN) ****************************************
>=20
> For now the patch extending the checks has been reverted, but it would
> be good to re-introduce it (allocation with interrupt is not desirable).
>=20
> The logic is reworked to allocate the pending table when preparing the
> CPU.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> xen/arch/arm/gic-v3-lpi.c | 81 ++++++++++++++++++++++++++++-----------
> 1 file changed, 59 insertions(+), 22 deletions(-)
>=20
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index e1594dd20e4c..77d9d05c35a6 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -18,6 +18,7 @@
>  * along with this program; If not, see <http://www.gnu.org/licenses/>.
>  */
>=20
> +#include <xen/cpu.h>
> #include <xen/lib.h>
> #include <xen/mm.h>
> #include <xen/param.h>
> @@ -234,18 +235,13 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi,=
 int domain_id,
>     write_u64_atomic(&hlpip->data, hlpi.data);
> }
>=20
> -static int gicv3_lpi_allocate_pendtable(uint64_t *reg)
> +static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
> {
> -    uint64_t val;
>     void *pendtable;
>=20
> -    if ( this_cpu(lpi_redist).pending_table )
> +    if ( per_cpu(lpi_redist, cpu).pending_table )
>         return -EBUSY;
>=20
> -    val  =3D GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY=
_SHIFT;
> -    val |=3D GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEAB=
ILITY_SHIFT;
> -    val |=3D GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHI=
FT;
> -
>     /*
>      * The pending table holds one bit per LPI and even covers bits for
>      * interrupt IDs below 8192, so we allocate the full range.
> @@ -265,13 +261,38 @@ static int gicv3_lpi_allocate_pendtable(uint64_t *r=
eg)
>     clean_and_invalidate_dcache_va_range(pendtable,
>                                          lpi_data.max_host_lpi_ids / 8);
>=20
> -    this_cpu(lpi_redist).pending_table =3D pendtable;
> +    per_cpu(lpi_redist, cpu).pending_table =3D pendtable;
>=20
> -    val |=3D GICR_PENDBASER_PTZ;
> +    return 0;
> +}
> +
> +static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
> +{
> +    const void *pendtable =3D this_cpu(lpi_redist).pending_table;
> +    uint64_t val;
> +

Should we add an assert here to check if we are to early in boot ?
That would also implicitly explain that allocation is done during CPU_PREPA=
RE so this should not be called before.

> +    if ( !pendtable )
> +        return -ENOMEM;
>=20
> +    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));

This ASSERT is already done in gicv3_lpi_allocate_pendtable but it makes se=
nse to have it closer to the place where we actually set the register.
Otherwise this assert can never be triggered.
Can you remove the one in the allocation function and also copy the comment=
 that was on top of it here ?

> +
> +    val  =3D GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY=
_SHIFT;
> +    val |=3D GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEAB=
ILITY_SHIFT;
> +    val |=3D GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHI=
FT;
> +    val |=3D GICR_PENDBASER_PTZ;
>     val |=3D virt_to_maddr(pendtable);
>=20
> -    *reg =3D val;
> +    writeq_relaxed(val, rdist_base + GICR_PENDBASER);
> +    val =3D readq_relaxed(rdist_base + GICR_PENDBASER);
> +
> +    /* If the hardware reports non-shareable, drop cacheability as well.=
 */
> +    if ( !(val & GICR_PENDBASER_SHAREABILITY_MASK) )
> +    {
> +        val &=3D ~GICR_PENDBASER_INNER_CACHEABILITY_MASK;
> +        val |=3D GIC_BASER_CACHE_nC << GICR_PENDBASER_INNER_CACHEABILITY=
_SHIFT;
> +
> +        writeq_relaxed(val, rdist_base + GICR_PENDBASER);
> +    }
>=20
>     return 0;
> }
> @@ -340,7 +361,6 @@ static int gicv3_lpi_set_proptable(void __iomem * rdi=
st_base)
> int gicv3_lpi_init_rdist(void __iomem * rdist_base)
> {
>     uint32_t reg;
> -    uint64_t table_reg;
>     int ret;
>=20
>     /* We don't support LPIs without an ITS. */
> @@ -352,24 +372,33 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)
>     if ( reg & GICR_CTLR_ENABLE_LPIS )
>         return -EBUSY;
>=20
> -    ret =3D gicv3_lpi_allocate_pendtable(&table_reg);
> +    ret =3D gicv3_lpi_set_pendtable(rdist_base);
>     if ( ret )
>         return ret;
> -    writeq_relaxed(table_reg, rdist_base + GICR_PENDBASER);
> -    table_reg =3D readq_relaxed(rdist_base + GICR_PENDBASER);
>=20
> -    /* If the hardware reports non-shareable, drop cacheability as well.=
 */
> -    if ( !(table_reg & GICR_PENDBASER_SHAREABILITY_MASK) )
> -    {
> -        table_reg &=3D ~GICR_PENDBASER_INNER_CACHEABILITY_MASK;
> -        table_reg |=3D GIC_BASER_CACHE_nC << GICR_PENDBASER_INNER_CACHEA=
BILITY_SHIFT;
> +    return gicv3_lpi_set_proptable(rdist_base);
> +}
> +
> +static int cpu_callback(struct notifier_block *nfb, unsigned long action=
,
> +                        void *hcpu)
> +{
> +    unsigned long cpu =3D (unsigned long)hcpu;
> +    int rc =3D 0;
>=20
> -        writeq_relaxed(table_reg, rdist_base + GICR_PENDBASER);
> +    switch ( action )
> +    {
> +    case CPU_UP_PREPARE:
> +        rc =3D gicv3_lpi_allocate_pendtable(cpu);
> +        break;
>     }
>=20
> -    return gicv3_lpi_set_proptable(rdist_base);
> +    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
> }
>=20
> +static struct notifier_block cpu_nfb =3D {
> +    .notifier_call =3D cpu_callback,
> +};
> +
> static unsigned int max_lpi_bits =3D 20;
> integer_param("max_lpi_bits", max_lpi_bits);
>=20
> @@ -381,6 +410,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
> int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
> {
>     unsigned int nr_lpi_ptrs;
> +    int rc;
>=20
>     /* We rely on the data structure being atomically accessible. */
>     BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
> @@ -413,7 +443,14 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_b=
its)
>=20
>     printk("GICv3: using at most %lu LPIs on the host.\n", MAX_NR_HOST_LP=
IS);
>=20
> -    return 0;
> +    /* Register the CPU notifier and allocate memory for the boot CPU */
> +    register_cpu_notifier(&cpu_nfb);
> +    rc =3D gicv3_lpi_allocate_pendtable(smp_processor_id());
> +    if ( rc )
> +        printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n"=
,
> +               smp_processor_id());

On secondary cores nothing equivalent will be printed and in the cal path t=
here
will be nothing printed at all which could make debugging complex.
Can you move this print into gicv3_lpi_allocate_pendtable ?


> +
> +    return rc;
> }
>=20
> static int find_unused_host_lpi(uint32_t start, uint32_t *index)
> --=20
> 2.32.0
>=20

Cheers
Bertrand


