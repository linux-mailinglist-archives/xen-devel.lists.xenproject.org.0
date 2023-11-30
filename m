Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE6D7FE686
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 03:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644342.1005177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8WX3-0005As-5A; Thu, 30 Nov 2023 02:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644342.1005177; Thu, 30 Nov 2023 02:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8WX3-00059D-0t; Thu, 30 Nov 2023 02:12:01 +0000
Received: by outflank-mailman (input) for mailman id 644342;
 Thu, 30 Nov 2023 02:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Gnx=HL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r8WX1-000594-ET
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 02:11:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d51f57f9-8f25-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 03:11:57 +0100 (CET)
Received: from AS9PR06CA0057.eurprd06.prod.outlook.com (2603:10a6:20b:463::33)
 by VI1PR08MB5408.eurprd08.prod.outlook.com (2603:10a6:803:130::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 02:11:41 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:463:cafe::24) by AS9PR06CA0057.outlook.office365.com
 (2603:10a6:20b:463::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24 via Frontend
 Transport; Thu, 30 Nov 2023 02:11:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 02:11:41 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Thu, 30 Nov 2023 02:11:40 +0000
Received: from f7db70a597d7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3E0A5DE-F577-4C53-B264-C1011EE40F73.1; 
 Thu, 30 Nov 2023 02:11:30 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7db70a597d7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Nov 2023 02:11:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9967.eurprd08.prod.outlook.com (2603:10a6:102:358::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Thu, 30 Nov
 2023 02:11:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 02:11:25 +0000
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
X-Inumbo-ID: d51f57f9-8f25-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eBVghb3t89V0JWaqsoRO9e2kN0CgND0gBCXhxreAh4e9NRW49omRYT04VpnaxDxzRhj1QKGLL0WchcVfQ7JkpVkwJBT9qnS0DUHoGzo6Zl7mL2zK+Qt88LN3OT8HYmVZC8HsfCB7LOm5KEcCPn4pD1b0A/DauWECxTW+Pv1V9hqNVqvrNgzpL37rnniJlioIDfC4uWPFsT+8HCnsgElZ2EaMGTYg/Cm33+2It2DVSSZoZxzkwXjbNi0prGw724iyEdgd7rTuY7OwLFPC/Z227csaqwF/986eayolGZEt8HVcJ0ta9iPhK6Zs7eroWqPkLhe79+oxwUreK+QiltaAAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XdcFDOyfWb9qYT+VcCm5sZ4OOaYVGFt2gqLmxCnBNg=;
 b=fHd2wtLFB9zLl112Y9ARE3laqSsJY7NclJxMYgr7AcL+kZtYtcMRx76UXiVh80DDjXTSMKHwV1rNsJg1r5+5zmbBSJK5tYBa28wy0AD+A2z+u8MNTYBlpBadsjT5xHPkL+RcKgNIB9dKvjvPSTH2dTB30hYVEyHSxPyggAc7Zmq416C7pKjvBlM2mJ7Vo2idfQ96NHGYZ1pkjikKCr32klQ3tlCovhf+TbboctqYwYz/XN82M6HXRyj7j718RLRLnsJIBzdImMNdPlk9wtjkfUXv10t8+vFQiDmjLXf1jg4TTBsQ0VpMr/On4e+WxlLfzbEBTKagcH+gJKfKW7/Jvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XdcFDOyfWb9qYT+VcCm5sZ4OOaYVGFt2gqLmxCnBNg=;
 b=N9kdmQa2C/RwqTn5ZHRS38MM17wudj+MhE4/U/dCZrCak3BHG2CQlDq7uVy0Y1k+NWIa+w1sUZkagdou82v+fk1I+S6ipi3ZiGcqrfnBXv+MWvyHrh7BIL09RdeWV/tgHXh8QsF5wggrqhCbleeMqVmSOG1iMnvkCYrYIg7Wrss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f68f68a701547a8a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ksj1PwstsX4P6cyuFzDocbRQwr0nAsFRAm7kCbMqquaYnSNubvMUJgFXjFQ0mK/ChKgAnskxZzM+eUj1oar722yS0Ujn2yComie615u2eU/ASkHuo4WDgXuC6dfwqXTjP/sonr3Lwh1aqn1M4jUq0ZGhjGwDKfJob88neSGboKFSASc5X72GjR/62ZmNdwXj4L89pOKlczJRxJTQBxfJDCkQB7Jjr3Mf2V+//MX+KeFxuNrvChc2uXhr3T8vo1vFCI9H8KWjqyY1WrYs/HpIb70F2TxuoiHFraKVA0ssyor7fC24SxupBniSjqfkHQM4vbKzR65Ez3U3yE4Ln9SRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XdcFDOyfWb9qYT+VcCm5sZ4OOaYVGFt2gqLmxCnBNg=;
 b=TvoVkzUThGAB2NWPOi0mDIrqyCmNYj7LIBl79ToeTgJSP7/Rl3OTM3IPcsYVKIY3jDRpojX4qC6r1b2LsBIwxThks8V816Ky0b24VWZUUb3Qhy1vO8h+gsDn1fGa4jByu9UYe+TGk7RMhYypmhQ1cMDTZxScg9/4+4Oh9ThxFNa4bRSydY7atvjq0yugiz8jOFC/nVWtJHecMsoaBe3kS/gDaOxYfk6lGzRn1/glDTd1iT57ZvpOmX8aELOoAUp/JaEinD31bLJGjXUtj8DyCeitW6nsIplj567TWdiSbZehJcaQuLERIukXD6kLBmRPLPiprRBGwSTdLhF2zBaYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XdcFDOyfWb9qYT+VcCm5sZ4OOaYVGFt2gqLmxCnBNg=;
 b=N9kdmQa2C/RwqTn5ZHRS38MM17wudj+MhE4/U/dCZrCak3BHG2CQlDq7uVy0Y1k+NWIa+w1sUZkagdou82v+fk1I+S6ipi3ZiGcqrfnBXv+MWvyHrh7BIL09RdeWV/tgHXh8QsF5wggrqhCbleeMqVmSOG1iMnvkCYrYIg7Wrss=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	Community Manager <community.manager@xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH v6 00/17] Device tree based NUMA support for Arm
Thread-Topic: [PATCH v6 00/17] Device tree based NUMA support for Arm
Thread-Index: AQHaG1z6r237lUq/IkaG31+XYPo6A7CSHAqAgAASOQA=
Date: Thu, 30 Nov 2023 02:11:25 +0000
Message-ID: <401761BE-0499-4F18-A93F-B6E8F6E9A48D@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2311291657520.3533093@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2311291657520.3533093@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9967:EE_|AM1PEPF000252E0:EE_|VI1PR08MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eda8360-3e02-48ee-e7be-08dbf149b154
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4g6KFK8F0KY0wjndqDbixT89v7/9Yp4/FivaZ8upkS1eMiarmYoXPgikJ5u/TehzDO+GgCzdBiEZnU60i0qGSHtuFgtgYipkNrJuVJgsHynxGiym/pfcJ2/wa+mDfEEb2rPAL5z4tpytzn00IudiJWzEoKlKSjVzaZ9VCJMQKxWGOJJk/37R5cvDB2mD5iIICtHKTfOmBvQl3Zia35XG9jJuHYOC1T1xvw/EAfgrBY/+BnWAtvzQ2r9ERTRsHtLLgVdGp/EcKb9u2oPnAnaMIO8vRaAIyS4g/S/7LQ7ayVVcQj11s0Wndb1ZNYra00alwwVOhZS2iippvSUBTrJlzLx94j7+7z3t5FTlilE0YiPIzbUHN2QdM9dPrFlG0OjUmCKk5587rnjkRJvtV+1anLpusI6QSeNq8tL79GsKu+tCdwxNVJDXe3Mi8Gh4K4owkeT0/nzuhzSmekNoDSVT7rppmxm8s54o3fzVxoRTrk0tAJV4NZKVhb3Q0/UPc/H3dO5AMmgR5gPeR96drPqvUOHIxjlGJ2HNZXOVoIVRQXlGVMTpOjo4v+E5i9XwEk21DV/w6hEJXPnDRdRZsTXfdJ2Q5NnIAB7YGQuTzIKMsWvWRxsVRuejWcgpMNXlbGZCDc2eLyRDQdGvKxE+QChd4s+pRbQfniU/YlqNrOWU/Vrqei4HigZrPwqYxa28GhICEhWVg9D9IjnENZoK37gKFblS2N/Fuw4fHtL0jxgrJ70=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(202311291699003)(122000001)(478600001)(26005)(53546011)(6512007)(6506007)(2616005)(71200400001)(38100700002)(38070700009)(36756003)(86362001)(33656002)(4326008)(41300700001)(66946007)(7416002)(8936002)(5660300002)(76116006)(2906002)(83380400001)(316002)(966005)(64756008)(91956017)(54906003)(6916009)(6486002)(66476007)(66446008)(66556008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9187764BA0FBAA4BA8302652C3D13AFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9967
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	695c3869-e7d0-4bfe-ecc8-08dbf149a7c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fmVy25fY9+W+z87dgHFQqaLKVqw461OvuhjCfVOv9tnrX+Z7klG8UFyAIVLx+vd0X5X+MoFKEK8XzFfjYSFZCdolYZ7578RfEc4lMG+UGu75gTFjR8Ko4q8fsE031eM1n7ZIadPQK0lLlkZqran4OfCb1sKWZhieAaokmEDiUjuBu6isJ47P7x5VPykl0jngrUEaQ+CxFQqy1qk5z9EmOXn1a94jD3YB2Eie1wK1bIajF+qoSI0jBXCa+O17laZLOuAoizikNrHnNbAumUJNSg9GSwECh/51uvqxSbd8mCLNyX1s6EW/akK8ZIhGDJtj/c86KOH/AUySqpCt3stONraxtTLrR4744k+KYnFdACTAqfqATJD12UxxSI2UiGq9n1S+twA9dYtfmGrB/Me/LUZ7UrrSnolGaufkHTrnh9H950hwqwG/z6SvZO3d9WO7nRg44R18ItC17cCy4PUZ9WEeMUIUeWpVcviui1gke8deTaWmAMtl4Ua5JXS5Qz8Pq9zXBNPPpzHJ/bGjHC2We0Si4FCwT6+UxE8G12zHwEi3AwuFW/kici/bNrCdXf8RHOHv4+8Y3RflCZ9rAiiNorawbkVCc5NyTzZC8WVwsFkCOM6WIS79kvlNAERblIApvl0ZqSO41G+3bPilwoYaDwlNSjpTV/Yz433nNHTs49/uPxe5HxTS/+ybhph0ngCA+ZcrwukLvRd2hgU1LfQuri8+hwT6crU8DJSM9+gKqJgVF9yQ5NBhK1XxN3Ur3RmR2O8atYb/AeHOFRq/v6dt1ZMs1CLlSY/onbBeyQBn0lxPQdIeG3fKFACp2r4JfMaH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(346002)(376002)(396003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(336012)(26005)(83380400001)(478600001)(6486002)(966005)(202311291699003)(2616005)(6512007)(6506007)(53546011)(40480700001)(4326008)(6862004)(316002)(8676002)(54906003)(70586007)(70206006)(8936002)(86362001)(36860700001)(47076005)(81166007)(82740400003)(356005)(5660300002)(40460700003)(33656002)(41300700001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:11:41.2470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eda8360-3e02-48ee-e7be-08dbf149b154
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5408

SGkgU3RlZmFubywNCg0KVGhhbmtzIGZvciB0aGUgZW1haWwhDQoNCj4gT24gTm92IDMwLCAyMDIz
LCBhdCAwOTowNiwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3
cm90ZToNCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4gVGhhbmsgeW91IGZvciBhbGwgeW91ciB3b3Jr
IG9uIHRoaXMgc2VyaWVzIGFuZCBpbiBnZW5lcmFsIHVwc3RyZWFtaW5nDQo+IG90aGVyIHBhdGNo
ZXMgdG9vIQ0KDQpJdOKAmXMgb3VyIHBsZWFzdXJlLg0KDQo+IEhvdyBkbyB3ZSB0ZXN0IGl0PyBJ
cyB0aGVyZSBhIHdheSB0byB0ZXN0IHRoaXMgc2VyaWVzIHdpdGggUUVNVSBhbmQgc29tZQ0KPiBz
cGVjaWFsIGRldmljZSB0cmVlPyBJIGFtIGFza2luZyBiZWNhdXNlIGR1cmluZyByZXZpZXcgaXQg
d291bGQgbWFrZQ0KPiB0aGluZ3MgZWFzaWVyIGlmIHdlIGNvdWxkIGV4ZXJjaXNlIHRoZSBuZXcg
Y29kZSBzb21laG93Lg0KDQpFbW1tLCBsZXQgbWUgYWRkIHNvbWUgZGV0YWlscy4gSSB0ZXN0ZWQg
dGhlIGNvZGUgdXNpbmcgRlZQLiBGcm9tIG15DQp1bmRlcnN0YW5kaW5nLCB5b3Ugb25seSBuZWVk
IHRvIHR3ZWFrIHRoZSBkZXZpY2UgdHJlZSBmb3IgdGhlIG1lbW9yeSwNCmNwdXMgbm9kZSBhbmQg
YWRkIGEgImRpc3RhbmNlLW1hcOKAnSBub2RlIGZvbGxvd2luZyB0aGUgZGV2aWNlIHRyZWUgYmlu
ZGluZyBbMV0uDQoNCkJ1dCBJIHVuZGVyc3RhbmQgeW91ciBwYWluIG9mIGxhY2tpbmcgdGhlIEZW
UCB0byBwbGF5IHdpdGggdGhlIGNvZGUgKHNhbWUNCmZvciB0aGUgUjgyIHN1cHBvcnQpLiBGb3Ig
dGhlc2UsIHdl4oCZdmUgY2hlY2tlZCBpbnRlcm5hbGx5IHdpdGggdGhlIGxlZ2FsIGV4cGVydHMN
CmFib3V0IHRoZSBwb3NzaWJpbGl0eSB0byBpbmNsdWRlIHRoZSBGVlAgaW4gdGhlIHVwc3RyZWFt
4oCZcyBHaXRMYWIgQ0kgY29udGFpbmVycw0Kd2l0aG91dCB0cmlnZ2VyaW5nIHRoZSByZWRpc3Ry
aWJ1dGlvbiBpc3N1ZS4gSXQgc2VlbSB0aGF0ICBub3cgYWxsIHRoZSBGVlBzDQpyZWZlcmVuY2Vk
IG9uIFsyXSwgaW5jbHVkaW5nIGJvdGggdGhlIOKAnEZWUF9CYXNlX1JldkMtMnhBRU12QeKAnSBh
bmQgdGhlDQrigJxGVlBfQmFzZVJfQUVNdjhS4oCdLCBhcmUgbGljZW5zZWQgdW5kZXIgbGlnaHR3
ZWlnaHQgRWNvIFN5c3RlbSBFVUxBDQp0aGF0IGhhcyBubyByZXN0cmljdGlvbnMgb24gdGhlIHJl
ZGlzdHJpYnV0aW9uLiBUaGVyZWZvcmUgSSB0aGluayBub3cgd2UgYXJlIHNhZmUgdG8NCnBhY2sg
dGhlbSBpbiB0aGUgdXBzdHJlYW3igJlzIGNvbnRhaW5lcnMgYW5kIHVzZSBpdCBmb3IgdGhlIEdp
dExhYiBDSSB0ZXN0aW5nLg0KDQpJIHRoaW5rIHdlIGNhbiBhZGQgYSBHaXRMYWIgQ0kgam9iIHRv
IHRlc3QgTlVNQSAoYW5kIGZ1dHVyZSBBcm0gZmVhdHVyZXMpLCBpdCBpcw0KanVzdCB3ZSBuZWVk
IHRvIGRlc2lnbiBhbmQgZG8gYSBleHRlbmRhYmxlIGZyYW1ld29yayBmb3IgaXQuIEkgY2FuIHdv
cmsgb24gaXQNCmluIHRoZSBuZXh0IHZlcnNpb24gb2YgdGhlIE5VTUEgc2VyaWVzLiBXaGF0IGRv
IHlvdSB0aGluaz8NCg0KPiBJIGhhdmVuJ3QgaGFkIGEgY2hhbmNlIHRvIHJldmlldyB0aGlzIHBy
b3Blcmx5IGJ1dCBJIG5vdGljZWQgdGhhdCBhIGZldw0KPiBjb2RlIGFkZGl0aW9ucyBhcmUgbm90
IHByb3RlY3RlZCBieSBDT05GSUdfTlVNQS4gTWF5YmUgdGhleSBzaG91bGQ/DQoNCkkgdGhpbmsg
eW91IGFyZSByZWZlcnJpbmcgdG8gdGhlIGNvZGUgaW4geGVuL2FyY2gvYXJtL3NldHVwLmMgY29y
cmVjdD8gVGhlc2UNCnBhcnRzIG9mIHRoZSBjb2RlIGlzIGRlc2lnbmVkIHRvIHdvcmsgZm9yIGJv
dGggTlVNQSBhbmQgbm9uLU5VTUEgc2V0dXBzDQooc2VlIHRoZSBpbi1jb2RlIGNvbW1lbnQgb24g
dG9wIG9mIHRoZW0pLiBBbmQgYWN0dWFsbHksIHRoZSBmdW5jdGlvbg0KbnVtYV9zZXRfY3B1X2Nv
cmVfbWFzaygpIHNob3VsZCBub3QgYmUgcHJvdGVjdGVkIGJ5IENPTkZJR19OVU1BLA0KYXMgaXQg
aXMgZml4aW5nIGFuIGFjdHVhbCAiYnVnIiBkZXNjcmliZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
IG9mIHRoZSBwYXRjaCAjMTUuDQoNCj4gQWxzbyBnaXZlbiB0aGF0IHRoaXMgaXMgbm90IGEgc21h
bGwgc2VyaWVzLCBJIHdhbnRlZCB0byBjaGVjayB3aXRoIHlvdQ0KPiBpZiB0aGlzIGlzIGEgZ29v
ZCB0aW1lIHRvIGRvIGEgZnVsbCByZXZpZXcgb2YgdGhlIHNlcmllcyAoaW4gdGhlIHNlbnNlDQo+
IHRoYXQgeW91IGFyZSBPSyB3aXRoIGhhbmRsaW5nIHJldmlldyBmZWVkYmFjayBub3cpIG9yIHdo
ZXRoZXIgeW91IHdvdWxkDQo+IHJhdGhlciBoYXZlIHVzIGRvIHRoZSByZXZpZXcgYXQgYW5vdGhl
ciB0aW1lLg0KDQpUaGFua3MgZm9yIGJlaW5nIGNvbnNpZGVyYXRlISBJIGhhdmUgYmVlbiBwbGFu
bmVkIGEgdGFzayBhbmQgcmVzZXJ2ZWQgbXkNCmJhbmR3aWR0aCBpbnRlcm5hbGx5IHRvIHdvcmsg
b24gdGhlIHVwc3RyZWFtIG9mIHRoaXMgc2VyaWVzLiBBbHNvIHBlcnNvbmFsbHkgSQ0KcHJpb3Jp
dGl6ZSB0aGUgdXBzdHJlYW3igJlzIGNvbW1lbnQvZmVlZGJhY2sgaW4gbXkgd29ya2luZyBzY2hl
ZHVsZS4gU28gSSB0aGluayBJDQp3aWxsIGhhbmRsZSB0aGUgcmV2aWV3IGZlZWRiYWNrIGluIHRp
bWUsIGRvbuKAmXQgd29ycnkgOikNCg0KWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udW1hLnR4dA0KWzJdIGh0dHBzOi8vZGV2
ZWxvcGVyLmFybS5jb20vVG9vbHMlMjBhbmQlMjBTb2Z0d2FyZS9GaXhlZCUyMFZpcnR1YWwlMjBQ
bGF0Zm9ybXMNCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4g
U3RlZmFubw0KPiANCj4gDQo+IE9uIE1vbiwgMjAgTm92IDIwMjMsIEhlbnJ5IFdhbmcgd3JvdGU6
DQo+PiBUaGUgcHJlcGFyYXRpb24gd29yayB0byBzdXBwb3J0IE5VTUEgb24gQXJtIGhhcyBiZWVu
IG1lcmdlZA0KPj4gYW5kIGNhbiBiZSBmb3VuZCBhdCBbMV0gYW5kIFsyXS4gVGhlIGluaXRpYWwg
ZGlzY3Vzc2lvbnMgb2YNCj4+IHRoZSBBcm0gTlVNQSBzdXBwb3J0IGNhbiBiZSBmb3VuZCBhdCBb
M10uDQo+PiANCj4+IC0gQmFja2dyb3VuZCBvZiB0aGlzIHNlcmllczoNCj4+IA0KPj4gWGVuIG1l
bW9yeSBhbGxvY2F0aW9uIGFuZCBzY2hlZHVsZXIgbW9kdWxlcyBhcmUgTlVNQSBhd2FyZS4NCj4+
IEJ1dCBhY3R1YWxseSwgb24geDg2IGhhcyBpbXBsZW1lbnRlZCB0aGUgYXJjaGl0ZWN0dXJlIEFQ
SXMNCj4+IHRvIHN1cHBvcnQgTlVNQS4gQXJtIHdhcyBwcm92aWRpbmcgYSBzZXQgb2YgZmFrZSBh
cmNoaXRlY3R1cmUNCj4+IEFQSXMgdG8gbWFrZSBpdCBjb21wYXRpYmxlIHdpdGggTlVNQSBhd2Fy
ZWQgbWVtb3J5IGFsbG9jYXRpb24NCj4+IGFuZCBzY2hlZHVsZXIuDQo+PiANCj4+IEFybSBzeXN0
ZW0gd2FzIHdvcmtpbmcgd2VsbCBhcyBhIHNpbmdsZSBub2RlIE5VTUEgc3lzdGVtIHdpdGgNCj4+
IHRoZXNlIGZha2UgQVBJcywgYmVjYXVzZSB3ZSBkaWRuJ3QgaGF2ZSBtdWx0aXBsZSBub2RlcyBO
VU1BDQo+PiBzeXN0ZW0gb24gQXJtLiBCdXQgaW4gcmVjZW50IHllYXJzLCBtb3JlIGFuZCBtb3Jl
IEFybSBkZXZpY2VzDQo+PiBzdXBwb3J0IG11bHRpcGxlIG5vZGVzIE5VTUEgc3lzdGVtLg0KPj4g
DQo+PiBTbyBub3cgd2UgaGF2ZSBhIG5ldyBwcm9ibGVtLiBXaGVuIFhlbiBpcyBydW5uaW5nIG9u
IHRoZXNlIEFybQ0KPj4gZGV2aWNlcywgWGVuIHN0aWxsIHRyZWF0IHRoZW0gYXMgc2luZ2xlIG5v
ZGUgU01QIHN5c3RlbXMuIFRoZQ0KPj4gTlVNQSBhZmZpbml0eSBjYXBhYmlsaXR5IG9mIFhlbiBt
ZW1vcnkgYWxsb2NhdGlvbiBhbmQgc2NoZWR1bGVyDQo+PiBiZWNvbWVzIG1lYW5pbmdsZXNzLiBC
ZWNhdXNlIHRoZXkgcmVseSBvbiBpbnB1dCBkYXRhIHRoYXQgZG9lcw0KPj4gbm90IHJlZmxlY3Qg
cmVhbCBOVU1BIGxheW91dC4NCj4+IA0KPj4gWGVuIHN0aWxsIHRoaW5rIHRoZSBhY2Nlc3MgdGlt
ZSBmb3IgYWxsIG9mIHRoZSBtZW1vcnkgaXMgdGhlDQo+PiBzYW1lIGZvciBhbGwgQ1BVcy4gSG93
ZXZlciwgWGVuIG1heSBhbGxvY2F0ZSBtZW1vcnkgdG8gYSBWTQ0KPj4gZnJvbSBkaWZmZXJlbnQg
TlVNQSBub2RlcyB3aXRoIGRpZmZlcmVudCBhY2Nlc3Mgc3BlZWRzLiBUaGlzDQo+PiBkaWZmZXJl
bmNlIGNhbiBiZSBhbXBsaWZpZWQgaW4gd29ya2xvYWRzIGluc2lkZSBWTSwgY2F1c2luZw0KPj4g
cGVyZm9ybWFuY2UgaW5zdGFiaWxpdHkgYW5kIHRpbWVvdXRzLg0KPj4gDQo+PiBTbyBpbiB0aGlz
IHBhdGNoIHNlcmllcywgd2UgaW1wbGVtZW50IGEgc2V0IG9mIE5VTUEgQVBJIHRvIHVzZQ0KPj4g
ZGV2aWNlIHRyZWUgdG8gZGVzY3JpYmUgdGhlIE5VTUEgbGF5b3V0LiBXZSByZXVzZSBtb3N0IG9m
IHRoZQ0KPj4gY29kZSBvZiB4ODYgTlVNQSB0byBjcmVhdGUgYW5kIG1haW50YWluIHRoZSBtYXBw
aW5nIGJldHdlZW4NCj4+IG1lbW9yeSBhbmQgQ1BVLCBjcmVhdGUgdGhlIG1hdHJpeCBiZXR3ZWVu
IGFueSB0d28gTlVNQSBub2Rlcy4NCj4+IEV4Y2VwdCBBQ1BJIGFuZCBzb21lIHg4NiBzcGVjaWZp
ZWQgY29kZSwgd2UgaGF2ZSBtb3ZlZCBvdGhlcg0KPj4gY29kZSB0byBjb21tb24uIEluIG5leHQg
c3RhZ2UsIHdoZW4gd2UgaW1wbGVtZW50IEFDUEkgYmFzZWQNCj4+IE5VTUEgZm9yIEFybTY0LCB3
ZSBtYXkgbW92ZSB0aGUgQUNQSSBOVU1BIGNvZGUgdG8gY29tbW9uIHRvbywNCj4+IGJ1dCBpbiBj
dXJyZW50IHN0YWdlLCB3ZSBrZWVwIGl0IGFzIHg4NiBvbmx5Lg0KPj4gDQo+PiBUaGlzIHBhdGNo
IHNlcmlyZXMgaGFzIGJlZW4gdGVzdGVkIGFuZCBib290ZWQgd2VsbCBvbiBGVlAgaW4NCj4+IEFy
bTY0IG1vZGUgd2l0aCBOVU1BIGNvbmZpZ3MgaW4gZGV2aWNlIHRyZWUgYW5kIG9uZSBIUEUgeDg2
DQo+PiBOVU1BIG1hY2hpbmUuDQo+PiANCj4+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjItMDYvbXNnMDA0OTkuaHRtbA0KPj4gWzJd
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAy
Mi0xMS9tc2cwMTA0My5odG1sDQo+PiBbM10gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIxLTA5L21zZzAxOTAzLmh0bWwNCj4+IA0KPj4gSGVu
cnkgV2FuZyAoMSk6DQo+PiAgeGVuL2FybTogU2V0IGNvcnJlY3QgcGVyLWNwdSBjcHVfY29yZV9t
YXNrDQo+PiANCj4+IFdlaSBDaGVuICgxNik6DQo+PiAgeGVuL2FybTogdXNlIE5SX01FTV9CQU5L
UyB0byBvdmVycmlkZSBkZWZhdWx0IE5SX05PREVfTUVNQkxLUw0KPj4gIHhlbi9hcm06IGltcGxl
bWVudCBoZWxwZXJzIHRvIGdldCBhbmQgdXBkYXRlIE5VTUEgc3RhdHVzDQo+PiAgeGVuL2FybTog
aW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3IgQXJtDQo+PiAgeGVuL2FybTogdXNl
IGFyY2hfZ2V0X3JhbV9yYW5nZSB0byBnZXQgbWVtb3J5IHJhbmdlcyBmcm9tIGJvb3RpbmZvDQo+
PiAgeGVuL2FybTogYnVpbGQgTlVNQSBjcHVfdG9fbm9kZSBtYXAgaW4gZHRfc21wX2luaXRfY3B1
cw0KPj4gIHhlbi9hcm06IEFkZCBib290IGFuZCBzZWNvbmRhcnkgQ1BVIHRvIE5VTUEgc3lzdGVt
DQo+PiAgeGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZSB0cmVlIHBy
b2Nlc3NvciBub2RlDQo+PiAgeGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRl
dmljZSB0cmVlIG1lbW9yeSBub2RlDQo+PiAgeGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRv
IHBhcnNlIGRldmljZSB0cmVlIE5VTUEgZGlzdGFuY2UgbWFwDQo+PiAgeGVuL2FybTogdW5pZmll
ZCBlbnRyeSB0byBwYXJzZSBhbGwgTlVNQSBkYXRhIGZyb20gZGV2aWNlIHRyZWUNCj4+ICB4ZW4v
YXJtOiBrZWVwIGd1ZXN0IHN0aWxsIGJlIE5VTUEgdW53YXJlDQo+PiAgeGVuL2FybTogZW5hYmxl
IGRldmljZSB0cmVlIGJhc2VkIE5VTUEgaW4gc3lzdGVtIGluaXQNCj4+ICB4ZW4vYXJtOiBpbXBs
ZW1lbnQgbnVtYV9ub2RlX3RvX2FyY2hfbmlkIGZvciBkZXZpY2UgdHJlZSBOVU1BDQo+PiAgeGVu
L2FybTogdXNlIENPTkZJR19OVU1BIHRvIGdhdGUgbm9kZV9vbmxpbmVfbWFwIGluIHNtcGJvb3QN
Cj4+ICB4ZW4vYXJtOiBQcm92aWRlIEtjb25maWcgb3B0aW9ucyBmb3IgQXJtIHRvIGVuYWJsZSBO
VU1BDQo+PiAgZG9jczogdXBkYXRlIG51bWEgY29tbWFuZCBsaW5lIHRvIHN1cHBvcnQgQXJtDQo+
PiANCj4+IENIQU5HRUxPRy5tZCAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+PiBTVVBQ
T1JULm1kICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPj4gZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jIHwgICAyICstDQo+PiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAg
ICAgICAgICAgfCAgMTEgKysNCj4+IHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAgICAgICB8
ICAgMiArDQo+PiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICAgICAgfCAgIDYgKw0KPj4g
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL251bWEuaCAgIHwgIDkxICsrKysrKysrLQ0KPj4geGVu
L2FyY2gvYXJtL251bWEtZHQuYyAgICAgICAgICAgIHwgMjk5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPj4geGVuL2FyY2gvYXJtL251bWEuYyAgICAgICAgICAgICAgIHwgMTg0ICsr
KysrKysrKysrKysrKysrKw0KPj4geGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgIHwg
IDE3ICsrDQo+PiB4ZW4vYXJjaC9hcm0vc21wYm9vdC5jICAgICAgICAgICAgfCAgMzggKysrKw0K
Pj4geGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL251bWEuaCAgIHwgICAxIC0NCj4+IHhlbi9hcmNo
L3g4Ni9zcmF0LmMgICAgICAgICAgICAgICB8ICAgMiArLQ0KPj4geGVuL2luY2x1ZGUveGVuL251
bWEuaCAgICAgICAgICAgIHwgIDEwICsNCj4+IDE0IGZpbGVzIGNoYW5nZWQsIDY2MSBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2Fy
bS9udW1hLWR0LmMNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vbnVtYS5jDQo+
PiANCj4+IC0tIA0KPj4gMi4yNS4xDQo+PiANCg0K

