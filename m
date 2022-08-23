Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9959E491
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 15:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391988.630083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQU6v-0003XD-Kf; Tue, 23 Aug 2022 13:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391988.630083; Tue, 23 Aug 2022 13:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQU6v-0003Tl-HV; Tue, 23 Aug 2022 13:38:29 +0000
Received: by outflank-mailman (input) for mailman id 391988;
 Tue, 23 Aug 2022 13:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxx3=Y3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQU6u-0003Td-Gq
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 13:38:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddc337f7-22e8-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 15:38:27 +0200 (CEST)
Received: from DB6P18901CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::12)
 by DB6PR0802MB2581.eurprd08.prod.outlook.com (2603:10a6:4:a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 13:38:11 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::9a) by DB6P18901CA0002.outlook.office365.com
 (2603:10a6:4:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17 via Frontend
 Transport; Tue, 23 Aug 2022 13:38:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 13:38:11 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 23 Aug 2022 13:38:11 +0000
Received: from ee344b846586.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB26292D-CE20-4F76-A132-C5ED14EA5329.1; 
 Tue, 23 Aug 2022 13:38:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee344b846586.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 13:38:01 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM6PR08MB4550.eurprd08.prod.outlook.com (2603:10a6:20b:71::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 13:37:54 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 13:37:53 +0000
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
X-Inumbo-ID: ddc337f7-22e8-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=g/mYTfwnyG3Myi76WbOAV/O4ewHwS18BxLpmQP9wReuHSaXFHqNQi2bvxWWRsD2DzJiALWOpg8ObnYX14fV0g5W3EwpXLf3V8ebXd4ZwDxiQMDOSR/MoEYchAhauwxlCSsV8orI7x1zYae3QAeVezk3/v4KlpI+jzAAT0+2ykclQEygfrOIT1leClBHsSOVGmxTHhHDIJDbwMAFTY1DScEmM7PEfdUCyirht84V5+h9u5A9Zh4KLQv7sgVjMchjxsccgIB4yqDMkeHBs/TNjwQGAVfM7ATGzvGjYaQoPk+WDtp2CMvlwcO8wdMzhOwV/NYO3uXO/NHHm/gd5cqpvRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6iR3S46dWIUjSMBrPPm3OsX7PDxF1r1RXfppAAM7wI=;
 b=HAawhK/imx6EiKcAg7XIRopRnaVoV7qE/XQShZGA+IWoX8xyG++9/+9TbiLsMI7PKkeJQn2Y1dYMc/e/ayxQUHdH02E9FLEWkFukPC3WFmdi7+4SEBffk9sSIDQcbH5w7ktKpkO4mekPYA63hksM0sxOOFZpuYU3kUvZ9OfHO+gfrYnsK5e4uCHX3jgEmubj+BKavDrkcucNxlEp4UCnBds80eJuiTCzzMjYGTaBatrrwdETX4VlWJVSTcfr5XSEqRrEGEi/nvsR/41EfA59bMOpyL19sITSfPWlWrtFxIJWfR1lxDUCR1cILRXNCy2Hh0om3s2dffj4G45PzTWFUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6iR3S46dWIUjSMBrPPm3OsX7PDxF1r1RXfppAAM7wI=;
 b=dg3UGcdKlXCwlnetbT5uymlsSGaLPgvpWKDToZkF6106j/pZB6hNb9MY5MALHb5sgC/ELoy0rRujzfp+hPmJj8FGgym1LxcudzoAZ1hlHkVGdSBHrekBUPXjR8BN5OK1fRcfG0RQQhfXAtTqBarwMHM8S53ZR8CNsBUy8DcAkM0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92d05b336f12ba28
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa2OagDb4oOsqvcoLjTyCI1rybCwlJWYA2lukZzfvm6AhaVOhbBBZnk5olBNIsTo52Bmc8dFNwV3Gh5YqsFUNYZ9s8hKHqedYN/eH5+JGt/fxIAFZG2JdxBMGN+RyXKbpuSJOUQoXULo6cufEV6BUyt83ejFuKl7/s4+vQPR5EumSQ7RaFJuZFB5+qF+5znUduhbWBtpn4YCdA9L7Q0WIkjwpXHMi79p+qOgQQeFueKA9s8WNeeZM5J4dld94etMfYErDTJTnCfIq1ZE06trPST6lWnPpG8jbZFpQ4FdqsERQa2s90+fwVBSleYconLmBTvuJMie3Y4dywsVc5Jg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6iR3S46dWIUjSMBrPPm3OsX7PDxF1r1RXfppAAM7wI=;
 b=Xc/3AtYyA86VwGipgrUYE7oqqQUiwZpiZ3rc8RdCZHGszvU55+Q4r073Egr7J/luBZPfwSSqdXbyeH9oh0vH5d5UBvz4+EYRuVA2oT2aVSH+4QM+xwDiAvXWuEIKq7B3JQMVlapaTNvAJJ/0QQaC/Tb2B1CSmjNQ76Up2w5O+CfKd77qgLvXmWMPj0hIcuAnBEEo38AbfJhAmrDw1BWOpUK1ut+ZujMaqWhlYi7EDBgtTMGWENSsRI5cMBPQfhqxfDUatyi6bjaEwZoGBgz2Jl4d4v7kgsIQF0shYmZa5ubcL461lEbFdB+XoqvuBnFB49YCaQ0zGtAiszdC9cenIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6iR3S46dWIUjSMBrPPm3OsX7PDxF1r1RXfppAAM7wI=;
 b=dg3UGcdKlXCwlnetbT5uymlsSGaLPgvpWKDToZkF6106j/pZB6hNb9MY5MALHb5sgC/ELoy0rRujzfp+hPmJj8FGgym1LxcudzoAZ1hlHkVGdSBHrekBUPXjR8BN5OK1fRcfG0RQQhfXAtTqBarwMHM8S53ZR8CNsBUy8DcAkM0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/7] xen/evtchn: Make sure all buckets below
 d->valid_evtchns are allocated
Thread-Topic: [PATCH v2 1/7] xen/evtchn: Make sure all buckets below
 d->valid_evtchns are allocated
Thread-Index: AQHYs7Lvc0AvEyJ80UCxAzG31ZD5Bq266TIAgAGaf4A=
Date: Tue, 23 Aug 2022 13:37:53 +0000
Message-ID: <ED867BB4-16AD-45CC-ACBC-B5656AB9DE87@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <710e9e6477270212136d6f2047fd15a033fa7d71.1660902588.git.rahul.singh@arm.com>
 <90ea98d7-58f1-4808-b691-c3a773a0476d@suse.com>
In-Reply-To: <90ea98d7-58f1-4808-b691-c3a773a0476d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8863df61-2d94-4459-013e-08da850cb8e9
x-ms-traffictypediagnostic:
	AM6PR08MB4550:EE_|DBAEUR03FT017:EE_|DB6PR0802MB2581:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 neDtj7dA5M/dEM0h3yiQCO811bEBILKR/k7UGngEV476X4oXW4s+mukxYMxFMlZpAnkv/IvS/p+rnKkCzQnz3jklE04iN0TdLKG2OcJk8LXXfPlGoYgz1Cz/oXf1gOnINOngTwXmFnBcFHAgukI+cuZsTsIjg8RmQncVZvbXjzMiSpQK9lqgRhiW1HMTY+w8/YKsspImxZJkalqPFpFSHdo5A4vuoiZyCTHRPTz95oUuCVUm0aNBpsK4mkArbR9stDX6QPlxW92eaPtOmZR2SRUq90Eur9UQPlqX3j2kkBvwlt0OwnOCTu+Kq3p71m6p/5OW5W6aPWt1CdAtbVQUP/OWz/dEKJ4iymL1dwNixtFoS0e/kiEUOa15LBNHVGmvEsJf4zfTONuKd+LzoaTaTaopzULQS3yMp+nS7TR/qt5hy0kagu6+V8/XLAakU7kn8ecdAigArziLgUvVJzScDw1dPuLrq9Rz0DTNM/mEabzjtsebcgvWSbxBGu4E9VjHUt+KFdmBxYVbMckkcyzLSRkhHqUWF+5etooCLP6qtjIZnu9w+yzp0dE86V9i6BQ8JTyqV5ePfhtvitjgwfFhpV5UJe+fkJMVJDqkz6Jaj1WmDy4y0eaBmMdHpQ1hZUcDDEmk0vHzBqDPOeqZI7w3ZuNRw4LMXWEA7NM25LJE8fm+VUiPptBERo8N2LDRvMcMTrlD419jtGoJjJWPcuetUKdojrBlq2akRrHWHUbIwCSPh9YNo17FbgDrQVFWaNDR4B4FoQoq5HbVZLlJvWYvta+MvtQVdUSGrTXFJOZ7590=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(2906002)(36756003)(4326008)(5660300002)(8676002)(76116006)(66446008)(66556008)(91956017)(64756008)(66476007)(66946007)(316002)(33656002)(6506007)(6916009)(54906003)(41300700001)(71200400001)(53546011)(6486002)(478600001)(26005)(6512007)(38100700002)(38070700005)(186003)(86362001)(2616005)(122000001)(8936002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BE1D21E96AF6347A8391BE0A587743A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4550
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f581ed98-317e-408a-e2f5-08da850cae38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B3xp4I25Bcli6g6K2KX7bJA3h+hskfxVCpl447FSpakgzMEsjorGjAjbHEuBSNeVT7XNV9ZHnBs/w8skZDg37QUhfm6flzubcbEJgntIsbSEHwxMJ1m/Klh9irZLW7rDjXpnawpqOe4BzTsY0ntgouHJgbkzNMIH4UJ04Efgsk44VUd211FelcKMo5Oe1dagRgQkHF5ez9haDbzHPw5j5ziB3D4wqSGBe3QX5nABqQ196A23TJu9BbQvax6CyqD0uwuF4dMfwK12bg2Qnlhp8pPQvbPtiBOvj6MZ+/JU0vDjLQS/YKIQYu79gnjKIQKlcgZ7gSi3oU5KHbLD6yzZcXQCYiDg6DDenIS8kFrlMtSFQfONDuaeVslDdtu0H6hihqc4M+kt3PPP9Gz0T2LTJp+12NgDy/jau8eNscJp41bwhg/NCesfIKE28Aa8OawL9UEcRF6YPb6JiJGUW+SmYTrM2NGTJdNIs1zMyRqFAIzZygGFB9kz4UHSTLGxAw6nYdvRGnPJ+61b+RXrEbdjrWVlA8fP5s4TzPdgbtOvGgvLOCpdZD1bnT0wl8h3Nj61qjw2c8cm+pShkcRM/HWqijxU1jmKLLAUmSlHA3NUct083wJTDDcRWlIJk9b7I5iHRz1urbeBhd4q3TweuSpZ4mxF0JxqYKtHRu5cDJtpaXb3eR2DOQ76CZg1A6g/SVS7pbGLg3G+40MTZ9C9A5S/hyfW+3/8KBVdBJ7CwjW/kqL19JIj+CzGTiPTYM2pS+B6mnMAR7O/8KqCpMQrWmaIig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(40470700004)(36840700001)(6506007)(36756003)(316002)(356005)(36860700001)(81166007)(8936002)(6862004)(54906003)(40480700001)(82310400005)(82740400003)(83380400001)(47076005)(6486002)(478600001)(70586007)(40460700003)(8676002)(4326008)(33656002)(186003)(5660300002)(70206006)(2906002)(53546011)(41300700001)(2616005)(336012)(86362001)(26005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 13:38:11.4726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8863df61-2d94-4459-013e-08da850cb8e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2581

SGkgSmFuLg0KDQo+IE9uIDIyIEF1ZyAyMDIyLCBhdCAyOjA4IHBtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTkuMDguMjAyMiAxMjowMiwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0K
Pj4gDQo+PiBTaW5jZSBjb21taXQgMDEyODBkYzE5Y2YzICJldnRjaG46IHNpbXBsaWZ5IHBvcnRf
aXNfdmFsaWQoKSIsIHRoZSBldmVudA0KPj4gY2hhbm5lbHMgY29kZSBhc3N1bWVzIHRoYXQgYWxs
IHRoZSBidWNrZXRzIGJlbG93IGQtPnZhbGlkX2V2dGNobnMgYXJlDQo+PiBhbHdheXMgYWxsb2Nh
dGVkLg0KPj4gDQo+PiBUaGlzIGFzc3VtcHRpb24gaG9sZCBpbiBtb3N0IG9mIHRoZSBzaXR1YXRp
b24gYmVjYXVzZSBhIGd1ZXN0IGlzIG5vdA0KPj4gYWxsb3dlZCB0byBjaG9zZSB0aGUgcG9ydC4g
SW5zdGVhZCwgaXQgd2lsbCBiZSB0aGUgZmlyc3QgZnJlZSBmcm9tIHBvcnQNCj4+IDAuDQo+PiAN
Cj4+IFdoZW4gdXNpbmcgR3Vlc3QgVHJhbnNwYXJlbnQgTWlncmF0aW9uIGFuZCBMaXZlVXBkYXRl
LCB3ZSB3aWxsIG9ubHkNCj4+IHByZXNlcnZlIHBvcnRzIHRoYXQgYXJlIGN1cnJlbnRseSBpbiB1
c2UuIEFzIGEgZ3Vlc3QgY2FuIG9wZW4vY2xvc2UNCj4+IGV2ZW50IGNoYW5uZWxzLCB0aGlzIG1l
YW5zIHRoZSBwb3J0cyBtYXkgYmUgc3BhcnNlLg0KPj4gDQo+PiBUaGUgZXhpc3RpbmcgaW1wbGVt
ZW50YXRpb24gb2YgZXZ0Y2huX2FsbG9jYXRlX3BvcnQoKSBpcyBub3QgYWJsZSB0bw0KPj4gZGVh
bCB3aXRoIHN1Y2ggc2l0dWF0aW9uIGFuZCB3aWxsIGVuZCB1cCB0byBvdmVycmlkZSBidWNrZXQg
b3IvYW5kIGxlYXZlDQo+PiBzb21lIGJ1Y2tldCB1bmFsbG9jYXRlZC4gVGhlIGxhdHRlciB3aWxs
IHJlc3VsdCB0byBhIGRyb3BsZXQgY3Jhc2ggaWYNCj4+IHRoZSBldmVudCBjaGFubmVsIGJlbG9u
Z3MgdG8gYW4gdW5hbGxvY2F0ZWQgYnVja2V0Lg0KPj4gDQo+PiBUaGlzIGNhbiBiZSBzb2x2ZWQg
YnkgbWFraW5nIHN1cmUgdGhhdCBhbGwgdGhlIGJ1Y2tldHMgYmVsb3cNCj4+IGQtPnZhbGlkX2V2
dGNobnMgYXJlIGFsbG9jYXRlZC4gVGhlcmUgc2hvdWxkIGJlIG5vIGltcGFjdCBmb3IgbW9zdCBv
Zg0KPj4gdGhlIHNpdHVhdGlvbiBidXQgTE0vTFUgYXMgb25seSBvbmUgYnVja2V0IHdvdWxkIGJl
IGFsbG9jYXRlZC4gRm9yDQo+PiBMTS9MVSwgd2UgbWF5IGVuZCB1cCB0byBhbGxvY2F0ZSBtdWx0
aXBsZSBidWNrZXRzIGlmIHBvcnRzIGluIHVzZSBhcmUNCj4+IHNwYXJzZS4NCj4+IA0KPj4gQSBw
b3RlbnRpYWwgYWx0ZXJuYXRpdmUgaXMgdG8gY2hlY2sgdGhhdCB0aGUgYnVja2V0IGlzIHZhbGlk
IGluDQo+PiBpc19wb3J0X3ZhbGlkKCkuIFRoaXMgc2hvdWxkIHN0aWxsIHBvc3NpYmxlIHRvIGRv
IGl0IHdpdGhvdXQgdGFraW5nDQo+PiBwZXItZG9tYWluIGxvY2sgYnV0IHdpbGwgcmVzdWx0IGEg
Y291cGxlIG1vcmUgb2YgbWVtb3J5IGFjY2Vzcy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNp
bmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPiANCj4gV2hpbGUgSSdtIG1vc3RseSBva2F5IHdp
dGggdGhlIGNvZGUsIEkgdGhpbmsgdGhlIGRlc2NyaXB0aW9uIHdhbnRzDQo+IGNoYW5naW5nIC8g
YW1lbmRpbmcgYXMgbG9uZyBhcyB0aGUgZmVhdHVyZXMgdGFsa2VkIGFib3V0IGFib3ZlIGFyZW4n
dA0KPiBhbnl3aGVyZSBuZWFyIHJlYWNoaW5nIHVwc3RyZWFtIChhZmFpY3QpLCB0byBhdCBsZWFz
dCBfYWxzb18gbWVudGlvbg0KPiB0aGUgZ29hbCB5b3UgaGF2ZSB3aXRoIHRoaXMuDQoNCk9rLiBJ
IHdpbGwgcmVtb3ZlIHRoaXMgYW5kIGFkZCB0aGF0IHdlIG5lZWQgdGhpcyBwYXRjaCB0byBzdXBw
b3J0IHN0YXRpYyBldmVudCBjaGFubmVsLg0KU29tZXRoaW5nIGxpa2U6DQrigJwgV2hlbiBzdGF0
aWMgZXZlbnQgY2hhbm5lbCBzdXBwb3J0IHdpbGwgYmUgYWRkZWQgZm9yIGRvbTBsZXNzIGRvbWFp
bnMNCiAgdXNlciBjYW4gcmVxdWVzdCB0byBhbGxvY2F0ZSB0aGUgZXZ0Y2huIHBvcnQgbnVtYmVy
cyB0aGF0IGFyZSBzY2F0dGVyZWQNCiAgaW4gbmF0dXJlLiINCg0KPiANCj4+IENoYW5nZXMgaW4g
djI6DQo+PiAtIG5ldyBwYXRjaCBpbiB0aGlzIHZlcnNpb24gdG8gZml4IHRoZSBzZWN1cml0eSBp
c3N1ZQ0KPiANCj4gSSBndWVzcyB5b3UgbWVhbiAiYXZvaWQiLCBub3QgImZpeCIuDQoNCkFjay4g
DQo+IA0KPj4gQEAgLTIwNywzMCArMjE2LDM1IEBAIGludCBldnRjaG5fYWxsb2NhdGVfcG9ydChz
dHJ1Y3QgZG9tYWluICpkLCBldnRjaG5fcG9ydF90IHBvcnQpDQo+PiAgICAgfQ0KPj4gICAgIGVs
c2UNCj4+ICAgICB7DQo+PiAtICAgICAgICBzdHJ1Y3QgZXZ0Y2huICpjaG47DQo+PiAtICAgICAg
ICBzdHJ1Y3QgZXZ0Y2huICoqZ3JwOw0KPj4gLQ0KPj4gLSAgICAgICAgaWYgKCAhZ3JvdXBfZnJv
bV9wb3J0KGQsIHBvcnQpICkNCj4+ICsgICAgICAgIGRvDQo+PiAgICAgICAgIHsNCj4+IC0gICAg
ICAgICAgICBncnAgPSB4emFsbG9jX2FycmF5KHN0cnVjdCBldnRjaG4gKiwgQlVDS0VUU19QRVJf
R1JPVVApOw0KPj4gLSAgICAgICAgICAgIGlmICggIWdycCApDQo+PiAtICAgICAgICAgICAgICAg
IHJldHVybiAtRU5PTUVNOw0KPj4gLSAgICAgICAgICAgIGdyb3VwX2Zyb21fcG9ydChkLCBwb3J0
KSA9IGdycDsNCj4+IC0gICAgICAgIH0NCj4+ICsgICAgICAgICAgICBzdHJ1Y3QgZXZ0Y2huICpj
aG47DQo+PiArICAgICAgICAgICAgc3RydWN0IGV2dGNobiAqKmdycDsNCj4+ICsgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgYWxsb2NfcG9ydCA9IHJlYWRfYXRvbWljKCZkLT52YWxpZF9ldnRjaG5z
KTsNCj4+IA0KPj4gLSAgICAgICAgY2huID0gYWxsb2NfZXZ0Y2huX2J1Y2tldChkLCBwb3J0KTsN
Cj4+IC0gICAgICAgIGlmICggIWNobiApDQo+PiAtICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07
DQo+PiAtICAgICAgICBidWNrZXRfZnJvbV9wb3J0KGQsIHBvcnQpID0gY2huOw0KPj4gKyAgICAg
ICAgICAgIGlmICggIWdyb3VwX2Zyb21fcG9ydChkLCBhbGxvY19wb3J0KSApDQo+PiArICAgICAg
ICAgICAgew0KPj4gKyAgICAgICAgICAgICAgICBncnAgPSB4emFsbG9jX2FycmF5KHN0cnVjdCBl
dnRjaG4gKiwgQlVDS0VUU19QRVJfR1JPVVApOw0KPj4gKyAgICAgICAgICAgICAgICBpZiAoICFn
cnAgKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+PiArICAgICAg
ICAgICAgICAgIGdyb3VwX2Zyb21fcG9ydChkLCBhbGxvY19wb3J0KSA9IGdycDsNCj4+ICsgICAg
ICAgICAgICB9DQo+PiANCj4+IC0gICAgICAgIC8qDQo+PiAtICAgICAgICAgKiBkLT52YWxpZF9l
dnRjaG5zIGlzIHVzZWQgdG8gY2hlY2sgd2hldGhlciB0aGUgYnVja2V0IGNhbiBiZQ0KPj4gLSAg
ICAgICAgICogYWNjZXNzZWQgd2l0aG91dCB0aGUgcGVyLWRvbWFpbiBsb2NrLiBUaGVyZWZvcmUs
DQo+PiAtICAgICAgICAgKiBkLT52YWxpZF9ldnRjaG5zIHNob3VsZCBiZSBzZWVuICphZnRlciog
dGhlIG5ldyBidWNrZXQgaGFzDQo+PiAtICAgICAgICAgKiBiZWVuIHNldHVwLg0KPj4gLSAgICAg
ICAgICovDQo+PiAtICAgICAgICBzbXBfd21iKCk7DQo+PiAtICAgICAgICB3cml0ZV9hdG9taWMo
JmQtPnZhbGlkX2V2dGNobnMsIGQtPnZhbGlkX2V2dGNobnMgKyBFVlRDSE5TX1BFUl9CVUNLRVQp
Ow0KPj4gKyAgICAgICAgICAgIGNobiA9IGFsbG9jX2V2dGNobl9idWNrZXQoZCwgYWxsb2NfcG9y
dCk7DQo+PiArICAgICAgICAgICAgaWYgKCAhY2huICkNCj4+ICsgICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9NRU07DQo+PiArICAgICAgICAgICAgYnVja2V0X2Zyb21fcG9ydChkLCBhbGxvY19w
b3J0KSA9IGNobjsNCj4+ICsNCj4+ICsgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAgICAgICAq
IGQtPnZhbGlkX2V2dGNobnMgaXMgdXNlZCB0byBjaGVjayB3aGV0aGVyIHRoZSBidWNrZXQgY2Fu
IGJlDQo+PiArICAgICAgICAgICAgICogYWNjZXNzZWQgd2l0aG91dCB0aGUgcGVyLWRvbWFpbiBs
b2NrLiBUaGVyZWZvcmUsDQo+PiArICAgICAgICAgICAgICogZC0+dmFsaWRfZXZ0Y2hucyBzaG91
bGQgYmUgc2VlbiAqYWZ0ZXIqIHRoZSBuZXcgYnVja2V0IGhhcw0KPj4gKyAgICAgICAgICAgICAq
IGJlZW4gc2V0dXAuDQo+PiArICAgICAgICAgICAgICovDQo+PiArICAgICAgICAgICAgc21wX3dt
YigpOw0KPj4gKyAgICAgICAgICAgIHdyaXRlX2F0b21pYygmZC0+dmFsaWRfZXZ0Y2hucywNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgZC0+dmFsaWRfZXZ0Y2hucyArIEVWVENITlNfUEVS
X0JVQ0tFVCk7DQo+PiArICAgICAgICB9IHdoaWxlICggcG9ydCA+PSByZWFkX2F0b21pYygmZC0+
dmFsaWRfZXZ0Y2hucykgKTsNCj4gDQo+IFRoaXMgdXBkYXRpbmcgb2YgZC0+dmFsaWRfZXZ0Y2hu
cyBsb29rcyBhIGxpdHRsZSBpbmNvbnNpc3RlbnQgdG8gbWUsDQo+IHdydCB0aGUgdXNlcyBvZiB7
cmVhZCx3cml0ZX1fYXRvbWljKCkuIFRvIG1ha2Ugb2J2aW91cyB0aGF0IHRoZXJlJ3MNCj4gYW4g
aW1wbGljaXQgZXhwZWN0YXRpb24gdGhhdCBubyAybmQgaW52b2NhdGlvbiBvZiB0aGlzIGZ1bmN0
aW9uDQo+IGNvdWxkIHJhY2UgdGhlIHVwZGF0ZXMsIEknZCByZWNvbW1lbmQgcmVhZGluZyBhbGxv
Y2F0ZV9wb3J0IGFoZWFkDQo+IG9mIHRoZSBsb29wIGFuZCB0aGVuIG5ldmVyIGFnYWluLiBIZXJl
IHlvdSdkIHRoZW4gZG8NCj4gDQo+ICAgICAgICAgICAgc21wX3dtYigpOw0KPiAgICAgICAgICAg
IGFsbG9jYXRlX3BvcnQgKz0gRVZUQ0hOU19QRVJfQlVDS0VUOw0KPiAgICAgICAgICAgIHdyaXRl
X2F0b21pYygmZC0+dmFsaWRfZXZ0Y2hucywgYWxsb2NhdGVfcG9ydCk7DQo+ICAgICAgICB9IHdo
aWxlICggcG9ydCA+PSBhbGxvY2F0ZV9wb3J0ICk7DQo+IA0KPiBhdCB0aGUgc2FtZSB0aW1lIHJl
bmRlcmluZyB0aGUgY29kZSAoaW1vKSBhIGxpdHRsZSBtb3JlIGxlZ2libGUuDQo+IA0KPiBKYW4N
Cg0KQWNrLiBJIHdpbGwgZml4IHRoaXMgYXMgc3VnZ2VzdGVkIGJ5IHlvdSBJIG5leHQgdmVyc2lv
bi4NCg0KUmVnYXJkcywNClJhaHVs

