Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF8559FADA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392582.631029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQq5u-0002ft-DS; Wed, 24 Aug 2022 13:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392582.631029; Wed, 24 Aug 2022 13:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQq5u-0002d3-9v; Wed, 24 Aug 2022 13:06:54 +0000
Received: by outflank-mailman (input) for mailman id 392582;
 Wed, 24 Aug 2022 13:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQq5s-0002cr-V1
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:06:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95ff2e65-23ad-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 15:06:37 +0200 (CEST)
Received: from AS8PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:310::9)
 by AS8PR08MB7337.eurprd08.prod.outlook.com (2603:10a6:20b:444::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 13:06:50 +0000
Received: from AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::9a) by AS8PR04CA0004.outlook.office365.com
 (2603:10a6:20b:310::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 24 Aug 2022 13:06:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT049.mail.protection.outlook.com (100.127.140.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Wed, 24 Aug 2022 13:06:49 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Wed, 24 Aug 2022 13:06:49 +0000
Received: from 79e433202d9e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E558ED0E-4ABB-4782-A2D8-E57E247F3D96.1; 
 Wed, 24 Aug 2022 13:06:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79e433202d9e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 13:06:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB3PR08MB8988.eurprd08.prod.outlook.com (2603:10a6:10:429::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Wed, 24 Aug
 2022 13:06:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 13:06:41 +0000
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
X-Inumbo-ID: 95ff2e65-23ad-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FaTtV9kBnUAAF5p95ZQY8m+Jy78PP6VfjSG+yFfy2XyYghmSaCP7zhoL5fpO/igk8vqA9kiyE/XHLpALRl8r3npOQhumSVoRR0akQS1wkWVl7L/EwlPADo7MVRY9t7vuf82RYQQ9SrdOPPaLNrGhthXJxgoU3v+GcUtR6bOA9+1OcvQhkq0LAf09coeJBtc0PQdBu3EF6bJWtH6RRAjT/KcrEzhM1OfV1Zy/8diBZVKQhtupQCvGM51TeFcOc7VeBJQqE6UoDVk/wpCRi2MuceciFXxAYMUxxn0bsLPai6lRPoeBvGDCaGCcQ4t5p6H91P1VYPtAZbFvWFSZedIWcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3raGd76o1NP2IcUITPH2CDyFYfz8nI6wAZ6M1ha4QmQ=;
 b=ONp/cc6oH/ezoem01DnD5yzh8ETnLDCu1BJT2x93T4l+Ku8R8A7oTrrw/TlfgFNrVPe29UFzpxO1OFSqjtQGU8rBIvtoLCBj+SM4v7HCvB58OcFS65frLeqypRQVm6wYnkuut1CoKzChSVRCsnXFC2R54LSXlulUYFpw5Q+sVB2bwspqunZnVdEfa1ZeoDAELanOeW0Pj18P5HBUXLjkwQ5TWza+TfUkr2uWlfw1+R2gQwxuGXjOQIMw0qGqZ3Z1E4rjBQGL3v+gD+r4A6qka2dkbvfPmNPt0JRSOS896KTdoPbZdODqyW1f0yB1G6txWN7Bb71gU7IBtPyIgXA1AA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3raGd76o1NP2IcUITPH2CDyFYfz8nI6wAZ6M1ha4QmQ=;
 b=K1WhTBBAF3AN7q9zS5zWetKYNL8ja31LHHagWjVDFfyRC2GTIarHX89L8lyb3LJHTOsjuxAE0UR/lJKOZcYEM3cZcNAXM6nbb6GuN0Qr1VGRjWkAqD4hlezBKjrJjWUZ/k9vVhUNU+mVZIqHvB1M6zRprc+BJ8xAVCpb2neviKc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 509f3fca146c4551
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfOXdkrCnR4YGWyZqPVkDFOw/vHMNHe5VGm88P4Fp4LtJ+36DpYDHx11DlFN0Tq/nYSIGDdZMXmUp+z9tt8Ua8Cm6s7euiWBmkROaDaBLEgXe1l7OEHggFjQUC0LlXcFIB7xlOCIlte5Q37Q96R9C3L3+medgvoxR0tlkyUvhDfLDS72ud1wC6wKs/h69fu1U4/1nafcizntYefIjwCIYsjooHiOHByYP8ztJQFOFdrB738L0m80U2zV2bGPWuf9AXvCfZIMimA9lQi7hYWeuMWlmRQgfefPYavk2dOLiSe6KYgshD0RvDwqySO3FqAvYCbORKPdjDR+fNwXYBF7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3raGd76o1NP2IcUITPH2CDyFYfz8nI6wAZ6M1ha4QmQ=;
 b=esKCUktAfmpaH0Eu6CyPQyJ8E6SsVvJW69BkJo4wUN+LWWq24Q/vjLLb43oLSjA4lTcVHH5igyCc6gtprlG2MR1Ym4D4WTLolBROiJHAVDWaM2ZtYIEjuT5dSsXiDfaHv07yLTw/kO5hC9nR5DEg9TJHZwuzoa9uiMlm3krlxXnmjcUWKHQXdGMXbgVPMbPo65S50mYOSS1YTyQmiSx0lZqEgqq2b0kmOe/jQ/ZSoanH+ZOhameoV+J92nUbhZXRLWdTYYeBw0ycsQrpUII8PFJDzvhyeL+jqAbV6YQQm1P/E2Fr3SFdIAbomACJVhbdIYMUIVLjqdPOm8avrMKdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3raGd76o1NP2IcUITPH2CDyFYfz8nI6wAZ6M1ha4QmQ=;
 b=K1WhTBBAF3AN7q9zS5zWetKYNL8ja31LHHagWjVDFfyRC2GTIarHX89L8lyb3LJHTOsjuxAE0UR/lJKOZcYEM3cZcNAXM6nbb6GuN0Qr1VGRjWkAqD4hlezBKjrJjWUZ/k9vVhUNU+mVZIqHvB1M6zRprc+BJ8xAVCpb2neviKc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Topic: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Index:
 AQHYttqU3r7Sk/IKHkKroerrTRS8F628a1KAgAARJACAABAJgIAAAokAgAAIAACAAAnuAIAAA0iAgAEG1gCAAFVqgIAABgyAgAAAcwA=
Date: Wed, 24 Aug 2022 13:06:41 +0000
Message-ID: <5680F534-E62B-4F35-A13E-8FC73D3A98FC@arm.com>
References:
 <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
 <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
 <C7766EB8-B741-4443-99C3-EB14C1EA9804@arm.com>
 <348e6d5c-d846-3d8a-e26c-316ba6a98938@suse.com>
 <F1E1B306-5C4C-44C1-B4BE-E546B0B67C97@arm.com>
 <3a4cbf36-ff90-bf7d-b7e6-5d8a49880f2d@suse.com>
 <6692B919-268F-461C-B5CE-DF07914DAFCF@arm.com>
 <df2790eb-c4c0-9fdd-b0fe-f98810fe6741@suse.com>
In-Reply-To: <df2790eb-c4c0-9fdd-b0fe-f98810fe6741@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 006c615b-81ed-4561-4f8a-08da85d181ba
x-ms-traffictypediagnostic:
	DB3PR08MB8988:EE_|AM7EUR03FT049:EE_|AS8PR08MB7337:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xZJBnj6Nut2Cyir/jM9Ccc8bT9+H23ht6+hxtgjVZV+QRNiqrBWECOUaUVI+ibGtGKsmsuZNfbcwX+D4pZkrf0AJvN6/zH5FLhtBJw7tkPLinwdqW2IilT26y7dcIEz0RPonRauaQ0H1HIzBhG0nk/0uwtJa3HioLk1mrXqfH2xbNwjV4Fsc3/YPemjcTQAwOBbPxkjocscRRSSizPBfsHDHyJoGt07BOzKFx5Ef+DzMkjY9nEfK2IAR/p51qr0LTUQT/yR7TE+A75S4Qfgxg6EWPgGyiSZoNxrhd48fJNccYKlTxVVYh+GkuI5ggRJPpTryYPrSX3MuQBdLazvu1HBKDzbFj5urk0Fr4wyJTlthuuFB3eVpmxDs+o2k4ZSyJm7u/jBZDgIBu3KwTatGPCmzLEdCMof9Nbk0HqKzKpDJfYIYnQLLmtib0Urjc+YwnAV6TYE7eCSZMt3qHoyrT9XxD0h2RQHPOAfjvYucIjIA8+44EbJd3gehSI5+CDJSwf8EZr9GsFag/KGnN2FWWT0meY9Qf7T/xHbJ9ELvPJgu7WEq+3AttnS1jVTgOoxjdFX64bCUiict7CnrrUMlzNiFhPcThCQkpmztK5cDS5RPz5pZB8Va29pRmy30Ixgw56DszaLMR4LCEMeYca8VORed6fY/gQWLDexgvzKGGPKFN8d2kIHScaAlFVI8wD6N1qqEa873KIi/bqeNl4oS9xlTBBOaRhJokqTV4CivOaE2tuB2kR5qLiX6gYIY/xIVo/rH21coxj8/sbdBvz+gWVN7Hkmc2FfpxPY6JQXm8E0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(6506007)(36756003)(6512007)(53546011)(5660300002)(26005)(8936002)(478600001)(6486002)(33656002)(86362001)(186003)(2616005)(71200400001)(41300700001)(2906002)(83380400001)(54906003)(38070700005)(316002)(66946007)(8676002)(4326008)(66446008)(64756008)(66476007)(66556008)(76116006)(6916009)(122000001)(38100700002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <14BC15E3965B8E42BF8A884546B15E6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8988
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fab7506c-042d-4f48-75c7-08da85d17cae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3fT1e4893tD0YZviTDKRtCpOVnmARdC831Wwz5+lox9tPFwkwtOw2iQFusOUVwHdfvN1nmLFARy+e4NIy9LjcUVEKBtvAd2WiAUO59nyCsg1bI7ojrwrWRRC8Rw7EQfd9R5WU0aiNRWlKM9MbuOIRoU5yCYKCJR7QSA/Efj+k/UGPpTYUv+rurgm7nRb02o3wmwy9NeddB7mu+phqk8r4ZDfQL8zHTrhYRqPUr/b4eujKbZzLUP55bpoGJX+AXNXbYK1RPEdnMsbCmB+6DjtuN/DGRTqwn6FX8klcAHmWh2z6W7apE6cre+OX8DjLL7NXtcZiOxRKQDqJtOFuz/gINP2Eyy2ZgSAoXuI5bUM222Vvz6uWdY/bCT4TPJJtDMqWi/bysQ/EnLfJPRtOjldZEC3rykMN3XEeVRCruOaAYRU7Mofgj1GhsUyMPpf28zkHrxyJylvi/oCRtXEcLJbs/CjXe7SprGWOeqlU2CGUqiNEa3ef/ENSkR6L/n66vmd3wGaxytpvKyd9G+LmoTujRGlmvqQvE6xKwcF2JrqdBIxR6vLAKLMhv/dozmeO97obS6zwPcViNpmEMBOzKQebcq3cbuuQW9bS2reXm6eIZ46YgvnAlOIIsPa4hXTkxyLjJPI09nGMog9rllZgjss2NJz+uz7cRhBJ8e5BhklKR3jpfnp+IyVy6NUJ5qr83glEfqyfhY970he8iPdFL6E91WfvsD5qKLJwmaCLaMwe/9gEy7nYi/82cfn7yEovEEzFXU4X3qCSnzJCX7wWiHvgg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(40470700004)(46966006)(36840700001)(40480700001)(356005)(81166007)(6486002)(70586007)(8676002)(70206006)(33656002)(316002)(4326008)(82740400003)(47076005)(2616005)(336012)(186003)(2906002)(36756003)(8936002)(86362001)(53546011)(83380400001)(40460700003)(478600001)(82310400005)(36860700001)(6862004)(5660300002)(41300700001)(26005)(6512007)(6506007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 13:06:49.6851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 006c615b-81ed-4561-4f8a-08da85d181ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7337

Hi Jan,

> On 24 Aug 2022, at 14:05, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 24.08.2022 14:43, Bertrand Marquis wrote:
>>=20
>>=20
>>> On 24 Aug 2022, at 08:37, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 23.08.2022 17:56, Bertrand Marquis wrote:
>>>>> On 23 Aug 2022, at 16:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 23.08.2022 17:09, Bertrand Marquis wrote:
>>>>>> How about moving those to a xen-acpi.h header and include that one i=
n xen.h ?
>>>>>=20
>>>>> In principle okay, if there wasn't the need for HVM_MAX_VCPUS. With a
>>>>> suitable comment it may be okay to live there. I'd be curious what
>>>>> others think.
>>>>=20
>>>> The problem with this already exists in the current status as this is =
defined in
>>>> hvm_info_table.h which is never included from arch-x86/xen.h
>>>=20
>>> You're referring to it being necessary to explicitly include both heade=
rs.
>>> That's not what I'm referring to, though: The tool imo shouldn't includ=
e
>>> hvm_info_table.h, and hence the HVM_MAX_VCPUS would need to move as wel=
l.
>>=20
>> Any suggestion where ?
>=20
> Not really, no. That's why I said this is the one part where improvement
> is more difficult. Otoh hvm_info_table.h is self-contained right now and
> doesn't even produce potentially misleading struct layout for the one
> struct it declares. So perhaps not too bad if left alone.
>=20
>> The more I dig, the more I find that everything is including xen.h and g=
oing round.
>> Arch-x86_*.h headers are including arch-x86/xen.h including xen.h
>=20
> Indeed, all quite odd.
>=20
>>>> Including hvm_info_table.h from xen-acpi.h could create include path i=
ssues.
>>>=20
>>> Include path issues? Both are / would be public headers. But as said, I
>>> don't think any new header introduced for the purpose at hand should
>>> include _any_ other public header.
>>=20
>> For now I can create a arch-x86/xen-acpi.h and move there the XEN_ACPI_*
>> definitions and include that one instead in mk_dsdt.h.
>> The change will be small and should not have much impact.
>>=20
>> Modifying HVM_MAX_VCPUS is not per say needed and I think would not be
>> enough to make the situation cleaner.
>>=20
>>>=20
>>>> But as those are used nowhere apart from mk_dsdt, I would probably ski=
p the
>>>> include of xen-acpi.h from xen.h.
>>>=20
>>> Hmm, yes, that's reasonable I guess as far as XEN_ACPI_* go. Of course
>>> HVM_MAX_VCPUS is a different matter.
>>>=20
>>>> Any chance that those XEN_ACPI_ are needed by some external tools that
>>>> could get broken by this modification ?
>>>=20
>>> Requiring them to include another header is, I think, a tolerable form
>>> of breakage, the more that such breakage isn't very likely anyway.
>>=20
>> Then if you are ok with it, I will just submit the xen-acpi.h creation p=
atch and fix
>> mk_dsdt compilation for x86 on arm.
>>=20
>> The rest would require more thinking and I do not think it should be don=
e now.
>>=20
>> Can you confirm you agree ?
>=20
> Almost - I don't like xen-acpi.h as the name of the new header. Just
> arch-x86/acpi.h would likely be too generic, so I'd like to suggest
> arch-x86/hvm-acpi.h or arch-x86/guest-acpi.h. I have a slight
> preference to the latter, because "hvm" also covers "pvh", yet PVH
> Dom0 is dealt with entirely differently ACPI-wise. Plus "guest"
> isn't misleading as to PV, because PV guests don't have ACPI anyway.

Guest-acpi.h it will be.

Bertrand

>=20
> Jan


