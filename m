Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F5E570F80
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 03:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365420.595572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB4k3-000056-FS; Tue, 12 Jul 2022 01:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365420.595572; Tue, 12 Jul 2022 01:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB4k3-0008VR-BM; Tue, 12 Jul 2022 01:31:11 +0000
Received: by outflank-mailman (input) for mailman id 365420;
 Tue, 12 Jul 2022 01:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RdAP=XR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oB4k1-0008VL-Ew
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 01:31:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48be38bd-0182-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 03:31:02 +0200 (CEST)
Received: from AS8PR04CA0177.eurprd04.prod.outlook.com (2603:10a6:20b:331::32)
 by AM0PR08MB3953.eurprd08.prod.outlook.com (2603:10a6:208:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 01:30:57 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::a3) by AS8PR04CA0177.outlook.office365.com
 (2603:10a6:20b:331::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Tue, 12 Jul 2022 01:30:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 01:30:56 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Tue, 12 Jul 2022 01:30:56 +0000
Received: from bac5efc7466e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02FCC95A-28A5-44B5-A2B7-090401E43518.1; 
 Tue, 12 Jul 2022 01:30:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bac5efc7466e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jul 2022 01:30:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB6PR08MB2840.eurprd08.prod.outlook.com (2603:10a6:6:1d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 01:30:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 01:30:48 +0000
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
X-Inumbo-ID: 48be38bd-0182-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eZaP8kAM6XmXHjF4xuIEczFHCGVLBKWsk63tlHAjx18EhbKM5wtEKfM01fK+zsrlnQM/oP2yxkbwQPQf5lmjhEVYgWw6VUyc0GUb0GLh6ZsRHLekwazLmsI9KadAUbvwp/LawyDTI5wU2QBzagAAE+elyMd9mPY0D85XA9tIhGTzVuNetwnqLWyJ1O30Hntxhh5gJ5Fj8HrnU5knwDrVDsGEcSeYepfQkk1EJmxg7Ziez9TQoe1sO+TOMpXWnScMe8bpme5V/TpobIdb0ZIF/8XRNWMl5zbVOZN1V3VvBPcxeZmn8lnKMLySNO6cHSsUdZwmqE55p/d6BfZgKHrD3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZm4P0pKM5l8ZCssCdLz88CROqVho728ZmqjUw+NHf8=;
 b=L8ZsvcTQ1NmOBunSqJzYhFpUI82FMZtR/eBIv9Qg/NJ8aVt6IXbIslpv8J8LDl8ulPnyrWITRPCO31sg0zg8eoaLbnSJ2rjOHj2YupTRhYajLOZVSP7BXEllDxmrKK9e82AcyVRqioD1B6xM0Iq/U1uVVtoW5yY3Q212Ma+ErBTHPQkS2smnZ8JXmhs8PYy3VKgr0VTtRx3m7TbudgMPe1AsDn7SktViWSfzNh+5rAAPdZO/eb354CkTsaz6eevQ2w2GXvsE488/QOEyTsyy2VOwVJcUnEsmwtAxBWhbnOHUTB1LyF+1XAJHDhHVmMgQ/Mi5aoOQwWXWC2w7vtI7oA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZm4P0pKM5l8ZCssCdLz88CROqVho728ZmqjUw+NHf8=;
 b=dTci7TBnqJV2UPTIGfmPPMq+57y5w32FduPaKkHl6joHL3OWt7mLADIxsqQr9GqXjfbpqOZ43uhmWpxAzULGvfotHrfdESbLMHcEvvDg0lXADTTgDSeLeEQbmvh/RpDxeXJiyvjGl3nApxu0rJq3OGH/zh2uap02OxUnfEfEfU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqRVMAW0HlSc7R9WuoEBgdO6r+t1BUeh3ZJpW8rrn+HQVxgd4RzK2NlbU6p8aCEsI6IQbY2eqnqJrQJAzNkqg+7dGehIhV08xWOKcgjI4rPd+BB9hCp6lj9eKx/UQZGrZwstqMeTUYsKBU9MONGkQul89kZMJbVdQk6q0YRrF3jt92ia9tw1lmGTlkFHePC1NddEzDqWDC63eRTgoI2J+SJWpeVYd2TZxPtdUEzMN6p7scaSqrZJq1sFuE28gA8W8B0yLpv+Uj9wlV3CbzLyrtH/j9+14EgUrJFxrsiwW3Qo/599qWrJOctIBLIz6as5b2x5qSsXSh0jTuiArqg5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZm4P0pKM5l8ZCssCdLz88CROqVho728ZmqjUw+NHf8=;
 b=ZXZNlj2KKVjU9TKcTTTh1mPY4BKUTo7pI/M+MoT2lwzqEMLuR3CMYB3yhMdEzJrkfjMdn5IxGFrp0Y2LRHbEh0Q9yuCibIJZ19Ip8M1JNoTYl0dFtuWJvZCwBcSHPTk9m3xFV8hMThPQWcl6a6wlZ98ZQtPkl7e6grH504HdNt64tpw2RHmCQGhwI/LccDEseaQIYMA+Ke/iwJL6h/HRq8+Rf37DbO/1dkhtK9FtbI9Fq1UbvufcINtHsWh4g9K0LZ/thcykFoItOxDFCuf+07EoSKJMsoK0iS3OiB4LL0tvIhUNer9fQCc9l59EiyiIrNe/4IPpXnSlI0Do7nJQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZm4P0pKM5l8ZCssCdLz88CROqVho728ZmqjUw+NHf8=;
 b=dTci7TBnqJV2UPTIGfmPPMq+57y5w32FduPaKkHl6joHL3OWt7mLADIxsqQr9GqXjfbpqOZ43uhmWpxAzULGvfotHrfdESbLMHcEvvDg0lXADTTgDSeLeEQbmvh/RpDxeXJiyvjGl3nApxu0rJq3OGH/zh2uap02OxUnfEfEfU0=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH v3 14/25] tools/flask/utils: list build targets in
 $(TARGETS)
Thread-Topic: [XEN PATCH v3 14/25] tools/flask/utils: list build targets in
 $(TARGETS)
Thread-Index: AQHYh+TN8UAfR3xALEOagCOUzkkyT616DePg
Date: Tue, 12 Jul 2022 01:30:47 +0000
Message-ID:
 <AS8PR08MB799198D219741EECE2420DEC92869@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-15-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-15-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C52C8E0B40C1F645B9BDF649B8F995BE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 914ac633-5c5c-462d-fad7-08da63a62b05
x-ms-traffictypediagnostic:
	DB6PR08MB2840:EE_|AM5EUR03FT047:EE_|AM0PR08MB3953:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3UyoFeUm6fSlZcZtbIze8MRccIaKjDdTS0djnew6Y8aLOAl2/c0tLmjzz0TpvuM3jxJklGgJH+nPoda1dFKeLIltCsp+Ae3qCdti+ftNWLg73JHSlcHOAViqir4TwXUQOopgk6+OdjaGObT4GLV4wjSWRc6Q1aQFkiwnfxzgV8K3LLnW30J5gBapeFkTpH8kl2Bq1pTwC1MAvryg4E2yNVLtnDOxDucqUuzf7SiZPIokeY57M2GHilihPCBk96ksy7wmuMwz5MuzSpaUjwYYA/08e7dqAhKF0j+SY7fPOMcAWShn7sRnBj0mari/SXj1E99yus77dKrpJZjAiggT4ihy3DToANEBBXCDDxOat0MNqQK172yDTRoKdiNU6LEaX8eVCAdXjMPZ16ccWzl0i9TKaB3/pkFLpcN9EJ9PnhbfDCaLqI2msqhLe1c7MtKSYrWFIURY0qpLN199nphmVcVj22HemKNj41AgUdRxRnlSQp41FD6lYU7ra8pl0MzDq0F2oFVLCZagrX65/8BAkcvbReWD60aaRjuc7PDCrqVvpnd+gBM/2hFbwhryeKchuP3rTtLnxIVP/7r0pblX94JxojWzc0AaBla5FRzfzcsDQdEp6hFZx4C5goaprf57wYB1YCrynS/G0kL0RK998Sj8pGkiwnJopyNxlBaMGTycPIMoXJsHs3cBZFy1q1ttApJxsTnqksVhzQUZJEKcjzPaXB0CnjF25/+8a5fTB/kJP8rRb+3gTws9rKqcRa7jjPVxUYfeOJXI7ohu+1NQuX8yTfKUUpG9KdwGNQxqm2GMKgUWkdrg7BjC1qkKRwtzz0KWis0FDb8cLAGHeAROqNm19/EdxmjpL+f7jlPcmpk7Brd8jA8m1LRT7RI+8q90
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(38100700002)(55016003)(186003)(122000001)(33656002)(4326008)(316002)(9686003)(64756008)(66476007)(76116006)(110136005)(5660300002)(66946007)(71200400001)(66556008)(8676002)(66446008)(83380400001)(41300700001)(6506007)(52536014)(86362001)(26005)(478600001)(7696005)(8936002)(2906002)(54906003)(38070700005)(4744005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2840
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3ed62c41-f535-40da-e084-08da63a62600
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xg1UoDGDMyx4QSX1PbP2xI4mENjGqhvopv3YRrinMqMxL/TmmxnkD4I4OI7Gmg3x/wX3I8QBhHVRfkNMJxGfBxhd44b8FMkuS+JaS6ohrKL32CQcWPHWaD7dq6hiFKyONV82n6N+LzJmrUXUINGOyI2gpWW/eNZjRM0zEisOiYcgNA/gFr+JMNrXT4SNN9Nx0LtGC2n5Tq7w6L/SUbz48OJqv2c2/IE5S8iAJ+8welNvaPWlkAyi5ETrqJkX4k9AxBUQHK38Np331uz/4OlaCv6+PsEPRVLIlQRu6BCKMKbGApLndeC1HFkhY0X5/KbUuU1wHI80NrR2hASejROjBSRLUglZ3Hc37q8ViFkk29YWJG/lLanxXF/MF8iA2VluFwrxwVY3p8SkcUgY9ia582WGUXjyraQLxtyhszghd0QGbQwAfH+WlrIQuaRfJiHd/07soR2PmIa0FSsv3Vv4JJPSKiyA3vny7Mm9tEKGXIqKxj2BW4Gg8eHRji5VZdv7wqvee/8HzQNCkxGc5Jgdo84O8LGIQGYgk7y0qKNxTZdvhLya1naizJJ7yqGr6ysx7NNyy++Sv+Mqb7W5Afl77GfI6+T1pQC4F+KwoWUDwKdxijb+QJtgUhcjqZ1n+O6/b8I60ODKh8YvPsEM5xr0HEzfT13h4/o9i0Ih4OPuWK/oWOfHS3DyFJDfCzQGohIq7EApav6F7+oZUNZlEoaOHh9IGeWR/U+JNXehCDZQ3XWtHT9MSq5ueh2tZIS82A+bqkFYExp9i2qbLTswXe7MtyWCenZL3KFkZothEUYGQtNjV9UXzePgvbSORW0WtXRq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(36840700001)(40470700004)(70206006)(8676002)(70586007)(4326008)(86362001)(478600001)(41300700001)(26005)(8936002)(7696005)(5660300002)(356005)(81166007)(82740400003)(9686003)(110136005)(52536014)(316002)(54906003)(33656002)(36860700001)(2906002)(47076005)(40460700003)(336012)(55016003)(40480700001)(83380400001)(186003)(4744005)(6506007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 01:30:56.3254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 914ac633-5c5c-462d-fad7-08da63a62b05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3953

Hi Anthony,

> -----Original Message-----
> Subject: [XEN PATCH v3 14/25] tools/flask/utils: list build targets in
> $(TARGETS)
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
>  tools/flask/utils/Makefile | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)


