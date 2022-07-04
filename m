Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3E564CA6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 06:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359732.589057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8DnJ-0002il-V4; Mon, 04 Jul 2022 04:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359732.589057; Mon, 04 Jul 2022 04:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8DnJ-0002fx-RW; Mon, 04 Jul 2022 04:34:45 +0000
Received: by outflank-mailman (input) for mailman id 359732;
 Mon, 04 Jul 2022 04:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0NzC=XJ=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o8DnI-0002fr-HO
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 04:34:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f364dcd-fb52-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 06:34:42 +0200 (CEST)
Received: from DB6PR07CA0119.eurprd07.prod.outlook.com (2603:10a6:6:2c::33) by
 AM9PR08MB7242.eurprd08.prod.outlook.com (2603:10a6:20b:431::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 04:34:39 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::22) by DB6PR07CA0119.outlook.office365.com
 (2603:10a6:6:2c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.8 via Frontend
 Transport; Mon, 4 Jul 2022 04:34:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 04:34:38 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Mon, 04 Jul 2022 04:34:38 +0000
Received: from 61a8d9e72b4d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 814884F4-546A-469A-A58F-3BEBBA6C1230.1; 
 Mon, 04 Jul 2022 04:34:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61a8d9e72b4d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 04:34:32 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PR3PR08MB5770.eurprd08.prod.outlook.com (2603:10a6:102:87::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 04:34:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 04:34:31 +0000
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
X-Inumbo-ID: 9f364dcd-fb52-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=k9zHoBNQcio84mWleki7Ff/S9CrRV96fB8CefvvtFrcbvl7/fumiSfDNg9S7dJ0c9vSrLZp7pUAV8riUYUasxozDUclcetDfr1KezNHk+e/u7POLJlKBtqhmf1DlH+w1W8Ayyj4N1jlnG00lcBmXc7tp582Eg6gFeE+HotVOKJRML0eUwmZV7k7RHEmzS2xB/u0k5s/u5zUupgT2YMCKsQs59ooVrMxyzzSmLdxGjCf5JJba4MLzmQ+S/W6xaOBxuSy+mYbUNdHW+txQLJ2zps6sGqqsuGEvkdx3H3u1wtWvToAJvRPgt+1dvO6L2N4gtXRe+LQ0Asr/dFtscgqrTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5SAIXMR8oTPy/o32JQNbPM2q6ExtaEbHcFkRFG207o=;
 b=H7TP0VNwYFzgDdgARNofnNqQt7RDUnDqmSMm6g5ZN/R00Z0+WEr3eJHwKZ7VLO6DvqmUQ6H0Nsp8zSCW72TmFSl2mTDnW29ZR170vSXc1DBCA64VXOuvXonAHOfMl+8co6nLmLOdAcAPFJHwQNhKNg51OVTD7EUzfuJP8TURRHGMFLI2BBVNYmmRF5yqrIKa5Y3i/tB4TcMU3jgS5wrlQ6MEi2arZwfiThykXOAnZ/XSAJPamtRtEfizkaACcCsgxTcVizKO5+N4Uf+y0b/DnGFjYn23ZdyU2p7BcNub+C9AmTFoamRo3CeUBgsaoUgSg9IF8vLGzoMlKkeF0Y6hdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5SAIXMR8oTPy/o32JQNbPM2q6ExtaEbHcFkRFG207o=;
 b=2l57i/gdo0jci+PD0t2ZfCvp3ojor14y4XCq5GMou76jABtkGyW319vRr1Llsx+7/Fyo4Ykqe+Eh/frp3QHOLA4xzwAB2LyNj1YdtVxP8cW+B300Zli/zMgklL0lxzzyfJt++N6DOry5rS5J9SlghmkmJuul9tDw+zK7vjErmyE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azwJGVLI9LPaZFSCMVDgUVVvMSx2w2XsrPj7GzZdCRwyLbGM5X7Fbb62qIjs4CQ8GE7hslEkMDxvzZO9yfHqecdESBNn8quVREskg7KKxHHqipnFpcF6E1X9TrOEWw0YwMlzJbfyz7GGcDT/byRzC8kJ7fcKe8IM6zP5zG4m5DOPWec1jmOCAQHI4kIFw/UPYKYa2JqdEA0ZfiIlEiGxOJ5KmTy2ywpLWhykecWMOhujWBcCiV1VIb4Mz1H0KWmaCPBinHw4iy0gcIRQn0wG49Qwz0xJNTY3xoRB8GzYzar2J8oWPqQNOOOvIxOamXFFwPK11UPqKGJTg35qxXW1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5SAIXMR8oTPy/o32JQNbPM2q6ExtaEbHcFkRFG207o=;
 b=cykm1/u9Ykipo4OKrJipNd7PKPZzJvXv4012AYy4+gVeKTFOKnZjo9urKj8rtULT5INZz2a3Eb9bbZTy1pK4lbv4OSIoW/tC+GOL6Mi7ZKHsZF+y0BrmIRwDe+1pvN4h/p4wGD6vr4siJF1tL0gNWFHXS/+v5WZdPuczGDsVICbJz5jT/XFvXfJHC7+TbM16U+4RuQlCTcBd9Rt4W+LzzDGcIe5ZHjPwHy5tn9grbD/HNTPPpqiKa+DPyHLMUcJn+8LG9ploa3GGTsZGxv/W5Z2tz6DeZ7uAv3yInBnl0DDiUJ81KfKhxIynh1QnbbBFHSzsuV3BWJL9KAe3QClSlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5SAIXMR8oTPy/o32JQNbPM2q6ExtaEbHcFkRFG207o=;
 b=2l57i/gdo0jci+PD0t2ZfCvp3ojor14y4XCq5GMou76jABtkGyW319vRr1Llsx+7/Fyo4Ykqe+Eh/frp3QHOLA4xzwAB2LyNj1YdtVxP8cW+B300Zli/zMgklL0lxzzyfJt++N6DOry5rS5J9SlghmkmJuul9tDw+zK7vjErmyE=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] Xen: fix EFI stub wchar_t size warning of arm32 building
Thread-Topic: [PATCH] Xen: fix EFI stub wchar_t size warning of arm32 building
Thread-Index: AQHYjTNsIdi3A5iEXkONabS+bAWlKK1pUfqAgAAoDoCABCcJQA==
Date: Mon, 4 Jul 2022 04:34:31 +0000
Message-ID:
 <PAXPR08MB742025D91DFACBED353A6C209EBE9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220701101358.954527-1-wei.chen@arm.com>
 <061c06ae-e45a-b18c-9c86-3387dac60820@suse.com>
 <6e4a4da7-23e9-a976-2fdc-a96244c536fd@xen.org>
In-Reply-To: <6e4a4da7-23e9-a976-2fdc-a96244c536fd@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 72FBC9E2AF0C1D47AE047507FCFA5FAC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a804158b-68c6-4842-5716-08da5d76817d
x-ms-traffictypediagnostic:
	PR3PR08MB5770:EE_|DBAEUR03FT026:EE_|AM9PR08MB7242:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rrRFwHXFdQ6zEY7zUdTdJTJ/n3ocFHM0bXx8e6eNC14YndIX4ctWzW5GoWSC3RKmX53hWFbJ6FAWpbSlGRMapqfbtoc6N0xIXQESYVtkzCb6DZntIwH7aybibjcDUZ+Sv2dQ5/Hs0swkncz3hFTh8G5W6GBUBB1ihZX9OJXAWizrLQcGGYQYLID2vQV3HlyYS3PqZZqLfl93Ux5bNg7hDkT9j+uTkBXf3qtqMd2n+W1729TjdgpvnMsD2+Uis0KnOLnl2HTp6L/XHUMfbrHuOjF3fCL17n7+Z6t5m32Iy9PrsSJIocXlpQrOab1kLesSDIofCWhirwFzbTgn2SlrtR5XQ3uv6rLUOyWqMBeIajZRAHNs+nJoTZ2zqOc7L+xjvMd8BG84f7AoGOhGhO8SwcFnmt88tNmFtcZ6xIhpJYfXjCdOnw1e10DJOxJfWOdmgtTCmHkwbFEOjQmc76dhhZgx0ftRJSdhaZWO9AH/uS0nXGl1JR+IzL88p0z+poMKvWffbCk2ERNSWuv8xw7dyqEqs9xOzd4hV5OVtn5OQJu36RTYU9UVqjEcCXpTg39FU0rFFme4qHJCEqE9EkKKWWKxcKOi6enPlzqQ4Wsz2+G7SNoDMyfxc6DUD4ZQp8tAEz2EjUgKoYE2p2tJHBalp++ildFK/klBuJDpMfyv5TAiD0nmutRTcaERQN7MthNU2OG/8eZCzt9OHsK/SffL0bOz+0vkVHsT3/CySNzyE0y39BsMlPl0950SBTOeinjkEbgHsvoTbnmV3Y36Dlt/1oPeTGgF7Z/89NXUcFiBpZxaHBkFq6DUzT0KsZIc0+fa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(186003)(38070700005)(38100700002)(55016003)(71200400001)(64756008)(4326008)(66476007)(66446008)(316002)(66946007)(76116006)(8676002)(66556008)(110136005)(83380400001)(54906003)(7696005)(9686003)(53546011)(33656002)(6506007)(5660300002)(478600001)(8936002)(52536014)(122000001)(86362001)(26005)(2906002)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5770
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75650954-c153-4436-119a-08da5d767d37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qZnoeN2A32McO57MTgn7DdfrRBxvyyfiiLtshxvFVeJZYy2rIEdxhCUIvw+i7h/NQVRrD8BMIehA/VCBPNoqFAqzhLlT++kA2VU7H1e641Cn0tLeQmLXl7ASwdINP9nBCLp4EoJcDPJH4/b23VbcuLcIVZstZNKLPpRHGcf2N4EcPMd208d+PuECY+sHuIGfO2vnK+0qkWtaV3Os1m60CsCP3qmNrefaR+X9c6HDkq1kQIRNyDR1mIqxQV9OigT3SqBjYE5y8UQIuKqRv/IIH3C4TvlE6PeuUG85dFTmEGxvONSCjgI+0gpViyCP7Mq3/nekyAFINHu+5+wyrc8kb77Rca5j1hmHwIv0PkytHP0ZmhHwMp+MbyCaI4QFsjJar6rlzRdyyGEuzntbtHn4vFIsCRAxSUuhQaGTZwooO8UTvVI/XjHQ4DHY5Cy3jgbRsMiDw1MjRFN5fHD4aK0RxfYJsc0wbj8JVIdK7OuQuAiJPAmNMvSMmli3++9u4o7q1hPkudrzGCXhtDo/KAnVniH+Qr23QgwkyP+bFDmuCi1iQuUMp12QzeBCTdcQAm1eQ/iSG2oiaNUOWx4kzvWaLrK+ZdIL6lZWrfm7Ci9WWLnSeungm1laf8oPjy64Fj2vlCNGq+VOx/b11iS3BtvucsHYW+GezQz8MFJNjyAtY8WaD0KxyVCMLN0JhgTiIWJy2WPtj1EVQ5YwWdMW0s5WtCo0EQdmswRHs6783Hsu5LmsSpYs0DWftV68nXOiOwpOcDoS99sCx/uBMgk/+pIKA4RvUZqVBTMxgW1fY2w1JipgutFOhiuXjvDWKvdw1RA0V6hi863JT7PU7HV+s2RxzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(36840700001)(46966006)(4326008)(8676002)(110136005)(54906003)(70586007)(70206006)(82740400003)(356005)(36860700001)(81166007)(82310400005)(316002)(5660300002)(478600001)(186003)(86362001)(8936002)(52536014)(41300700001)(55016003)(40480700001)(26005)(9686003)(53546011)(336012)(7696005)(33656002)(6506007)(47076005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 04:34:38.6345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a804158b-68c6-4842-5716-08da5d76817d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7242

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQ35pyIMeaXpSAyMDo1OA0K
PiBUbzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIENoZW4gPFdlaS5DaGVu
QGFybS5jb20+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xv
ZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+Ow0KPiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gWGVuOiBmaXggRUZJ
IHN0dWIgd2NoYXJfdCBzaXplIHdhcm5pbmcgb2YgYXJtMzINCj4gYnVpbGRpbmcNCj4gDQo+IA0K
PiANCj4gT24gMDEvMDcvMjAyMiAxMTozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+PiAtLS0NCj4gPj4gICB4
ZW4vYXJjaC9hcm0vZWZpL01ha2VmaWxlIHwgNCArKysrDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Vm
aS9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS9lZmkvTWFrZWZpbGUNCj4gPj4gaW5kZXggZGZmZTcy
ZTU4OS4uYjA2ZmI5NmMxZiAxMDA2NDQNCj4gPj4gLS0tIGEveGVuL2FyY2gvYXJtL2VmaS9NYWtl
ZmlsZQ0KPiA+PiArKysgYi94ZW4vYXJjaC9hcm0vZWZpL01ha2VmaWxlDQo+ID4+IEBAIC0xLDUg
KzEsOSBAQA0KPiA+PiAgIGluY2x1ZGUgJChzcmN0cmVlKS9jb21tb24vZWZpL2VmaS1jb21tb24u
bWsNCj4gPj4NCj4gPj4gK2lmZXEgKCQoQ09ORklHX0FSTV8zMikseSkNCj4gPj4gK0NGTEFHUy15
ICs9IC1mbm8tc2hvcnQtd2NoYXINCj4gPj4gK2VuZGlmDQo+ID4NCj4gPiBTaW1wbHkNCj4gPg0K
PiA+IENGTEFHUy0kKENPTkZJR19BUk1fMzIpICs9IC1mbm8tc2hvcnQtd2NoYXINCj4gPg0KPiA+
ID8gQnV0LCBhcyBzdWdnZXN0ZWQsIHBlcmhhcHMgZnVydGhlcg0KPiA+DQo+ID4gJChvYmopL3N0
dWIubzogQ0ZMQUdTLSQoQ09ORklHX0FSTV8zMikgKz0gLWZuby1zaG9ydC13Y2hhcg0KPiA+DQo+
ID4gdG8gbWFrZSBzdXJlIHdlJ2Qgbm90aWNlIGFueSBvdGhlciB1c2VzIC8gaXNzdWVzIGhlcmUu
IEFmdGVyIGFsbCBpdA0KPiA+IGlzIC0gYXQgbGVhc3QgaW4gdGhlb3J5IC0gcG9zc2libGUgdGhh
dCBBcm0zMiB3b3VsZCBhbHNvIGdhaW4gRUZJDQo+ID4gc3VwcG9ydCwgYW5kIHRoZW4gaXQgd291
bGQgYmUgYSBwcm9ibGVtIGlmIHRoZSBvdGhlciAoInJlYWwiKSBmaWxlcw0KPiA+IHdlcmUgY29t
cGlsZWQgdGhhdCB3YXkgKGFsYmVpdCBJIHRoaW5rIHRoZSBpc3N1ZSB3b3VsZCBiZSBlYXNpbHkN
Cj4gPiBub3RpY2VhYmxlLCBhcyBJIGRvbid0IHRoaW5rIHRoaW5ncyB3b3VsZCBidWlsZCB0aGF0
IHdheSkuDQo+IA0KPiBJbnN0ZWFkIG9mIENPTkZJR19BUk1fMzIsIEkgd291bGQgdXNlIENPTkZJ
R19BUk1fRUZJLiBTbyB0aGlzIHdvdWxkIGFsc28NCj4gd29yayBpZiB3ZSB3YW50IHRvIGRpc2Fi
bGUgRUZJIG9uIGFybTY0IG9yIGVuYWJsZSBvbiBhcm0zMi4NCj4gDQoNCldlIGhhdmUgYWxyZWFk
eSB1c2VkIENPTkZJR19BUk1fRUZJIHRvIGRpc3Rpbmd1aXNoIEVGSSBvYmplY3RzIGFuZA0Kc3R1
YiBvYmplY3RzIGZvciBBcm0sIHNvIG1heWJlIHdlIGp1c3QgbmVlZCB0byBhZGQNCiIkKG9iaikv
c3R1Yi5vOiBDRkxBR1MteSArPSAtZm5vLXNob3J0LXdjaGFyIiB0bzoNCg0KaWZlcSAoJChDT05G
SUdfQVJNX0VGSSkseSkNCi4uDQplbHNlDQouLi4NCiQob2JqKS9zdHViLm86IENGTEFHUy15ICs9
IC1mbm8tc2hvcnQtd2NoYXINCm9iai15ICs9IHN0dWIubw0KZW5kaWYNCg0KVGhhbmtzLA0KV2Vp
IENoZW4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

