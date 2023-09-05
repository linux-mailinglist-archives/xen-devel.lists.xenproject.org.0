Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A27920C9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 09:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595405.928960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQiK-0006qQ-FA; Tue, 05 Sep 2023 07:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595405.928960; Tue, 05 Sep 2023 07:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQiK-0006o0-CN; Tue, 05 Sep 2023 07:43:08 +0000
Received: by outflank-mailman (input) for mailman id 595405;
 Tue, 05 Sep 2023 07:43:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qilU=EV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qdQiI-0006nq-H5
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 07:43:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8fc72f0-4bbf-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 09:43:05 +0200 (CEST)
Received: from DB9PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::10) by PA4PR08MB7644.eurprd08.prod.outlook.com
 (2603:10a6:102:262::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 07:43:01 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::d5) by DB9PR01CA0005.outlook.office365.com
 (2603:10a6:10:1d8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 07:43:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 07:43:01 +0000
Received: ("Tessian outbound 5c548696a0e7:v175");
 Tue, 05 Sep 2023 07:43:01 +0000
Received: from c5fac1c3bc5b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BA8EC25-71C8-4443-B33F-D3863FA92CA7.1; 
 Tue, 05 Sep 2023 07:42:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5fac1c3bc5b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Sep 2023 07:42:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9794.eurprd08.prod.outlook.com (2603:10a6:102:31e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 07:42:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 07:42:18 +0000
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
X-Inumbo-ID: d8fc72f0-4bbf-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPkDAnYQHJqcmCq75LxYkg4zpnkkUwhuZK2Yr8VzeXI=;
 b=rJR/Mg5Hgw0VfYJYi+AX3PsMoYwHHIq7IdxJYfn7fXUcoYXcs6CGBYD1nfBt6z1/EOxarVFH20Thkyr1JBSCXue7LB9+Dw7hSmg+kaqP/EsncDrov/HDtl3voz4CZbN6fTnjw8nTKGKmwQfVFiL/5i+F9P2iGOdq27iAPzB5A+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a6190deb9384785
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adiA1zn/P6n3l1zPuNPm3l5ZCFuG/th9JQ5HYGVhv47mPt7jYZ3Wa8HQheHiHjdqyFmiZQsubL5807sMpRkWTtyTGcqGmq0iCUB+Q4hchcO3pniiWRlx9QlN03T5r3ppZ7ywu39TngGmSN8HU+2SlGBmkwSV2xqiq9pvaF8jw8bpGOvnpB4+8+CDpCUHMrbloVLKwbFm0A8wGljNIqo5/UpzEdEapVREN5lyrGyptMyUWs5yUuv0dW7wqC+7AfEEFJo4R1wzKHN/LfwHh5gExLlLwODgxdSqzBHgcmiVrlkDG0esrioSW/GxxIdh1flfoe1AgRHlHM+tkfXB4lTLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPkDAnYQHJqcmCq75LxYkg4zpnkkUwhuZK2Yr8VzeXI=;
 b=Uo11qj9uHx21Zqe4DxQsEjGZeo94E85yYCh10urn1hH4VVzv3978Zq95uO8Lbrm+O/N6VESQWhL5HWxmdr2I1+9wELt/XPvn2u1gYv3DcWnwbIazasT3isRSjDcOXyQdkP/8QNEOtJjRrLyy3fm8SE7J4hkO2Mdgon9bYamkvbOYf6yOr9qMahFZ4Q+s9yUv8QkEo3LKWhOkjqwgFy95kpMTi5qKV562Oef43uYnkTkHhMcI5zM6068BjuRZGM6SHCntFC9krF3a0K6qt923RWvY0/7kOewAdSgYbgiNnSySOdjNDCrzVw+dA4rnB9tZiVpIGSF07wXpPNTfXr7UNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPkDAnYQHJqcmCq75LxYkg4zpnkkUwhuZK2Yr8VzeXI=;
 b=rJR/Mg5Hgw0VfYJYi+AX3PsMoYwHHIq7IdxJYfn7fXUcoYXcs6CGBYD1nfBt6z1/EOxarVFH20Thkyr1JBSCXue7LB9+Dw7hSmg+kaqP/EsncDrov/HDtl3voz4CZbN6fTnjw8nTKGKmwQfVFiL/5i+F9P2iGOdq27iAPzB5A+Q=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] xen: Change parameter of generic_{fls,ffs}() to
 unsigned int
Thread-Topic: [PATCH v2 2/2] xen: Change parameter of generic_{fls,ffs}() to
 unsigned int
Thread-Index: AQHZ38sXKQ5hzrjtLkWszUwJKclG67AL2VqA
Date: Tue, 5 Sep 2023 07:42:18 +0000
Message-ID: <61D8EE1B-B656-44BE-BF28-7AE4BF163093@arm.com>
References: <20230905073135.12360-1-michal.orzel@amd.com>
 <20230905073135.12360-3-michal.orzel@amd.com>
In-Reply-To: <20230905073135.12360-3-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9794:EE_|DBAEUR03FT040:EE_|PA4PR08MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: b48a4eda-df3f-4ef7-3b1b-08dbade3bb45
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QJdY+tem/4kAqxrlDONPLJ2JrucyUkeX5q13+Awjny8hgeV4fVXFCtVQ+OyGY8EIU7GPXWb7vKJWfTi39ToIhFyt25d/vUVdjL3AsZwZionlkH2eFTiscepRV8zgGssK/v9sxyPIPJAT3HC4LloI/rFMJMgR7x1HlxXRwxN0WPYGwBy7jkIupT1BQWJBcpWiKd+CCXxwGznVrYrTnuPmyTLAR0zDWIdTU5+VvdHajRNzXrOP33KBaqA1gvEneNSsvn74JPdqNdlMY5xKJqolPOwoIxTypa/+Kh9u+1JXDcS6O27f851IeQ5yXYzVLiBtbXqVQ+vFyciUaO4gVo9IgdV/wJ+HZAj8v+SBP0w8a51JvZEhD09GwXBRdGC/pv3vwRzRk/jc5aZS9vKUZVqyJWsePcr11A1RQ6jhOiUoz//5WpQLn0dKDdlDo4Htty7FVJqI8inNDTMaNPZcTX+hsQpovOuGkzVaHUqDnmgHjNOIgLjGhWgNJ3lo6pTM4ndAegHjM7lEFAXV7yU90P50U4lKMRY61gTb9NC4w3Gpr2jfHiECFRmO29Vdk13dyrn/wuPzlyIliw4FdqHKPZDjr8fmyBg+AC6QHNsTy39fB2L+ePb3+2oyqoo8kWEG3BMojlUH2hAKp599He/+ZcYX0QIv+5uIRdsJhm1YmMpSbxA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199024)(186009)(1800799009)(2906002)(66556008)(66476007)(64756008)(6916009)(54906003)(66446008)(66946007)(36756003)(76116006)(316002)(86362001)(33656002)(91956017)(5660300002)(4326008)(8676002)(8936002)(41300700001)(6512007)(38070700005)(2616005)(83380400001)(26005)(38100700002)(478600001)(6506007)(6486002)(122000001)(71200400001)(53546011)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F46A5C3A9AC553498EF49BB95D56C584@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9794
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2fae6622-a811-4768-ffe7-08dbade3a178
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z34YelBLMcb1oHTPm+JeI115ra7cloM4zsygAx2jS2a+I2OWck01N1R3f3EdGEWK9sS/yzzfpj2INpR37i+y1ig08vSvk+0faoKFYCl1KFgvmpeY/RK5HxLd4ZLhRMVwRz6pkLpuHc76ibYFg3r+LGg7SfmMsUHXWrOfPUfmSF6sEnvAOps9GP6tJLk+pLJB/011T0WtYCds/p+LSRhcUvJ0+CXTda3r32vH1DwOAnmw94CDbesb3tryz+u+yfOft4qwQ5TsodMO97KWJ501PyojNVajzv0k9wryjTGBatG/cc6jxM/YUhPfrwEw1sG4OKFM7/C+vyPuFnXQ9k5Euq3Yde6GDZjT+spt0rLtsNEB7SepFrvdlJ6AF58/3sp6dzZ5MI1a8OzSF3yp+LMyxoG3GHBn3AbQpyAMkMLdn9R/ue8nFNfGnqRQwKfakLzf4BzdmTs1APrO4fqZh+Wk+F1mzLmTW6LKammXxfWLTvKW6Vxou/EA5kqF+lq6G2121BrIA2ihIFc0PcYSMWoLIaGzvGoKlISWXKCZ1zaGKbMnwMxthjl6g4DXTl7ImBtSKuFe02TP8M4zo5sKtsLMPU4VKoKQWcFhAniawXRAyXPjXXx196+bDcSu5rVY5X6iaMhbyOfYo3tMDp7Z4TwXPqmJxT7E61q/7XkYTqne/JkV1CtBONku/lHPfjfFqIfBC21BeD/sb0ZA7k4ioM5bgL5mqYbvslAlUxhH0sZudtVKENilUHRk2rVXrHlA9nhq/hpc/hB+D8f8WJ6UfDdBaw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(41300700001)(356005)(82740400003)(81166007)(33656002)(86362001)(478600001)(2616005)(83380400001)(6486002)(6512007)(6506007)(36860700001)(53546011)(336012)(26005)(47076005)(40480700001)(70206006)(70586007)(54906003)(36756003)(316002)(2906002)(8676002)(8936002)(5660300002)(6862004)(4326008)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:43:01.4115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b48a4eda-df3f-4ef7-3b1b-08dbade3bb45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7644

Hi Michal,

> On Sep 5, 2023, at 15:31, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> When running with SMMUv3 and UBSAN enabled on arm64, there are a lot of
> warnings printed related to shifting into sign bit in generic_fls()
> as it takes parameter of type int.
>=20
> Example:
> (XEN) UBSAN: Undefined behaviour in ./include/xen/bitops.h:69:11
> (XEN) left shift of 134217728 by 4 places cannot be represented in type '=
int'
>=20
> It does not make a lot of sense to ask for the last set bit of a negative
> value. We don't have a direct user of this helper and all the wrappers
> pass value of type unsigned {int,long}.
>=20
> Linux did the same as part of commit:
> 3fc2579e6f16 ("fls: change parameter to unsigned int")
>=20
> To keep consistency between the helpers, take the opportunity to:
> - replace __inline__ with inline,
> - modify generic_ffs() to take parameter of type unsigned int as well
>   (currently no user and the only wrapper generic_ffsl() passes unsigned
>   long).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


