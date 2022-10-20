Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC096063D9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 17:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426897.675666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXAo-0006PW-7W; Thu, 20 Oct 2022 15:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426897.675666; Thu, 20 Oct 2022 15:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXAo-0006Mk-3l; Thu, 20 Oct 2022 15:09:30 +0000
Received: by outflank-mailman (input) for mailman id 426897;
 Thu, 20 Oct 2022 15:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZuZ=2V=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1olXAn-0006J7-3H
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 15:09:29 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3034eb04-5089-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 17:09:27 +0200 (CEST)
Received: from AS9PR06CA0604.eurprd06.prod.outlook.com (2603:10a6:20b:46e::6)
 by AS8PR08MB9479.eurprd08.prod.outlook.com (2603:10a6:20b:5ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 15:09:25 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::8c) by AS9PR06CA0604.outlook.office365.com
 (2603:10a6:20b:46e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 15:09:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Thu, 20 Oct 2022 15:09:24 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Thu, 20 Oct 2022 15:09:24 +0000
Received: from f4f12de16f39.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B48A1BCB-B5A4-41ED-9866-D68930C29D11.1; 
 Thu, 20 Oct 2022 15:09:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4f12de16f39.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 15:09:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7476.eurprd08.prod.outlook.com (2603:10a6:20b:4dc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 20 Oct
 2022 15:09:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 15:09:11 +0000
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
X-Inumbo-ID: 3034eb04-5089-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Kw9htgoVFgnX2rd9KWH0lloCwlvF45bHh5xC9nP1z8YJHoZyhUcShTZc3MlkCPqzY4k9+Jc/+A6G7tIgEqTHyvBBfquBALOZ5f5GFWkku+DCbCS7a6NFkcmDN7CSCu5bNgGXU22wPPL9qYdAxEjsX0f5OGgW3sux1/118Jf63jk8NJq5cquuM3a38RvKeTS3qleGKdHCmjgV5Fq2xOcyWHaP9czCh0pPgfH2zyJKEzLjhFcjFPl95B3KXvjyXsedAGhmNYqSneyBz9t71GwNjBIhvoMTqsnQnSj9XoVAxKEpC/f0Zq8uFeUUnFuv/5yj5FrwJ8yipSkPhDiwq/iO0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P0q27pz/FUCbiWfSIqDDlKVjjKuwMR5EdZlip6iRNg=;
 b=ZqWmuSbG6l7MLWlU7Q3yq6CimxiHbXyS3I7yn55mPZQ5FGFcLwP19KTyCPSOlUnQywzgxkSsoNMUYf2jpv5iK56VAV2dlZfqvhNqQWlRl4IdGlyM1Q5usQ8tzN0h6NTe74Si/p/lE3TXgYaAJGjCettdlWfqr6lt0scWPCzeHCrXjF6T5lojCwvypCLNFLGK4DYW34be/rpzzMThUs8UZ3lh3B8NrVnMVgbZGbWM5Ei45pxxd9sjW7vDjzi1u2jvzc7jp+iHwBMnL5Z6X3JGO4aLtFfsrD0JoUNcM9axOZzEy0r4U1spvmzBXQ0gADXW4t3FZ9bocH1FCXKs3oBQ8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P0q27pz/FUCbiWfSIqDDlKVjjKuwMR5EdZlip6iRNg=;
 b=FUyARf4fNvOWbP3sAf75N8q3UBSP13moOvFHLCxE3VGnmM5kE8gwVB0I4x5okoHxJkEzcp+yfkIf1QZZ3+pBL+su7JYEJ0Bcdno9LlE3U6SQWKt5pEpYoQdy31yjqA5LYe5tv3LPlW7dyDTw4Tj/hC+znZ4BTOXIC73oSRCs0xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfF24NVO24XLJaLsuBjgG/vvXDYdonirzSBNlMnBY3Yu7QzRfpb04kpg7tih/DbwiKlCeToQWhsKiFOQsNveSYHg5xjO361k4K7X2tdas5hrOER+GDTQNrNbq8Ncfw7LVRPI2fCXm3VandcQrQI4VbZL79HZXOPFwhA7nZn/hYR+3EDKMpaJUcqcuSUtKqLpsfjoA7T+3U3BOWOELE0hsTgCsHyCUkZyOBY9wszlH8O8kxiGCVxgvMTTyFAhVZ0HKiSIucfFudsNorJOAyXrs0O1qpiL9V/WVczn6lerowjrw/WMdgvCj58YgJGbmsAwN+TXTAjs4L/U3gWfgN1vTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P0q27pz/FUCbiWfSIqDDlKVjjKuwMR5EdZlip6iRNg=;
 b=g8v2kjLbjnqBUDTdWf2MO02lsOVb8HlyUPSvEcSo8HYdTXLd7tL6zwdpBvZ27Lyq2C2lSGw9zbmFMcpytPyO9ROr21CSS9lTsho5hzBjgWW4UctNh3q4/4lcW9Tk+gdGDxUWXU24smA9KArcFlI1p1WFYivMM6+MuzeF4Z+h1Jugj8uQ8MCk41q4St/bUA43hy5vkAfdwBXjYRZVg2TiYGFgBoLYThKPRJTblNTfx558wL4PUNXn2GoYLatMPU9xFmjieLLWlUNJjuJFpsAEV9OdM+KQ5h6UGAMbVwQRiPiQLnZVYf3/o+k5N4QaVdXO1bwbAbIvnfOby/61u6lgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P0q27pz/FUCbiWfSIqDDlKVjjKuwMR5EdZlip6iRNg=;
 b=FUyARf4fNvOWbP3sAf75N8q3UBSP13moOvFHLCxE3VGnmM5kE8gwVB0I4x5okoHxJkEzcp+yfkIf1QZZ3+pBL+su7JYEJ0Bcdno9LlE3U6SQWKt5pEpYoQdy31yjqA5LYe5tv3LPlW7dyDTw4Tj/hC+znZ4BTOXIC73oSRCs0xg=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Peter Hoyes <Peter.Hoyes@arm.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Diego Sueiro <Diego.Sueiro@arm.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH] tools/xendomains: Restrict domid pattern in LIST_GREP
Thread-Topic: [PATCH] tools/xendomains: Restrict domid pattern in LIST_GREP
Thread-Index: AQHY1zZYWIYAed9yGUubROrgwcpFPK4T5LaAgAOX3QCAAACvYA==
Date: Thu, 20 Oct 2022 15:09:11 +0000
Message-ID:
 <AS8PR08MB7991D566516CA047BC9F923B922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221003144216.2297632-1-peter.hoyes@arm.com>
 <E63CD72F-9C98-4EB2-840C-56C46BFD7BA1@arm.com>
 <Y1Fj6J/iWYJ4fx8J@perard.uk.xensource.com>
In-Reply-To: <Y1Fj6J/iWYJ4fx8J@perard.uk.xensource.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9A5B33AA465D90438F844B33F75DCF77.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7476:EE_|AM7EUR03FT015:EE_|AS8PR08MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dab360d-1092-420a-4dad-08dab2ad133d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J5IS9+20cArpQ1ccTazzmof93SfHDAy9M/FEwj2ZnnktEZXILSi3E0qrUZneLl/ltcOTpHgmRs2a8vwLTBThoYwhE1YaMfkZdBBC24qWQR6xEIBvS3LqFPELuUWYZNp50hvzQ8Vc+EkKt5cfWxOZcgQyZpTyL3oDO8Mq/f457UdVYVaGQnLfWuly1n9PMXuzsftVE+nbjPxagWy0EGaAHSuHpLba11s9D2bMXCcAbE2GpYMG54XGxQAEq0Va9Bcvm3fmbxdIeY1NyyYYk8L6NP38+bt+B3oJv74HUSVmPXxS/OXDDhrmF6f3C4dCwqRFeCCgbdCVHt11Jj7Da4qK8K7rWLm5Z58aFrPElrU2QKyQjJjU8SFSiGFsIrFAfY/d6o3V3ZeGeb54L4v1A+4aLzBsuoJO5tDI3bWRJAVOyRwz036yHLcVBFzyJ6/UItzNc8umZUStc0zQoKDcVS3pPDXDFZdJkn6c9mJjYPmVtGM8fSafyNODYdOLp4K/+WVFOhE6Jw+QHiXEsy4cX6Rn0mWPtbLgjz0CjuYqZjrM2mfG8DksAHVYBi8trEDoGn4LJn4Vg0VitDfoKbLb/0C++FoFUbxv289CGrAGayxJ1r3zHOdx9ex/U+w7VWAumGKInoL24tGP9KEKwWFc9THyo8inTkU/CVyX4tBkRp+2QMgav8yzZNSjuVCVHhQMVMrcKJpVKNf299Eh/yykuIog9Lbdgc77LfjxqtK/wwDsMBtReIV3jTR/e+8xz5DRHJrgACL0DfXNGVbHTSns4M5/7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(7696005)(6506007)(186003)(53546011)(9686003)(41300700001)(26005)(2906002)(83380400001)(5660300002)(55016003)(110136005)(8676002)(66446008)(66556008)(8936002)(54906003)(64756008)(4326008)(66476007)(66946007)(316002)(6636002)(71200400001)(76116006)(478600001)(52536014)(86362001)(33656002)(38100700002)(38070700005)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7476
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09fd2d8d-ba4c-4106-080c-08dab2ad0b22
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m1mlZFzcrU8j5HyUl4NJ714XKyYxNNQkAg5zNYYlmU3Ee3Bp4vGZYTc8k1uubETV2Z6E2AtdlFNvOLTlT28yrWA0hiTdP605V2q+AuDTu3+CZbTMUO9kUT9f7gshBtahsX+V8s7JcuwW6gLeFoHO6RFk4jL0QoXej6M0xmGsYXxqrbklFy3NFLlLcAYQ54x4X3plZLXLUNSQH7Og4xsSqnaGCcW1SCbaY+rLF1SbN0QhCfViM4aA7HZqfO0kPxxUd/eA1qtYriHON+827OTrKyoaJ3s0PTgqJM9YeOdUD+ozErDnVHwvYr8V1rnkeGVzc9mLC9d8A+jeHH25lZBla9cbk8AOLJ8/f220yRJ2NL3ao+z7YY+w1+cxnKfJXa0Vf3uCjKZO5a0IDHuLqbGI5n+xW+OVqEEawrYFPOXCKUT6I7t92k0snu4rgZrC2vTln4SaA28eu77Q6fQtrY81KupbVBq26IoUxvubsxSRGQlc2VO8Dmh5FNW9WU/t4hkpbJowyg+bffZm/nN3KFMBJSLx24KNlu2rvkGDYayHHiMA0zxIICjbD7aDDce7nrhzh0iy4fzmcJw4DJZhsiZPo81zbrTrcEziYKueEwdrjf77+da+6vyn5MplbD9Jf+ZbzYayTODn5daNskgcw6CWII4e+torpyffFR4kaMeJ8Gg20YoFhHhO7b1dKH8ob6kRGccAX6qcK547tEjNxgTHFGl0mwmrKBxP1I1H9mRynSj8HEnjvFX6VaN6a4dEHGOQyrMfF4SXO9eqUl5PlTW1YA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(82740400003)(356005)(47076005)(52536014)(81166007)(86362001)(5660300002)(8676002)(8936002)(41300700001)(7696005)(70586007)(70206006)(53546011)(40460700003)(4326008)(316002)(26005)(55016003)(40480700001)(336012)(110136005)(2906002)(6636002)(82310400005)(54906003)(6506007)(33656002)(186003)(36860700001)(9686003)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 15:09:24.7592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dab360d-1092-420a-4dad-08dab2ad133d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9479

Hi,

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Subject: Re: [PATCH] tools/xendomains: Restrict domid pattern in LIST_GRE=
P
>=20
> On Tue, Oct 18, 2022 at 08:13:57AM +0000, Bertrand Marquis wrote:
> > Hi,
> >
> > Gentil ping on this one as it might be a suitable one for 4.17
>=20
> Yeah, that might be a good bug fix to have.

Agreed.

>=20
> > > On 3 Oct 2022, at 15:42, Peter Hoyes <Peter.Hoyes@arm.com> wrote:
> > > From: Peter Hoyes <Peter.Hoyes@arm.com>
> > >
> > > The xendomains script uses the output of `xl list -l` to collect the
> > > id and name of each domain, which is used in the shutdown logic,
> amongst
> > > other purposes.
> > >
> > > The linked commit added a "domid" field to libxl_domain_create_info.
> > > This causes the output of `xl list -l` to contain two "domid"s per
> > > domain, which may not be equal. This in turn causes `xendomains stop`
> to
> > > issue two shutdown commands per domain, one of which is to a
> duplicate
> > > and/or invalid domid.
> > >
> > > To work around this, make the LIST_GREP pattern more restrictive for
> > > domid, so it only detects the domid at the top level and not the domi=
d
> > > inside c_info.
> > >
> > > Fixes: 4a3a25678d92 ("libxl: allow creation of domains with a specifi=
ed
> > > or random domid")
> > > Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
>=20
> Parsing json with bash, grep and sed, what could go wrong :-). Anyway,
> patch looks fine:
>=20
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> Thanks,
>=20
> --
> Anthony PERARD

