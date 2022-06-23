Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D81557E76
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 17:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355065.582504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4OTi-0003Dw-8a; Thu, 23 Jun 2022 15:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355065.582504; Thu, 23 Jun 2022 15:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4OTi-0003BP-5F; Thu, 23 Jun 2022 15:10:42 +0000
Received: by outflank-mailman (input) for mailman id 355065;
 Thu, 23 Jun 2022 15:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQE8=W6=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o4OTf-0003BJ-VW
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 15:10:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a288215d-f306-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 17:10:37 +0200 (CEST)
Received: from AS9PR06CA0755.eurprd06.prod.outlook.com (2603:10a6:20b:484::11)
 by AS4PR08MB7879.eurprd08.prod.outlook.com (2603:10a6:20b:51e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Thu, 23 Jun
 2022 15:10:33 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::8d) by AS9PR06CA0755.outlook.office365.com
 (2603:10a6:20b:484::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Thu, 23 Jun 2022 15:10:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 15:10:33 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Thu, 23 Jun 2022 15:10:32 +0000
Received: from 4ec3578ea784.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B5DA730-D671-4C48-9E2B-AA3DC08DFDDD.1; 
 Thu, 23 Jun 2022 15:10:21 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ec3578ea784.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jun 2022 15:10:21 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM9PR08MB6929.eurprd08.prod.outlook.com (2603:10a6:20b:302::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 23 Jun
 2022 15:10:19 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 15:10:18 +0000
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
X-Inumbo-ID: a288215d-f306-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YtNHSA49pG+kFhFnqPkipXKY+7dOATZIYMhAvep+nCtiW7ePS7WzbnL/Udy4/i1NNljMOfak+g2KmEKb99wV1rbCBKrGBPFR5CXpE4qVpdYRcu3BmjoTelpCrTHW5homOM2Ia7plg+SmtgpcGCemZ841u+vFZBtSrmZR0of1KCZvFlBbwsayAn73gj2Y7yDIqko8zFdU+M1iEKHDdl8Xkin3ZO+FOtpPqRRuFimBY/jp/oRS8fInZ2HgHGKndWnwhb8f5Mc0ZkSR+lXhqo2JYkNdHTQRblUI0l4RMPwGvcbj0U0Q1gmUpR9B+qe/rP70hUppUlXdQUe6Mg/VGZ1Bpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gZT7tq89fRXo1NwAY5FwgPpPY8hPZ6uzpqvCrR1a6o=;
 b=RCzzWp8aG1VNEJfxa0xvnYigWYsDUMM48Jf5QZel6lV/Ews5scCvMhs0BfstgCNDhLHt7yf9eoljCt8Q//sGYQm0+/WB1Y9f+4EOgVAUa6eTTgHGXFpDZNnXskXabqneTRk+8Ue7L02DQJc/jPZyq+45N0ffWSMkM5fCLicjH6ZeOxtcNdbKNJqGR+fYqIlxIzHVbpv+3D2FV2tp6v/lvLrEZEDxgSWp9kV3dE4QtgzZVit/8bX93lcEpOC/PBgKh0QZGAUtf+Wij9Pc1tA7Wv/X2gF9e7UJ2SQPb7GXCqEE7GSWh16xLEm8MisrOcLRPCZbQPXN7IdHKnsSgW4YXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gZT7tq89fRXo1NwAY5FwgPpPY8hPZ6uzpqvCrR1a6o=;
 b=tMl1XAqj1XaqwXYn8j8E3z+pjQeQeliDeQyAz11DIhMUqqHOHe5gF/kqrMvY4qbPfbCAhyUt4k1O8emIVqXJsZgFZbGU4aQ6STYK5TzyqVGdOY587c3sU8MPdlN4ktMldytAIfRvPwBlYsiTGxSHImQEFt83iG+/jWmBiDwo52w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81266b4eb0ee3738
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdHSwQ4dqBayujt9mPpTYrnM44fnOgHA79FkgC5OjyhwcOX9HtGgJG3WWhBd77RdxL91+cGITubwQ4sNCIrGbv+QuY9MTLI/SxXeGx0yhZPOwiJ8Yc64SXlClXXTiTvRQ8qldYVI90tRBiZgzQtBGXUZQKUADWfdB7iO9CkGykf8CfFpHNxzxcE4ye6O0jBLetHkTI2CWdoKstevorUM2RmRX4/H+hpt7TN9ynWSzHZSosg6p6qnyzeunq1phgXkW268W4GmxULMiUIqeU5dWZQDfg1pwjRGGqTi0jXjQRxY8BFZQrQk996AiH5jqF0Zn2dSjayYScGdfKs43Y4plA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gZT7tq89fRXo1NwAY5FwgPpPY8hPZ6uzpqvCrR1a6o=;
 b=Jat5vAmuzHeZZ6tKVMSl9hWvAmrhHrbXbV7rKhcZTzB7woBfHO9dIRE66HVizNmtQ7hPqUmFrjc1hSWWwqDy03lkurazmCJsOdIgZmBBJvypKjd/rD8ON9ZtpJ+D0Fqh+28kW/vbmOS29sZN22hi5EZLRV5plxtsyy+N+khaIiMNMgqIAxAA3EjPHMB+VtORgNjwtMGbJxye7iK+u75Kb6LroOESnhKDj/PaX6pSeWpPLAJ5SVuKahaBthFx7o6iIAPdCELfpMwND0UX4qEg/Hk3CDLJNqzHe8LU2Foindhi5e50Y75wydTHPzdW02xABQuj6Gzr9PBSqCZaLLVcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gZT7tq89fRXo1NwAY5FwgPpPY8hPZ6uzpqvCrR1a6o=;
 b=tMl1XAqj1XaqwXYn8j8E3z+pjQeQeliDeQyAz11DIhMUqqHOHe5gF/kqrMvY4qbPfbCAhyUt4k1O8emIVqXJsZgFZbGU4aQ6STYK5TzyqVGdOY587c3sU8MPdlN4ktMldytAIfRvPwBlYsiTGxSHImQEFt83iG+/jWmBiDwo52w=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Topic: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Index: AQHYhkX79rj81mJ150e3nBZ0EA7O6K1bhmuAgAGTuoA=
Date: Thu, 23 Jun 2022 15:10:18 +0000
Message-ID: <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
In-Reply-To: <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dc321f0f-89fb-4dfa-5875-08da552a84f1
x-ms-traffictypediagnostic:
	AM9PR08MB6929:EE_|VE1EUR03FT036:EE_|AS4PR08MB7879:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR08MB787976D00BF349ADF0A9AC3CFCB59@AS4PR08MB7879.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kP+Ef7aycdM2UEzVDhrFZBFOj7Htx2CzeuIxpjOB0n8kXdRTJ07YUxNEi8Entz+CmpDUYT3MuzaGs564M6yvOAw8+0bertCUIlvNt9Spx4GisgPJMPLbSqGv8Nyrud7WYxA+J937kptoawnUwwOkMKradOI6RI+4IUfFSbU5P7wIANWlSAYO7BAIjgxcEZGSwESrcr6Fd19+4+qUv+Kg+JpbWrVrg2FJkz3VmdH8WDkuwhiHvm3MDk5VzzzhhSBsW/Uw5I5/rC3V18/gPqcZrsmAsiDR2hIp4OIaubo1VIbc70ZweX8t9mXszG5v+13jz+8wLxK9EdwuWteVrLIQV+DZVRAd9TBFEzXIM9jTTabPe+mr3Tai2/yZhP32vaJFtVVR0I12K336Kdtysun7fsAJfzTE2NfqdUKjnA4BcZioun0ZHYFwCvhPu7zskeU1g8Sb90xLIvVJGhCY1gRwjH6FXuGtqZNnpIjVYu6pR7wSD7DSYyDK/2rqcpS+5LoE6IVutWntmUNcrajHt6ZJ/CGTY7QVw/erJv8KId6y4l2VZWej2l028ytxkcgSb9szXD1OUGghFZTweMyYqPW56hzl4NufWCtlGRA3WkLDi6dxsc4Em34lza7/Rewmz2YHOr92/H/DCLcMUcTkRziOoX9+pukoImDB0L/wFwjTg4JBVeA8yDAGc7rqpEPk5cRChp16TG/nNvqn98PD5E1LvGGTl9P0aHnLBXQ5a5KPgIWisEz39c10qseYQKIByl6Hyu2PPH0iA97/qECnDts902c8FSy+DZAe/fZi1rwUhvw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(53546011)(41300700001)(122000001)(38100700002)(186003)(86362001)(2616005)(33656002)(316002)(66446008)(6506007)(26005)(54906003)(6512007)(38070700005)(478600001)(66946007)(76116006)(71200400001)(2906002)(83380400001)(36756003)(91956017)(6486002)(8936002)(8676002)(6916009)(64756008)(66556008)(5660300002)(66476007)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A57F97B28866D46B1670E1F2A502A95@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6929
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f604eeb8-e16b-4e89-8df6-08da552a7c4d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IApRiLePPsTH69Z4nvLzoQ6BYB1sWMZkDHoMG7QUNKrIf1Rv1C8LAWJNcF7YnOT8v9PE26UiHzv8D5NCBRXYYMQplO40BVPBKsl8TOlNSdl4bsUMV7R8maMF3ZohxcQeSxiqOgmfEf0ln9EuNDS0FUbaBs7354a38oZLvWr5Aq+/a9I6nYJt673VvO/XwY/NyUOM8xGyORYZKoVrgbpyABmGPRZBjf66GSCjWEPu99QaQoT+TiUT6FnRUEfrGII5I50kv5aMR0cjMtqpEPNQ7j/awNWdixF2PsFRlG5vCv77Y06tzJ+EvBNjSm1gem4EtgjSFlRV8dbUhpiwmcL6LmfMKQ5Uns3MMG7uof5TZh9+f1HNLcvuWzioiwE1TIscpDFXLhMHOILPRBPR5IxLxnVR4tEzQGzqyCKfs7i0drV0FExkJn9FKL5jX4IrMgHyb3DUVJWHFnDhM6WmdRoHIY4w2Qm1OjlixmatPvx7lgLk/+XFSCF+f+QtRMa3GKgDoAGEGqgOQzc4Mv8/aHa7ac7radixnZLZVtM9XQpFL2MkK/MwidpSXAdUv9BYbjYV1j1RAWSk/6v3O48BKol5gCn3PAAmf6jYnnqFVY9Zeuew9JYWEtHY4cvas2PY/lnjwYNvgatn2/+xwGgfiwWDXYEIuaywxu9Jo9OMENDGvm1O051B+pb05zM18Ix3U0nEBI3H9XWRu/THJ32PgYSBtnLebD0X50q7ipu7aFGHYif31reYMqVgiIar8hsh+/jkzAQDlCxgShobcMJX3oppsA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(40470700004)(36840700001)(46966006)(8936002)(478600001)(40480700001)(83380400001)(5660300002)(54906003)(6862004)(82310400005)(356005)(6512007)(8676002)(70586007)(316002)(4326008)(33656002)(36860700001)(6486002)(47076005)(40460700003)(2906002)(53546011)(6506007)(186003)(70206006)(86362001)(26005)(336012)(2616005)(82740400003)(36756003)(41300700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 15:10:33.2315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc321f0f-89fb-4dfa-5875-08da552a84f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7879

SGkgSnVsaWVuLA0KDQoNCj4gT24gMjIgSnVuIDIwMjIsIGF0IDQ6MDUgcG0sIEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAyMi8wNi8yMDIy
IDE1OjM4LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEd1ZXN0IGNhbiByZXF1ZXN0IHRoZSBYZW4g
dG8gY2xvc2UgdGhlIGV2ZW50IGNoYW5uZWxzLiBJZ25vcmUgdGhlDQo+PiByZXF1ZXN0IGZyb20g
Z3Vlc3QgdG8gY2xvc2UgdGhlIHN0YXRpYyBjaGFubmVscyBhcyBzdGF0aWMgZXZlbnQgY2hhbm5l
bHMNCj4+IHNob3VsZCBub3QgYmUgY2xvc2VkLg0KPiANCj4gV2h5IGRvIHlvdSB3YW50IHRvIHBy
ZXZlbnQgdGhlIGd1ZXN0IHRvIGNsb3NlIHN0YXRpYyBwb3J0cz8gVGhlIHByb2JsZW0gSSBjYW4g
c2VlIGlzLi4uDQoNCkFzIGEgc3RhdGljIGV2ZW50IGNoYW5uZWwgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBkdXJpbmcgdGhlIGxpZmV0aW1lIG9mIHRoZSBndWVzdCB3ZSB3YW50IHRvIHByZXZlbnQNCnRo
ZSBndWVzdCB0byBjbG9zZSB0aGUgc3RhdGljIHBvcnRzLiANCg0KSSB0ZXN0ZWQgdGhpcyBzZXJp
ZXMgdG8gc2VuZC9yZWNlaXZlIGV2ZW50IG5vdGlmaWNhdGlvbiBmcm9tIHRoZSBMaW51eCB1c2Vy
LXNwYWNlIGFwcGxpY2F0aW9uIHZpYSAiL2Rldi94ZW4vZXZ0Y2hu4oCdIGludGVyZmFjZSBhbmQN
CmlvY3RsICggSU9DVExfRVZUQ0hOXyopIGNhbGxzLiBXaGVuIHdlIGNsb3NlIHRoZSAiL2Rldi94
ZW4vZXZ0Y2hu4oCdIGludGVyZmFjZSBMaW51eCBldmVudCBjaGFubmVsDQpkcml2ZXIgd2lsbCB0
cnkgdG8gY2xvc2UgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsIGFsc28sIHRoYXQgd2h5IHdlIG5l
ZWQgdGhpcyBwYXRjaCB0byBhdm9pZCBndWVzdHMgdG8gY2xvc2UgDQp0aGUgZXZlbnQgY2hhbm5l
bCBhcyB3ZSBkb27igJl0IHdhbnQgdG8gY2xvc2UgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsLg0K
DQo+ICANCj4gWy4uLl0NCj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ldmVudF9jaGFu
bmVsLmMgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYw0KPj4gaW5kZXggODRmMDA1NWE1YS4u
Y2VkYzk4Y2NhZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jDQo+
PiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYw0KPj4gQEAgLTI5NCw3ICsyOTQsOCBA
QCB2b2lkIGV2dGNobl9mcmVlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBldnRjaG4gKmNobikN
Cj4+ICAgKiBJZiBwb3J0IGlzIHplcm8gZ2V0IHRoZSBuZXh0IGZyZWUgcG9ydCBhbmQgYWxsb2Nh
dGUuIElmIHBvcnQgaXMgbm9uLXplcm8NCj4+ICAgKiBhbGxvY2F0ZSB0aGUgc3BlY2lmaWVkIHBv
cnQuDQo+PiAgICovDQo+PiAtaW50IGV2dGNobl9hbGxvY191bmJvdW5kKGV2dGNobl9hbGxvY191
bmJvdW5kX3QgKmFsbG9jLCBldnRjaG5fcG9ydF90IHBvcnQpDQo+PiAraW50IGV2dGNobl9hbGxv
Y191bmJvdW5kKGV2dGNobl9hbGxvY191bmJvdW5kX3QgKmFsbG9jLCBldnRjaG5fcG9ydF90IHBv
cnQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaXNfc3RhdGljKQ0KPj4gIHsN
Cj4+ICAgICAgc3RydWN0IGV2dGNobiAqY2huOw0KPj4gICAgICBzdHJ1Y3QgZG9tYWluICpkOw0K
Pj4gQEAgLTMzMCw2ICszMzEsNyBAQCBpbnQgZXZ0Y2huX2FsbG9jX3VuYm91bmQoZXZ0Y2huX2Fs
bG9jX3VuYm91bmRfdCAqYWxsb2MsIGV2dGNobl9wb3J0X3QgcG9ydCkNCj4+ICAgICAgZXZ0Y2hu
X3dyaXRlX2xvY2soY2huKTsNCj4+ICAgICAgICBjaG4tPnN0YXRlID0gRUNTX1VOQk9VTkQ7DQo+
PiArICAgIGNobi0+aXNfc3RhdGljID0gaXNfc3RhdGljOw0KPj4gICAgICBpZiAoIChjaG4tPnUu
dW5ib3VuZC5yZW1vdGVfZG9taWQgPSBhbGxvYy0+cmVtb3RlX2RvbSkgPT0gRE9NSURfU0VMRiAp
DQo+PiAgICAgICAgICBjaG4tPnUudW5ib3VuZC5yZW1vdGVfZG9taWQgPSBjdXJyZW50LT5kb21h
aW4tPmRvbWFpbl9pZDsNCj4+ICAgICAgZXZ0Y2huX3BvcnRfaW5pdChkLCBjaG4pOw0KPj4gQEAg
LTM2OCw3ICszNzAsNyBAQCBzdGF0aWMgdm9pZCBkb3VibGVfZXZ0Y2huX3VubG9jayhzdHJ1Y3Qg
ZXZ0Y2huICpsY2huLCBzdHJ1Y3QgZXZ0Y2huICpyY2huKQ0KPj4gICAqIGFsbG9jYXRlIHRoZSBz
cGVjaWZpZWQgbHBvcnQuDQo+PiAgICovDQo+PiAgaW50IGV2dGNobl9iaW5kX2ludGVyZG9tYWlu
KGV2dGNobl9iaW5kX2ludGVyZG9tYWluX3QgKmJpbmQsIHN0cnVjdCBkb21haW4gKmxkLA0KPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICBldnRjaG5fcG9ydF90IGxwb3J0KQ0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBldnRjaG5fcG9ydF90IGxwb3J0LCBib29sIGlzX3N0
YXRpYykNCj4+ICB7DQo+PiAgICAgIHN0cnVjdCBldnRjaG4gKmxjaG4sICpyY2huOw0KPj4gICAg
ICBzdHJ1Y3QgZG9tYWluICpyZDsNCj4+IEBAIC00MjMsNiArNDI1LDcgQEAgaW50IGV2dGNobl9i
aW5kX2ludGVyZG9tYWluKGV2dGNobl9iaW5kX2ludGVyZG9tYWluX3QgKmJpbmQsIHN0cnVjdCBk
b21haW4gKmxkLA0KPj4gICAgICBsY2huLT51LmludGVyZG9tYWluLnJlbW90ZV9kb20gID0gcmQ7
DQo+PiAgICAgIGxjaG4tPnUuaW50ZXJkb21haW4ucmVtb3RlX3BvcnQgPSBycG9ydDsNCj4+ICAg
ICAgbGNobi0+c3RhdGUgICAgICAgICAgICAgICAgICAgICA9IEVDU19JTlRFUkRPTUFJTjsNCj4+
ICsgICAgbGNobi0+aXNfc3RhdGljICAgICAgICAgICAgICAgICA9IGlzX3N0YXRpYzsNCj4+ICAg
ICAgZXZ0Y2huX3BvcnRfaW5pdChsZCwgbGNobik7DQo+PiAgICAgICAgICAgIHJjaG4tPnUuaW50
ZXJkb21haW4ucmVtb3RlX2RvbSAgPSBsZDsNCj4+IEBAIC02NTksNiArNjYyLDkgQEAgaW50IGV2
dGNobl9jbG9zZShzdHJ1Y3QgZG9tYWluICpkMSwgaW50IHBvcnQxLCBib29sIGd1ZXN0KQ0KPj4g
ICAgICAgICAgcmMgPSAtRUlOVkFMOw0KPj4gICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgIH0N
Cj4+ICsgICAgLyogR3Vlc3QgY2Fubm90IGNsb3NlIGEgc3RhdGljIGV2ZW50IGNoYW5uZWwuICov
DQo+PiArICAgIGlmICggY2huMS0+aXNfc3RhdGljICYmIGd1ZXN0ICkNCj4+ICsgICAgICAgIGdv
dG8gb3V0Ow0KPiANCj4gLi4uIGF0IGxlYXN0IHRoZSBpbnRlcmRvbWFpbiBzdHJ1Y3R1cmUgc3Rv
cmUgcG9pbnRlciB0byB0aGUgZG9tYWluLiBJIGFtIGEgYml0IGNvbmNlcm5lZCB0aGF0IHdlIHdv
dWxkIGVuZCB1cCB0byBsZWF2ZSBkYW5nbGluZyBwb2ludGVycyAoc3VjaCBhcyBjaG4tPnUuaW50
ZXJkb21haW4ucmVtb3RlX2RvbWFpbikgYXMgZXZ0Y2huX2Nsb3NlKCkgaXMgYWxzbyB1c2VkIHdo
aWxlIGRlc3Ryb3lpbmcgdGhlIGRvbWFpbi4NCg0KTGV0IG1lIGhhdmUgYSBsb29rIGFnYWluIGlm
IHdlIGhhdmUgdG8gZG8gdGhlIGNsZWFudXAgd2hlbiB3ZSBkZXN0cm95IHRoZSBndWVzdCBhbmQg
Y2xvc2UgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsLg0KPiANCj4gQWxzbywgQUZBSUNUIFhlbiB3
aWxsIHJldHVybiAwIChpLmUuIHN1Y2Nlc3MpIHRvIHRoZSBjYWxsZXIuIEkgdGhpbmsgdGhpcyBp
cyBhIG1pc3Rha2UgYmVjYXVzZSB3ZSBkaWRuJ3QgY2xvc2UgdGhlIHBvcnQgYXMgcmVxdWVzdGVk
Lg0KDQpJZiB3ZSByZXR1cm4gbm9uLXplcm8gdG8gZ3Vlc3QgKGluIHBhcnRpY3VsYXIgaWYgbGlu
dXggZ3Vlc3QpLCBMaW51eCB3aWxsIHJlcG9ydCB0aGUgQlVHKCkuIFRoZXJlZm9yZSBJIGRlY2lk
ZWQgdG8gcmV0dXJuIDAuIA0KDQppZiAoSFlQRVJWSVNPUl9ldmVudF9jaGFubmVsX29wKEVWVENI
Tk9QX2Nsb3NlLCAmY2xvc2UpICE9IDApICAgICAgICAgICAgICAgDQogICAgICAgIEJVRygpOw0K
DQpSZWdhcmRzLA0KUmFodWwNCg0K

