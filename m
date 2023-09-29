Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254C17B2F0D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 11:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610468.949879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9eL-0002Y5-CP; Fri, 29 Sep 2023 09:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610468.949879; Fri, 29 Sep 2023 09:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9eL-0002VG-8o; Fri, 29 Sep 2023 09:19:05 +0000
Received: by outflank-mailman (input) for mailman id 610468;
 Fri, 29 Sep 2023 09:19:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPTL=FN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qm9eK-0002VA-9r
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 09:19:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a66d30a-5ea9-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 11:19:02 +0200 (CEST)
Received: from AM7PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:20b:110::31)
 by DU2PR08MB10129.eurprd08.prod.outlook.com (2603:10a6:10:492::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 09:18:59 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::7a) by AM7PR04CA0021.outlook.office365.com
 (2603:10a6:20b:110::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 09:18:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.15 via Frontend Transport; Fri, 29 Sep 2023 09:18:58 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Fri, 29 Sep 2023 09:18:58 +0000
Received: from 17e79e5abfd1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B9349BE-6F57-41C4-AA6B-0835A89949A7.1; 
 Fri, 29 Sep 2023 09:18:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17e79e5abfd1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 09:18:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5671.eurprd08.prod.outlook.com (2603:10a6:10:1a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Fri, 29 Sep
 2023 09:18:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 09:18:48 +0000
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
X-Inumbo-ID: 3a66d30a-5ea9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nXCaHdd/21Wyu8BLjV3dvAYQYfch2q+RAoWuQMLhTY=;
 b=WvzRFaZ85Y+6GrY+E8tg68mK3erEZK3vIpQlbEpWbi63UDb8Jpaxwhv/vxI5GhF1Rh8fYUre9I/SiBIliK9nfBDzwjy44GxK3+O4y4yoVl6khgSreI9AsJRbxM2TWUT0ORA3a7QOVQUSnHhwufOVrdpTerqqTBilO1SYZgj94jo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55ba9a286566d454
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8yl/ZXGlxosqNNA89T77yBZ7aibL4OrCMZcCHiz2U051Fmq05RddncU8zl7B6bc05LTEusArv7HgqOA+9XLDKB8iP83owEV67OoNhiHFmIFezESpyuLfcfU5eNS2K4tuH5LcKgef6YbNJ9iboteXwAIg3z286i7O4IliXI83MzbWhxWLoewL6twLjP9ILbRfA98s/GXiNPQDcwt/goTrpBURP01FFhMV43LTrl10nGK1Xs+smflcfcr8F6srgKmTq8/4RvSmdJJwfTSf6jw/DbTuw2b9gbUQgkIFmH1zjuNSXuALnJfVrAOz8vkt2CXXcJsHt8/cGJAQHQxl4Ny/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nXCaHdd/21Wyu8BLjV3dvAYQYfch2q+RAoWuQMLhTY=;
 b=jHqe++/w86Jriv7y9aWuw8zaWJ1uCqtFYzcVzuY1wqgS8wlyRqAWGeQNGQ4/oYInmoFUZ3Td6UID65DtgckpRFnqC1kRY1sGQCFwiXdpA8OdoCJQoUtmZw4KgD3uxDga6PLZn37V3BuNXPM+W6I5FOzmoro9Nu9Zew4it+xj77HVi+esWoJpTS4/VdTQUDg/4SanQjzGC+K+LtmdcIOmmeXmSbxjrO22l8kjF9WU3tEXgR6xI7is/ZZVfjfXDuOeT120NJjJHDI1Aj2cwnD/WuvYSqDGbVXFmGFuDUrSUFEUOTk3d+OV5RPHZLVA21mQ7skVO8wMx85MoEJOj76v6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nXCaHdd/21Wyu8BLjV3dvAYQYfch2q+RAoWuQMLhTY=;
 b=WvzRFaZ85Y+6GrY+E8tg68mK3erEZK3vIpQlbEpWbi63UDb8Jpaxwhv/vxI5GhF1Rh8fYUre9I/SiBIliK9nfBDzwjy44GxK3+O4y4yoVl6khgSreI9AsJRbxM2TWUT0ORA3a7QOVQUSnHhwufOVrdpTerqqTBilO1SYZgj94jo=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/3] xen/ppc: Fix stack initialization in head.S
Thread-Topic: [PATCH 1/3] xen/ppc: Fix stack initialization in head.S
Thread-Index: AQHZ8mJQH31HusejxUOizMOhUuSKLbAxhjAAgAAA5oA=
Date: Fri, 29 Sep 2023 09:18:48 +0000
Message-ID: <01440197-49D8-4ACD-97C7-0A68370965C0@arm.com>
References: <cover.1695942864.git.sanastasio@raptorengineering.com>
 <4d733b1f17215616b7ab00f0e44d2f483436b1d6.1695942864.git.sanastasio@raptorengineering.com>
 <2199cbc4-de83-4c91-b4dd-e69e0ed79866@citrix.com>
In-Reply-To: <2199cbc4-de83-4c91-b4dd-e69e0ed79866@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBAPR08MB5671:EE_|AM7EUR03FT025:EE_|DU2PR08MB10129:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd13b3e-fede-4664-4337-08dbc0cd1cb5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1OhkVNOUyLkXAxYrJCJdTdkzS1HRbloKZw1bb/dN6NUAfEnS/wF4hKl2O22zZFSfurNBbAPwDpJVSJO7UjG8ZioONt05RSffH+cS44Aqf6k01IMYM57h3pnGWXBrfyxuANUt6KOmbNY1C9c+wyjmTIHEeAg2/jMBAY7PPMvQUkaQnkGccRKec0beeZoFrUTC1CZXNEFqq3gWtZGGUzbXRogKR38f62/nTcCw5/UOYCzLyDbUL6s0HFnCb7YW6XwRoKmeMFCF3ZB6WA2R1HOzJdZ02hgBzTeWtk61fKe5TbSP6iN9TNiz1NWGla7I7rjZHBHld8NT87MzFNKC69bAYBdX9lLqn1tw8USUYw39pJI/8+u4nyMxL1u0mS1ruKTJx34y/wUabQcjJSeIWYaNJDYSPwh6gBhJvNdFfb5DClZDIj+ZJOCLCHOrYJRFxQfu+BXAy5a9kJeBcjjnhBpKNdfUH30LIL0dt0a39TjfemuxPaWPcnf+VSqM0MCcmrv92JS2lmkIhlRb7bMNQtY4L9YSQWj1YasOyZ/aPaXHL18hOtYz2UYYZfU3NB6vSOOQiTRkHAw2i4w86L/ZhnR5d2ogXfv/DfVWEXuJKxvFROZpY3GVoFXRsS10f35xnFQ9yIYtfcmxJk3TfFypi9wLGg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(376002)(366004)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(71200400001)(26005)(53546011)(6506007)(478600001)(66946007)(4744005)(6512007)(5660300002)(6486002)(76116006)(64756008)(2906002)(66476007)(91956017)(4326008)(66556008)(66446008)(54906003)(8676002)(41300700001)(6916009)(8936002)(316002)(122000001)(86362001)(33656002)(36756003)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <44D9F6B7A166884AB56C1D6C9CF1F0DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5671
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b117535-f45a-4bbc-b049-08dbc0cd167e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RbylhU58yqYgPCAljPMWXd/K04mRcurjyp4TE40YWEfIWjkGhUynlCaTpLSfJkFZB8LcNVJVrOiEfLuO4oqV0r2VUm08H54jCzTyUCQCwCIWLGEGh6zoqNDxix7tVLPgsPlZC6tMi9ZZpusHfK4fGBTP9xHMYSRUuhSgAQXh9U9+g2JihFPL7aTv7ESGoWC0hGmm4aD+pyeSPlWSeH6C1DColSOt20tv/cPZNiIVihTL02OskH7l27P2n37y35RqK229q9XR8KklDHcprW41UPy1LXHy4GCcMwe6f+HPiH10yRcV9dVRqLXN/j7Cf9IeCTtAOMK9C6IE0EmY6Wigg/P9HzSMlH8cG6BEYiriG282R6W14os7FRq2QPQmC1bZQWtZ4lbDRqjtIv8lx35mKJ37jQZ/9kRRbcNgbPB7sb1PAjEZIbZfrIOGqGyW82USoYK9iRMn4JopXsMftflzhIqd+A485KvvsdAmS25FFErma/+ZanxeLSbBxvPEggYFhrP522vTQb7D6fz9icaYYcoXyS8m4ZhrzW50AtkinSVEn6bWgq+FnaEidauDGOhnlHMk9loSdNWy5BekG2HPW8O5xZ4T7J7tU2A20jPz+LDDRH4c718AIF31Bx7aTpJxT8y/U8Dc9ukuU+uNzHqu3wYaRBTTiYNYsXOAepUraJHaoqyi01llPWPI9T+ZizlL7MxPj/db4XaMYjTBc9vd8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(54906003)(8676002)(41300700001)(316002)(4744005)(6862004)(70206006)(70586007)(40480700001)(6512007)(4326008)(8936002)(2906002)(36860700001)(6486002)(478600001)(26005)(5660300002)(47076005)(6506007)(53546011)(81166007)(336012)(86362001)(107886003)(2616005)(82740400003)(356005)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 09:18:58.4902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd13b3e-fede-4664-4337-08dbc0cd1cb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10129

Hi Andrew, Shawn,

> On Sep 29, 2023, at 17:15, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> On 29/09/2023 12:19 am, Shawn Anastasio wrote:
>> The code to set up the stack in head.S erroneously loads the bottom of
>> the stack (the symbol cpu0_boot_stack) into r1 instead of the top of the
>> stack (cpu0_boot_stack + STACK_SIZE).
>>=20
>> Fixes: 3a4e6f67bc68 ("xen/ppc: Set up a basic C environment")
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> We're in code freeze for 4.18 now.  Bugfixes are still fine, and this
> one does want including IMO.

Indeed, so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

> CC Henry.

Thanks!

Kind regards,
Henry

