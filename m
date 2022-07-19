Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7A579492
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 09:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370458.602237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDi1E-0003B7-7K; Tue, 19 Jul 2022 07:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370458.602237; Tue, 19 Jul 2022 07:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDi1E-000397-47; Tue, 19 Jul 2022 07:51:48 +0000
Received: by outflank-mailman (input) for mailman id 370458;
 Tue, 19 Jul 2022 07:51:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5+f=XY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oDi1C-000390-Hf
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 07:51:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a27d1069-0737-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 09:51:45 +0200 (CEST)
Received: from DB6PR07CA0063.eurprd07.prod.outlook.com (2603:10a6:6:2a::25) by
 VE1PR08MB5789.eurprd08.prod.outlook.com (2603:10a6:800:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Tue, 19 Jul
 2022 07:51:40 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::26) by DB6PR07CA0063.outlook.office365.com
 (2603:10a6:6:2a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.16 via Frontend
 Transport; Tue, 19 Jul 2022 07:51:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Tue, 19 Jul 2022 07:51:39 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Tue, 19 Jul 2022 07:51:39 +0000
Received: from 6f600144d5a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0E04BFC-438A-4151-ABDB-143DBDC5B0E3.1; 
 Tue, 19 Jul 2022 07:51:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f600144d5a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Jul 2022 07:51:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4712.eurprd08.prod.outlook.com (2603:10a6:10:f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Tue, 19 Jul
 2022 07:51:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:51:30 +0000
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
X-Inumbo-ID: a27d1069-0737-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cbLQlfaY+exoQq7tWGwAshMsXlfWW0oF6dSOUGwFoqFfOMTR24BVnNC237+AssknWc9/WATKq27nstFAVpUXsXuu2/+lvrLVOmoZYzd5rRrwO4OrOxQrTLLI9I0kLe4hQh3GDxDylTlLrMBesjxrfzDn666AnWWnC4yMHBJHJ00aoVTkV0afcCvcuuUjWH0Wn0vZTzIMnjxZBO0m5UM7fjPgLMaWC5sfT7EMW1Bvx2eZAG0XKmngWWmMp0serN3tdmiVYb6Ky9BvuX2s/o3cC5uVv0UP2xZgdDd9T0UBEQqMGvuODb8/fxGcYeftVkm8R+VUVXamcfgTLdmhqOOGSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy5wchmBugCj+9D+Gp2kjqj+kp1a8D0a0MeOcskbhg0=;
 b=M1/Z6aZ8LHcGvtP/OE+T//P/EqHfq6v7LaxALtWU9+MgdnmoNQzyYEreeGjDQz0rx2klAh26Uu7/a6qBPGux3OJNrlW5vrcd4UmijgY0S8RYNPG5wTEsMSI13Y33oaI6bdSwfxh0EZcFUVVkFFRUny0CfTAtWl5S414gEUgv+kOI9ZUM273HZTAJDEWpgINlh1qR90+xm9GmoKYQKp+2hRHmQDwRTl7VNDCPxLRCoetqEojySBNFluTEn1mIwarvaS3Fuh8F8rTSAbmVKVexXjpQVD5+NGKJMkA4UHobyrQyJ9OGMnRkchE/aVrzW8V8J47Ylw7WSSPm/V3OA3E+Ig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy5wchmBugCj+9D+Gp2kjqj+kp1a8D0a0MeOcskbhg0=;
 b=RZQTnyngJC1qIF7KTYzsDdW3C/egPSpQqYa9ZX5bH6JHHGHd/YsJuSwn8x3jKcYrmhHshR9YJK8hZMtQIUifWnzB8tJj6hwtmC9222Q1tMHfH+NgXPm+tVikXuZyT13FHLzkydd9eUjQ2ftRHd825GmLyY9vYxhOsCLbOuSOrtM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b81f1e0e5b493895
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYYKpbEvt3DMkEmo5ECl0GzAtRnwQ97Gf3CGKqtYg3gxRXCwUeDt8Z5Zs2teL/jPR/EgBXxiQAw7bGZDQifu61JmI2NxaEnnElaunws9FjcVuY4vg7YkG1Lm7d8xlYUC2AkQphnDSJuWg9xNPhkYTui8ACSeUHCtlOZXoIVOrErisf9hWgOhoD1P85WBe0BzBXWyoaHTFW3v9LiCmWOp8KexoWi+J58gTpyuo4xSqpmcVzmc2f3weaua7VxR6xOJ/cvUhcflP5engeASPSqb3fS8A9tWOrZVwDR4+5fhq2JLN5HgcYMPZwYDfsyqiKtxGBA0my3QS2hNqewebMsYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy5wchmBugCj+9D+Gp2kjqj+kp1a8D0a0MeOcskbhg0=;
 b=XD4okBeo4tKLIIK+vJUmSj1+6Ul8I3bWDePDmtCNHYVf31+dDL3BU+VM0lZEi/K8STa0NHyb7+73IL94mUsA1ynpsNNp4ZB4KsTE968hWzBkafruf1tqqz2srZXNSFIAbgLFl92etGBzdGy0qsCGFYkILVcyMywDjto5phfmagu2Hy9OGs9lvg/Wu+dFKz76I6zX9kvGF1llUC+A8VPcL8NrWFRurcLblVLQcGIPr6FEiIXCgYrj186gIB/34rqpVBseh33+LIaqBgKxpO41Wi0cFG1oHtnebIUlD2+xeOz8sLyUO5NYGbRJmlBD/QIBAUamcicZdiXapmhJww2Ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy5wchmBugCj+9D+Gp2kjqj+kp1a8D0a0MeOcskbhg0=;
 b=RZQTnyngJC1qIF7KTYzsDdW3C/egPSpQqYa9ZX5bH6JHHGHd/YsJuSwn8x3jKcYrmhHshR9YJK8hZMtQIUifWnzB8tJj6hwtmC9222Q1tMHfH+NgXPm+tVikXuZyT13FHLzkydd9eUjQ2ftRHd825GmLyY9vYxhOsCLbOuSOrtM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 0/2] Yocto Gitlab CI support
Thread-Topic: [RFC PATCH 0/2] Yocto Gitlab CI support
Thread-Index: AQHYl2nwBpPj9ZB3akSbFdgxyjmZtK2FItmAgAA3CIA=
Date: Tue, 19 Jul 2022 07:51:29 +0000
Message-ID: <489E5D0F-C554-4333-9191-AA759E31E69D@arm.com>
References: <cover.1657792818.git.bertrand.marquis@arm.com>
 <CACMJ4GZYweNCWAmWEru8eLLbHRSMkZf82CzFO0Y74mtQc5LqsQ@mail.gmail.com>
In-Reply-To:
 <CACMJ4GZYweNCWAmWEru8eLLbHRSMkZf82CzFO0Y74mtQc5LqsQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cb3d8160-dd39-493d-7df7-08da695b8388
x-ms-traffictypediagnostic:
	DBBPR08MB4712:EE_|DBAEUR03FT017:EE_|VE1PR08MB5789:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CGsw4KwTJZXxssFxUk/Ar4V0NB2zjiLyweQCjVP7Rvdkt8kns+Q4U28erdQaGzycF9NsQFSks8inL5TVkaCuYixnG21oUBDE/M/Qzp91ilV95cDyK2MwRJmDmPnKWn/vtO4TfzBP3l2wZMIzClh9AHlsRVXfgTIXQOjPZ1A4G4uXhvbgFuoRd1mjYWKnCgSTM8NnIdtFnv1mrdGvDs/3TJNoO6Ofjgp3vsFbC6cb7Kq2yRoqKt1AbtlMPWQ09DmrCJ+Kj4pa2LhLEvjzwDq7d5slZv/vq7VOaWtOKrusbOEjKz7i0BqeSLqTVfmecrUN6wQf+R6JjnRXnw2h7QfkTl2q5HicER5WfpeYUnttCB4cQUaSb4NugQhQbiwi2e+fYLW+Hh7PFN2opTWa9bpXvpRiTZbC23O727raVd6Q7SSnbYBp6AaGTB4vb7WA+hEwwZpwZDgP0YeCWHeCoQVYBc4EOLaGcoZjIo1U+wAcW3H9ehfvJjZaa1XDg2atitHaMKCG3IjdmqJq+9gb5IZOT0OOdD9rNdXsTwoM4hz7S5dpsHSNu3EArxkB36bY0ce3mHWy74fKNqjvibcl66f2ot4iXrM7rnVnIR3i+n+hnm7rAP/s0tkV1lWllhSAsM6noDDOkAn/PK6k34qR8mGq7SjLL16XXqhwCoXhNAHqM75ovzz+3r+PLx4MOCSCf6etKTJCaZopDkifwHmvYkVINMILwJ/rhlgnZdny55Tz4azZLHOnhKRaCKQv0KrvUfYgSCdKiSvAXDA+At9ay/6re0od85BSNVWJZIP3ws7YBV8e5dnI7+XzlExCjHAdTq1sHAJpoA8csJeHwC+T0YtqmA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(26005)(6916009)(6512007)(122000001)(186003)(41300700001)(64756008)(33656002)(2616005)(36756003)(66476007)(54906003)(478600001)(6486002)(2906002)(71200400001)(86362001)(76116006)(91956017)(316002)(53546011)(66446008)(38100700002)(83380400001)(8676002)(5660300002)(66946007)(4326008)(6506007)(38070700005)(66556008)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8E949A50B4B3043910A6F329EFD82D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4712
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	181323bc-cbae-415e-80d2-08da695b7dcb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	thVPodk9lzhwTHC08fSpwNmPWcftgfhB0DoyNXAqhjD/0llSbQAe3NHDT2UBZiXklliQoyisTm8oN1Ad4MWsI3GY0mYdXPBcNcx36pvq7Jwbi9ya1B00xmfM8fP06LOTqPYG9xCWwEsa4aGrrfJmu8SCQjpldvd+9wKHhDOJOCa9DGDn8LwpGZJwFLUW+5fpfKouPLhMi3YhJxcG9uv3Ht9gZCWzAi2S2qRGK6UGPI7ef0KuGOZA8LkNi/lgI0e+eVur7SQUkYVTHJ3nogDGTaRj+KwRO+/bJa7OULV7XTA9qlsGvglOKWjQdZgbwshXap9iE+hFFot7M8sdpBX4hNf4S5+Q9Kz91M1cIjMPSmlWMXX2zBtR5af+5m7DJWb91LdO+IgZE5td5JGN4kZTX0e9VQklytu65BSLlHnu0Eu8zBv28bBWQbAWCxlhTtiIqQgXWR3G7HZKGIuJfWS4GoCK3gHHBJTsLZdNiJeRCzp3tawrDbxWsjIrAjTlX6FevBlPSktLuXeSqgm0M/ptvmoy/KEV307faZeI1UjcWFTxDq57Dj6HqDpAWnR78uwpwtMN+idsI0jDyHn/PfuXdWfrHPDy5mFQwHSjGcURdpuI4vzsYJLGJ+D95ewbUCyhcB7+Es6U914X1H+5oK//W6mn+rKpmU4FIQVS6pWcNpV8/tuWZCgXQQyLpIyxoHzYeDbbWRiuHvQnMHWlRy4BPTcpKXrsaEuJSYKXAZ7dwg1arc66SS4rY2wqTCbgigRQZ2NzJOIYgyJTs3kLi2xlwKksKwMZRZsQmyFpUnmNcWHvxDjdbMLkSL0Jnv0gtxBc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(40470700004)(36840700001)(6506007)(53546011)(41300700001)(26005)(6486002)(336012)(47076005)(186003)(478600001)(40460700003)(82310400005)(2616005)(40480700001)(107886003)(83380400001)(2906002)(6512007)(8936002)(54906003)(70206006)(4326008)(8676002)(70586007)(33656002)(82740400003)(5660300002)(316002)(36756003)(81166007)(36860700001)(86362001)(356005)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 07:51:39.6047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3d8160-dd39-493d-7df7-08da695b8388
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5789

Hi Christopher,

> On 19 Jul 2022, at 05:34, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>=20
> On Thu, Jul 14, 2022 at 3:10 AM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
>>=20
>> This patch series is a first attempt to check if we could use Yocto in
>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>=20
> Hi Bertrand, thanks for posting this.
>=20
> I'm still making my way through it, and should be able to speak more
> to the OE/Yocto aspects than the Xen automation integration but at
> first pass, I think that this is work in the right direction.
> A few quick early points:
> - The build-yocto.sh script is clear to understand, which is helpful.

Thanks

> - The layers that you have selected to include in the build are good.
> Might be worth considering using openembedded-core, which is poky's
> upstream, but I think either is a valid choice.

That was how I did it first but packing them in one call is reducing the
number of intermediate images during the creation. If having more is ok
I can split this in v2

>    - listing the layers one-per-line in the script might make it
> easier to patch in additional layers downstream, if needed
> - The target image of 'xen-image-minimal' is the right start; it would
> be nice to be able to pass that as an input from the dockerfile to
> allow for using this with other images.

Using a different image might also trigger other changes (for example
if you want to build xen-guest-image-minimal then you do not need the
same features).
Anyway I will add a parameter to build-yocto.sh to do it.

> - Possibly worth mentioning somewhere in the series description that
> this introduces coverage for x86-64 but not 32-bit x86 guests - it's
> the right choice given that this is just booting to a dom0.

I will add something saying that it does not cover booting guests (yet !!)
but the 32bit guest issue is also true for arm64 so mentioning it for x86
would be weird.

Cheers
Bertrand

>=20
> Christopher
>=20
>> The first patch is creating a container with all elements required to
>> build Yocto, a checkout of the yocto layers required and an helper
>> script to build and run xen on qemu with yocto.
>>=20
>> The second patch is creating containers with a first build of yocto done
>> so that susbsequent build with those containers would only rebuild what
>> was changed and take the rest from the cache.
>>=20
>> This is is mainly for discussion and sharing as there are still some
>> issues/problem to solve:
>> - building the qemu* containers can take several hours depending on the
>>  network bandwith and computing power of the machine where those are
>>  created
>> - produced containers containing the cache have a size between 8 and
>>  12GB depending on the architecture. We might need to store the build
>>  cache somewhere else to reduce the size. If we choose to have one
>>  single image, the needed size is around 20GB and we need up to 40GB
>>  during the build, which is why I splitted them.
>> - during the build and run, we use a bit more then 20GB of disk which is
>>  over the allowed size in gitlab
>>=20
>> Once all problems passed, this can be used to build and run dom0 on qemu
>> with a modified Xen on the 3 archs in less than 10 minutes.
>>=20
>> Bertrand Marquis (2):
>>  automation: Add elements for Yocto test and run
>>  automation: Add yocto containers with cache
>>=20
>> automation/build/Makefile                     |   2 +
>> automation/build/yocto/build-yocto.sh         | 322 ++++++++++++++++++
>> .../build/yocto/kirkstone-qemuarm.dockerfile  |  28 ++
>> .../yocto/kirkstone-qemuarm64.dockerfile      |  28 ++
>> .../yocto/kirkstone-qemux86-64.dockerfile     |  28 ++
>> automation/build/yocto/kirkstone.dockerfile   |  98 ++++++
>> 6 files changed, 506 insertions(+)
>> create mode 100755 automation/build/yocto/build-yocto.sh
>> create mode 100644 automation/build/yocto/kirkstone-qemuarm.dockerfile
>> create mode 100644 automation/build/yocto/kirkstone-qemuarm64.dockerfile
>> create mode 100644 automation/build/yocto/kirkstone-qemux86-64.dockerfil=
e
>> create mode 100644 automation/build/yocto/kirkstone.dockerfile
>>=20
>> --
>> 2.25.1
>>=20
>>=20


