Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A743BBB96
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150087.277561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0MEl-0003Al-94; Mon, 05 Jul 2021 10:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150087.277561; Mon, 05 Jul 2021 10:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0MEl-00038u-49; Mon, 05 Jul 2021 10:54:03 +0000
Received: by outflank-mailman (input) for mailman id 150087;
 Mon, 05 Jul 2021 10:54:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5nam=L5=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m0MEj-00038l-2A
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:54:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.76]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d73b6ca-dd7f-11eb-8443-12813bfff9fa;
 Mon, 05 Jul 2021 10:53:59 +0000 (UTC)
Received: from DB6PR0301CA0047.eurprd03.prod.outlook.com (2603:10a6:4:54::15)
 by AM0PR08MB5379.eurprd08.prod.outlook.com (2603:10a6:208:182::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 10:53:57 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::99) by DB6PR0301CA0047.outlook.office365.com
 (2603:10a6:4:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.30 via Frontend
 Transport; Mon, 5 Jul 2021 10:53:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 10:53:57 +0000
Received: ("Tessian outbound c836dc7aad98:v97");
 Mon, 05 Jul 2021 10:53:57 +0000
Received: from b2bb8182882d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A201E4F7-8D6C-4B6C-B8AD-CCA53AF65E40.1; 
 Mon, 05 Jul 2021 10:53:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2bb8182882d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 10:53:31 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB5885.eurprd08.prod.outlook.com (2603:10a6:102:e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 5 Jul
 2021 10:53:30 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 10:53:30 +0000
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
X-Inumbo-ID: 4d73b6ca-dd7f-11eb-8443-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkcsiJcP6F56XnhvPG/wsuNtb6bp6G9uGerpnhBC/Fo=;
 b=DLEI/R/XNWstmfw63jxaj72witILXBsCz6/J3BLTCwRhpIeeUsGH05e56dF2pSqOY1DlxXTwSlJQX4hUjzjaab7nf+H2JgrZ9VscQFaFTr4EOv4gi/Q9KtJYsYWRcxKHl5rlaijIfycQ+BZWJHhhTRw7C2jL5rPbS2Q4574B8bw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a701badbc3a8e21
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwBQOilq8RLXfby6JXkBkrWvhdRvf13K4zs/29IDJrzEiy7isPS5AH19luLly6a8BPRY0+7XWLDqFo2iZ+uxVtt9mV+RoMN+Gx0/95wGbji4RZD/jYjLDAUGVlqzg50W2izxTvf7hXYdf3VVbdKb+eLKWqCzDjUSk0uZj1inoASX0jFNGkl5K4uZhf9z/auLpsqjmaR9z+/dkOI3AeEOL9W/As9Sv65dpmHbaBvnSIj1DFWKLuPH5k/yipmKSPPn5h5rREcKygIo56lndd7MfE30VN+XJ1z67U/ZfIxauWlZ75cu4teVKbPg7YtQ7/sknneRZCtKFtqqCxaNaMvdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkcsiJcP6F56XnhvPG/wsuNtb6bp6G9uGerpnhBC/Fo=;
 b=CrpNsbvtPzmF3e2nlHQD/QWNUaT6uw8ZYihR2OF494V0rUK9rp9XG+dm88izp0EpfcfCS/I2BVWG6hUQpuoqSZdQAVk6PbIG0TD3LvvZSfqKdFjdVAKTWmW692szYavQb8MKkhgQX8xaPyBMAdbdKXjdIY1Jxl72WAFXUW+F/OmBUuegh3jLKzhNH/huOHEh7Igj/W3X2ea2tFhQJZ2PIYCLpfGyn0HA/PeVVBjzE7LJ5rmqsg4u2c+XHLBh+ueIduqABf5kjUbjiWrvLOZWjQDdfBAOytv6DQ0p7uBvs4VucyzIQ0qErupfPMN82TNVXvZhjuHCiA5zt+LuQhaZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkcsiJcP6F56XnhvPG/wsuNtb6bp6G9uGerpnhBC/Fo=;
 b=DLEI/R/XNWstmfw63jxaj72witILXBsCz6/J3BLTCwRhpIeeUsGH05e56dF2pSqOY1DlxXTwSlJQX4hUjzjaab7nf+H2JgrZ9VscQFaFTr4EOv4gi/Q9KtJYsYWRcxKHl5rlaijIfycQ+BZWJHhhTRw7C2jL5rPbS2Q4574B8bw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH v4] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
Thread-Topic: [PATCH v4] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
Thread-Index: AQHXcWiahpKBxAk9M0KFlQxmBieLeqs0NScA
Date: Mon, 5 Jul 2021 10:53:30 +0000
Message-ID: <25CEAEF8-F0B3-4950-9465-9D1896C8266E@arm.com>
References: <20210705063952.25629-1-michal.orzel@arm.com>
In-Reply-To: <20210705063952.25629-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.121]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 70481a3f-9a80-4a4c-560c-08d93fa3304c
x-ms-traffictypediagnostic: PA4PR08MB5885:|AM0PR08MB5379:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5379C9854EE878EF3167CE289D1C9@AM0PR08MB5379.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:529;OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xFLtQ2tTmCh4ZGiJn/DE4OcLkzYLZVMsKnC5dFJ8KXGtHf82aaM+L7EdIX1zNxFI4t/agcakbI0VTkXwdFpnoGtNbGc77UonpnrQEFMcdlolzV41NeTyv3yRDw8u3dhEacxFCP21WbhaH9/LxfkupcGJmMncZLCQMh3+7xp0q2S1vfDBJJya1I55iZgQvqZJt4eW9kC+Dha/lKd7aAMEsdWAxG1QHcj3mJu2EEo/Zot5hXy0EYbHUlCuHb8lYxbWMnz3kMuN2TEyeanpIZfwoNHAtojn/iLfxZxC8a9OLWtcLVU0KzAr5m99d/LS8HU4pDUBCDZNA+xkL9p3pEhBGE1i3OHeJuUt88pSNg9McrrGHXszUUxycooq7FdufmW3BcCUKTq09Y7D5lmiI71fBqj3CnvpXNoklVRqpBiGpeLNi76WLf6TgHeWrdKUNB42SeKkJTdApSC57LvjOILSef1iBePBII0hsIc1Et5mQGpjNSBQw8WdLKkG9z7vgTs23dGoJNIMUV9pQM26qt9/D6ZBBqsRptEMDIzEDvhApfLeen8UfwAZrnm+7ZA5+tGGUrXTZfPs4e8GX+7btGJZODy9YYhtco4wdaSXvUkbSMvbZnJKi8F+D7NQJRMdcJvP2y/PYWrT6VH8rTxK6F/60+DHu07axmftJfHydke4aBSUUD9XIhI/Zth3CrCJmMtn/nDt5nnU6nPMFI6zjK/FsQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(122000001)(33656002)(36756003)(6512007)(7416002)(66946007)(6636002)(478600001)(8936002)(6486002)(5660300002)(83380400001)(2906002)(4326008)(6862004)(316002)(86362001)(66446008)(6506007)(71200400001)(2616005)(66556008)(26005)(53546011)(8676002)(54906003)(38100700002)(66476007)(37006003)(64756008)(91956017)(76116006)(186003)(30864003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N97vyftYVlliRprFCkCP7b/Xfm2oYk23MgYc8ZVp7bs3HV1Qawczg4OipwLQ?=
 =?us-ascii?Q?BgB0NlFscnJzHGy1RVkz3V/zyZFXQ/WYb/7yYBJoYM0Q6YCe+x4DGV+Ngku5?=
 =?us-ascii?Q?RwLFdyuAEYh29qeTnvoX3oK+kQTYYA/sxJeAQB75qZZdtDoU073vE5hj7Vgo?=
 =?us-ascii?Q?RzOgPTUobqAAq+iF2HX7GkTHw6eu8CJv1ApyL7ogmT85Wi2HvE4DY8GsxPz1?=
 =?us-ascii?Q?rDUdu8rvmoLCMbDWws/enspelqOL8WffXwyZ0INt8wgSsEE8ESokbRh58uWJ?=
 =?us-ascii?Q?FNCNqgbqSUmaLYAXBgamjPZdLEcrCxob9jqPcIn7mB7K33jt70stlnnW6dn4?=
 =?us-ascii?Q?kGryJTPcfE2bZQ8wz9SXl6tf4MRcncEYPmc5VccniBMlPvYmntaecdHb1NuH?=
 =?us-ascii?Q?5ghDA5zsc3/v34tA681OwooJTG7UdcO/Y87zXENQvIJ7ZXw8SDkVYgWdAbaq?=
 =?us-ascii?Q?zEgL8RxdOXr7273vSoIKSisuY7yfWTdzr6HpltlxlX71luGVRR2zgKkjYbix?=
 =?us-ascii?Q?tRxOEqpGKtbsXODnjPWDvO0F0IJO+hHUjpmgMaegVJwhnNkIx9C54RIy7dmI?=
 =?us-ascii?Q?6Ab4PIGxm4QXoZ5Mu2DifHsrbWiHk9YelDSb1W8RM0a/yd2TrMMoTp0r0rRI?=
 =?us-ascii?Q?iIkEyQRpshW/9McI8pFbXireIyIPjPlF2tRC6Fniojz07F9b5kJ6l4Iq/H68?=
 =?us-ascii?Q?c3uC3lApGGpb57hPqASqvKLBQxiaR6mwscLhyxdG9MKcHiO7+NcN5Fg+5h9l?=
 =?us-ascii?Q?2G1JIgur6goghYsb4LA3Dr6gFqezQmvb5TZk2wAe6zu6n0UtqvViqbWkhpjK?=
 =?us-ascii?Q?yIkYSYpifuxugX8jfzu/rty+v7K8Nh3KNaibv7HQAEtqSBp6mRdl/E136s7w?=
 =?us-ascii?Q?ey0k3g6qgO5f3rm/4XfxSXv0+tKNsAU3+6QUBZUYbF8qCkDBbG9SlAiXe4Gc?=
 =?us-ascii?Q?b1F4QLgwkHnOSUayI9EH+SQmdiPfAm5Kd7eDG29LVRm2xnU0IMD+PkeZYiPw?=
 =?us-ascii?Q?29MFeFvRmIII2DfHMDNtfPocZRj0w7jAE+73UF+4vTjRaj6Y5xM378GuFxnz?=
 =?us-ascii?Q?8fsIuV6CeYzCTW7S77Ze+VoQbb07M2IrpxkGGzGJjYqzH6R3RFkS77pxg0VX?=
 =?us-ascii?Q?9BCIgN2dTqmrDr3L8V21jA+8aU6B7QPKiYsR43Wezkkqd41C8aZdV1gBOt3c?=
 =?us-ascii?Q?5SztWRqcgIrd+mgK0Lw8am55VQMgImwUHEQvzbr9vIG5slak0bsFxn+Fk+my?=
 =?us-ascii?Q?LFOZ5CDd85e/dckt0pVihb2Y/jcmE58LpExGNCG6qr6bW3ritmqX3X3iKRun?=
 =?us-ascii?Q?XWQb8ZhySsyPy8YfXOsL+7+m?=
Content-Type: multipart/alternative;
	boundary="_000_25CEAEF8F0B3495094659D1896C8266Earmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5885
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0387a28-1b91-46b5-4b41-08d93fa32039
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KefQUNq0cvzeD7sSmh0/RMGL9YdGNR0nLfZZpGzTXylSvSswj/81RgxoZ56KN4zKXqeKjs4Spv+PfHfzgP2bqPkipARjKm5KJ7+WnU8GOkIawAkGSszxu8Mr3GMwHZj/CumfFkQFQZxDAXr3i8+Fuw7Ca20Y5BiApEK5NzmlSJ8of/fQ7P0AV84EcnjwUD1g14cPBR4Pv/xsEogkCN8SJ5kMGwyodd8ldAUYSqgzRRSrK7eax8eaQ0JEpVB8VqRYvV32Bk7g+lYT8PtIqgXvBHZz4nTZf9tIWNKR3aLQNuIPBqFdmwO8eH+iMBP0+F0WkiPzE+Ghh07J8ZglBvYB68SbeSq/C3xBwck0U0zeFSV0i5JjJ5lcnMP8K/2JY70kVl2agvFn4YePZtHCG9uqoc1zvgzZDDs9s0AZ8Quf/fM/hvp4gXrmSgN3rY+hi5b+5gO+iEkk5nv+p3WSb2Pdz23teKJzdHzxGShj0eflddvkVsYL0jeWoOJQbzweDsweDf2zl3uVzwS1JMJz9Hx3BUGMLqfk+p4cYExpCiDrkZlAewMQJDG9fxGCTLZvi/zVSWjeTtyyt8MaauPPKb3eWYzdiYI4etSweJGpXjZjBQ14Tig576/+kfGy22mlGl7tpdJRQ6kf3QZt/Nf5qCDEV+g/1PaVUw9dZi3Ef+LKOdkHfWmvVrXFUl+NIHc4vM2x5wc/F3eZX2nQUgk2w9g9nQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966006)(36840700001)(6506007)(81166007)(86362001)(2906002)(47076005)(82740400003)(36756003)(36860700001)(53546011)(30864003)(33656002)(82310400003)(2616005)(107886003)(45080400002)(83380400001)(5660300002)(6512007)(336012)(4326008)(6862004)(54906003)(316002)(356005)(478600001)(37006003)(70586007)(6636002)(186003)(26005)(8936002)(70206006)(8676002)(6486002)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 10:53:57.2084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70481a3f-9a80-4a4c-560c-08d93fa3304c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5379

--_000_25CEAEF8F0B3495094659D1896C8266Earmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On 5 Jul 2021, at 07:39, Michal Orzel <michal.orzel@arm.com<mailto:michal.o=
rzel@arm.com>> wrote:

AArch64 registers are 64bit whereas AArch32 registers
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 registers have upper 32bit reserved
it does not mean that they can't be widen in the future.

Modify type of hsr, cpsr, spsr_el1 to uint64_t.
Previously we relied on the padding after spsr_el1.
As we removed the padding, modify the union to be 64bit so we don't corrupt=
 spsr_fiq.
No need to modify the assembly code because the accesses were based on 64bi=
t
registers as there was a 32bit padding after spsr_el1.

Remove 32bit padding in cpu_user_regs before spsr_fiq
as it is no longer needed due to upper union being 64bit now.
Add 64bit padding in cpu_user_regs before spsr_el1
because the kernel frame should be 16-byte aligned.

Change type of cpsr to uint64_t in the public outside interface
"public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
Increment XEN_DOMCTL_INTERFACE_VERSION.

Change type of cpsr to uint64_t in the public outside interface
"public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.

Signed-off-by: Michal Orzel <michal.orzel@arm.com<mailto:michal.orzel@arm.c=
om>>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>

Cheers
Bertrand

---
Changes since v3:
-Fix comment about padding
-Remove duplicated printk
Changes since v2:
-Remove _res0 members from structures inside hsr union
-Update commit message
-Modify type of cpsr to uint64_t in public/arch-arm.h
-Increment XEN_DOMCTL_INTERFACE_VERSION
Changes since v1:
-Modify type of cpsr, spsr_el1
-Remove ifdefery in hsr union protecting _res0 members
-Fix formatting of printk calls
---
xen/arch/arm/arm64/entry.S            |  4 ++--
xen/arch/arm/arm64/traps.c            |  2 +-
xen/arch/arm/arm64/vsysreg.c          |  3 ++-
xen/arch/arm/domain.c                 |  2 +-
xen/arch/arm/traps.c                  | 28 ++++++++++++++-------------
xen/arch/arm/vcpreg.c                 | 13 +++++++------
xen/include/asm-arm/arm64/processor.h | 11 ++++++-----
xen/include/asm-arm/hsr.h             |  2 +-
xen/include/public/arch-arm.h         |  4 ++--
xen/include/public/domctl.h           |  2 +-
xen/include/public/vm_event.h         |  3 +--
11 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index ab9a65fc14..fc3811ad0a 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -155,7 +155,7 @@
        add     x21, sp, #UREGS_CPSR
        mrs     x22, spsr_el2
        mrs     x23, esr_el2
-        stp     w22, w23, [x21]
+        stp     x22, x23, [x21]

        .endm

@@ -432,7 +432,7 @@ return_from_trap:
        msr     daifset, #IFLAGS___I_ /* Mask interrupts */

        ldr     x21, [sp, #UREGS_PC]            /* load ELR */
-        ldr     w22, [sp, #UREGS_CPSR]          /* load SPSR */
+        ldr     x22, [sp, #UREGS_CPSR]          /* load SPSR */

        pop     x0, x1
        pop     x2, x3
diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
index babfc1d884..9113a15c7a 100644
--- a/xen/arch/arm/arm64/traps.c
+++ b/xen/arch/arm/arm64/traps.c
@@ -36,7 +36,7 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
    union hsr hsr =3D { .bits =3D regs->hsr };

    printk("Bad mode in %s handler detected\n", handler[reason]);
-    printk("ESR=3D0x%08"PRIx32":  EC=3D%"PRIx32", IL=3D%"PRIx32", ISS=3D%"=
PRIx32"\n",
+    printk("ESR=3D%#"PRIregister":  EC=3D%"PRIx32", IL=3D%"PRIx32", ISS=3D=
%"PRIx32"\n",
           hsr.bits, hsr.ec, hsr.len, hsr.iss);

    local_irq_disable();
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 41f18612c6..caf17174b8 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -368,7 +368,8 @@ void do_sysreg(struct cpu_user_regs *regs,
                     sysreg.op2,
                     sysreg.read ? "=3D>" : "<=3D",
                     sysreg.reg, regs->pc);
-            gdprintk(XENLOG_ERR, "unhandled 64-bit sysreg access %#x\n",
+            gdprintk(XENLOG_ERR,
+                     "unhandled 64-bit sysreg access %#"PRIregister"\n",
                     hsr.bits & HSR_SYSREG_REGS_MASK);
            inject_undef_exception(regs, hsr);
            return;
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index c021a03c61..74bdbb9082 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -845,7 +845,7 @@ static int is_guest_pv32_psr(uint32_t psr)


#ifdef CONFIG_ARM_64
-static int is_guest_pv64_psr(uint32_t psr)
+static int is_guest_pv64_psr(uint64_t psr)
{
    if ( psr & PSR_MODE_BIT )
        return 0;
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index e7384381cc..4ccb6e7d18 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -546,7 +546,7 @@ void inject_undef64_exception(struct cpu_user_regs *reg=
s, int instr_len)
        PSR_IRQ_MASK | PSR_DBG_MASK;
    regs->pc =3D handler;

-    WRITE_SYSREG32(esr.bits, ESR_EL1);
+    WRITE_SYSREG(esr.bits, ESR_EL1);
}

/* Inject an abort exception into a 64 bit guest */
@@ -580,7 +580,7 @@ static void inject_abt64_exception(struct cpu_user_regs=
 *regs,
    regs->pc =3D handler;

    WRITE_SYSREG(addr, FAR_EL1);
-    WRITE_SYSREG32(esr.bits, ESR_EL1);
+    WRITE_SYSREG(esr.bits, ESR_EL1);
}

static void inject_dabt64_exception(struct cpu_user_regs *regs,
@@ -717,7 +717,7 @@ struct reg_ctxt {
    uint64_t vttbr_el2;
};

-static const char *mode_string(uint32_t cpsr)
+static const char *mode_string(register_t cpsr)
{
    uint32_t mode;
    static const char *mode_strings[] =3D {
@@ -762,7 +762,7 @@ static void show_registers_32(const struct cpu_user_reg=
s *regs,
        printk(" %pS", _p(regs->pc));
    printk("\n");
#endif
-    printk("CPSR:   %08"PRIx32" MODE:%s\n", regs->cpsr,
+    printk("CPSR:   %"PRIregister" MODE:%s\n", regs->cpsr,
           mode_string(regs->cpsr));
    printk("     R0: %08"PRIx32" R1: %08"PRIx32" R2: %08"PRIx32" R3: %08"PR=
Ix32"\n",
           regs->r0, regs->r1, regs->r2, regs->r3);
@@ -846,7 +846,7 @@ static void show_registers_64(const struct cpu_user_reg=
s *regs,
    {
        printk("SP:     %016"PRIx64"\n", regs->sp);
    }
-    printk("CPSR:   %08"PRIx32" MODE:%s\n", regs->cpsr,
+    printk("CPSR:   %016"PRIx64" MODE:%s\n", regs->cpsr,
           mode_string(regs->cpsr));
    printk("     X0: %016"PRIx64"  X1: %016"PRIx64"  X2: %016"PRIx64"\n",
           regs->x0, regs->x1, regs->x2);
@@ -919,7 +919,7 @@ static void _show_registers(const struct cpu_user_regs =
*regs,
    printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
    printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
    printk("\n");
-    printk("   ESR_EL2: %08"PRIx32"\n", regs->hsr);
+    printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
    printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));

#ifdef CONFIG_ARM_32
@@ -1599,7 +1599,7 @@ static const unsigned short cc_map[16] =3D {

int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr=
)
{
-    unsigned long cpsr, cpsr_cond;
+    register_t cpsr, cpsr_cond;
    int cond;

    /*
@@ -1661,7 +1661,7 @@ int check_conditional_instr(struct cpu_user_regs *reg=
s, const union hsr hsr)

void advance_pc(struct cpu_user_regs *regs, const union hsr hsr)
{
-    unsigned long itbits, cond, cpsr =3D regs->cpsr;
+    register_t itbits, cond, cpsr =3D regs->cpsr;
    bool is_thumb =3D psr_mode_is_32bit(regs) && (cpsr & PSR_THUMB);

    if ( is_thumb && (cpsr & PSR_IT_MASK) )
@@ -2004,13 +2004,15 @@ static void do_trap_stage2_abort_guest(struct cpu_u=
ser_regs *regs,

        break;
    default:
-        gprintk(XENLOG_WARNING, "Unsupported FSC: HSR=3D%#x DFSC=3D%#x\n",
+        gprintk(XENLOG_WARNING,
+                "Unsupported FSC: HSR=3D%#"PRIregister" DFSC=3D%#x\n",
                hsr.bits, xabt.fsc);
    }

inject_abt:
-    gdprintk(XENLOG_DEBUG, "HSR=3D0x%x pc=3D%#"PRIregister" gva=3D%#"PRIva=
ddr
-             " gpa=3D%#"PRIpaddr"\n", hsr.bits, regs->pc, gva, gpa);
+    gdprintk(XENLOG_DEBUG,
+             "HSR=3D%#"PRIregister" pc=3D%#"PRIregister" gva=3D%#"PRIvaddr=
" gpa=3D%#"PRIpaddr"\n",
+             hsr.bits, regs->pc, gva, gpa);
    if ( is_data )
        inject_dabt_exception(regs, gva, hsr.len);
    else
@@ -2204,7 +2206,7 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)

    default:
        gprintk(XENLOG_WARNING,
-                "Unknown Guest Trap. HSR=3D0x%x EC=3D0x%x IL=3D%x Syndrome=
=3D0x%"PRIx32"\n",
+                "Unknown Guest Trap. HSR=3D%#"PRIregister" EC=3D0x%x IL=3D=
%x Syndrome=3D0x%"PRIx32"\n",
                hsr.bits, hsr.ec, hsr.len, hsr.iss);
        inject_undef_exception(regs, hsr);
    }
@@ -2242,7 +2244,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
        break;
    }
    default:
-        printk("Hypervisor Trap. HSR=3D0x%x EC=3D0x%x IL=3D%x Syndrome=3D0=
x%"PRIx32"\n",
+        printk("Hypervisor Trap. HSR=3D%#"PRIregister" EC=3D0x%x IL=3D%x S=
yndrome=3D0x%"PRIx32"\n",
               hsr.bits, hsr.ec, hsr.len, hsr.iss);
        do_unexpected_trap("Hypervisor", regs);
    }
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 55351fc087..f0cdcc8a54 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -385,7 +385,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
                 "%s p15, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
                 cp32.read ? "mrc" : "mcr",
                 cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc=
);
-        gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#x\n",
+        gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#"PRIregister"=
\n",
                 hsr.bits & HSR_CP32_REGS_MASK);
        inject_undef_exception(regs, hsr);
        return;
@@ -454,7 +454,8 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
                     "%s p15, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
                     cp64.read ? "mrrc" : "mcrr",
                     cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
-            gdprintk(XENLOG_ERR, "unhandled 64-bit CP15 access %#x\n",
+            gdprintk(XENLOG_ERR,
+                     "unhandled 64-bit CP15 access %#"PRIregister"\n",
                     hsr.bits & HSR_CP64_REGS_MASK);
            inject_undef_exception(regs, hsr);
            return;
@@ -585,7 +586,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
                 "%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
                  cp32.read ? "mrc" : "mcr",
                  cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->p=
c);
-        gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#x\n",
+        gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#"PRIregister"=
\n",
                 hsr.bits & HSR_CP32_REGS_MASK);
        inject_undef_exception(regs, hsr);
        return;
@@ -627,7 +628,7 @@ void do_cp14_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
             "%s p14, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
             cp64.read ? "mrrc" : "mcrr",
             cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
-    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#x\n",
+    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#"PRIregister"\n",
             hsr.bits & HSR_CP64_REGS_MASK);
    inject_undef_exception(regs, hsr);
}
@@ -658,7 +659,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const unio=
n hsr hsr)
             "%s p14, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
             cp64.read ? "mrrc" : "mcrr",
             cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
-    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#x\n",
+    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#"PRIregister"=
\n",
             hsr.bits & HSR_CP64_REGS_MASK);

    inject_undef_exception(regs, hsr);
@@ -692,7 +693,7 @@ void do_cp10(struct cpu_user_regs *regs, const union hs=
r hsr)
                 "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
                 cp32.read ? "mrc" : "mcr",
                 cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc=
);
-        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
+        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#"PRIregister"=
\n",
                 hsr.bits & HSR_CP32_REGS_MASK);
        inject_undef_exception(regs, hsr);
        return;
diff --git a/xen/include/asm-arm/arm64/processor.h b/xen/include/asm-arm/ar=
m64/processor.h
index 81dfc5e615..c749f80ad9 100644
--- a/xen/include/asm-arm/arm64/processor.h
+++ b/xen/include/asm-arm/arm64/processor.h
@@ -63,18 +63,19 @@ struct cpu_user_regs

    /* Return address and mode */
    __DECL_REG(pc,           pc32);             /* ELR_EL2 */
-    uint32_t cpsr;                              /* SPSR_EL2 */
-    uint32_t hsr;                               /* ESR_EL2 */
+    uint64_t cpsr;                              /* SPSR_EL2 */
+    uint64_t hsr;                               /* ESR_EL2 */
+
+    /* The kernel frame should be 16-byte aligned. */
+    uint64_t pad0;

    /* Outer guest frame only from here on... */

    union {
-        uint32_t spsr_el1;       /* AArch64 */
+        uint64_t spsr_el1;       /* AArch64 */
        uint32_t spsr_svc;       /* AArch32 */
    };

-    uint32_t pad1; /* Doubleword-align the user half of the frame */
-
    /* AArch32 guests only */
    uint32_t spsr_fiq, spsr_irq, spsr_und, spsr_abt;

diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
index 29d4531f40..9b91b28c48 100644
--- a/xen/include/asm-arm/hsr.h
+++ b/xen/include/asm-arm/hsr.h
@@ -16,7 +16,7 @@ enum dabt_size {
};

union hsr {
-    uint32_t bits;
+    register_t bits;
    struct {
        unsigned long iss:25;  /* Instruction Specific Syndrome */
        unsigned long len:1;   /* Instruction length */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 713fd65317..64a2ca30da 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -267,10 +267,10 @@ struct vcpu_guest_core_regs

    /* Return address and mode */
    __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
-    uint32_t cpsr;                              /* SPSR_EL2 */
+    uint64_t cpsr;                              /* SPSR_EL2 */

    union {
-        uint32_t spsr_el1;       /* AArch64 */
+        uint64_t spsr_el1;       /* AArch64 */
        uint32_t spsr_svc;       /* AArch32 */
    };

diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4dbf107785..d576bfabd6 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -38,7 +38,7 @@
#include "hvm/save.h"
#include "memory.h"

-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014

/*
 * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 36135ba4f1..bb003d21d0 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -266,8 +266,7 @@ struct vm_event_regs_arm {
    uint64_t ttbr1;
    uint64_t ttbcr;
    uint64_t pc;
-    uint32_t cpsr;
-    uint32_t _pad;
+    uint64_t cpsr;
};

/*
--
2.29.0



--_000_25CEAEF8F0B3495094659D1896C8266Earmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <2C7FA049B28F4A4BB5F98B5C5F421812@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Hi Michal,<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 5 Jul 2021, at 07:39, Michal Orzel &lt;<a href=3D"mailto=
:michal.orzel@arm.com" class=3D"">michal.orzel@arm.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">AArch64 registers are 64bit whereas AArch32 registers<br cl=
ass=3D"">
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus<br class=3D"">
we should get rid of helpers READ/WRITE_SYSREG32<br class=3D"">
in favour of using READ/WRITE_SYSREG.<br class=3D"">
We should also use register_t type when reading sysregs<br class=3D"">
which can correspond to uint64_t or uint32_t.<br class=3D"">
Even though many AArch64 registers have upper 32bit reserved<br class=3D"">
it does not mean that they can't be widen in the future.<br class=3D"">
<br class=3D"">
Modify type of hsr, cpsr, spsr_el1 to uint64_t.<br class=3D"">
Previously we relied on the padding after spsr_el1.<br class=3D"">
As we removed the padding, modify the union to be 64bit so we don't corrupt=
 spsr_fiq.<br class=3D"">
No need to modify the assembly code because the accesses were based on 64bi=
t<br class=3D"">
registers as there was a 32bit padding after spsr_el1.<br class=3D"">
<br class=3D"">
Remove 32bit padding in cpu_user_regs before spsr_fiq<br class=3D"">
as it is no longer needed due to upper union being 64bit now.<br class=3D""=
>
Add 64bit padding in cpu_user_regs before spsr_el1<br class=3D"">
because the kernel frame should be 16-byte aligned.<br class=3D"">
<br class=3D"">
Change type of cpsr to uint64_t in the public outside interface<br class=3D=
"">
&quot;public/arch-arm.h&quot; to allow ABI compatibility between 32bit and =
64bit.<br class=3D"">
Increment XEN_DOMCTL_INTERFACE_VERSION.<br class=3D"">
<br class=3D"">
Change type of cpsr to uint64_t in the public outside interface<br class=3D=
"">
&quot;public/vm_event.h&quot; to allow ABI compatibility between 32bit and =
64bit.<br class=3D"">
<br class=3D"">
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@arm.com" cla=
ss=3D"">michal.orzel@arm.com</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.co=
m" class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div>Bertrand</div>
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">---<br class=3D"">
Changes since v3:<br class=3D"">
-Fix comment about padding<br class=3D"">
-Remove duplicated printk<br class=3D"">
Changes since v2:<br class=3D"">
-Remove _res0 members from structures inside hsr union<br class=3D"">
-Update commit message<br class=3D"">
-Modify type of cpsr to uint64_t in public/arch-arm.h<br class=3D"">
-Increment XEN_DOMCTL_INTERFACE_VERSION<br class=3D"">
Changes since v1:<br class=3D"">
-Modify type of cpsr, spsr_el1<br class=3D"">
-Remove ifdefery in hsr union protecting _res0 members<br class=3D"">
-Fix formatting of printk calls<br class=3D"">
---<br class=3D"">
xen/arch/arm/arm64/entry.S &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;| &nbsp;4 ++--<br class=3D"">
xen/arch/arm/arm64/traps.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;| &nbsp;2 +-<br class=3D"">
xen/arch/arm/arm64/vsysreg.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;| &nbsp;3 ++-<br class=3D"">
xen/arch/arm/domain.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;2 +-<br class=3D"">
xen/arch/arm/traps.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 28 ++++++++++++++--------=
-----<br class=3D"">
xen/arch/arm/vcpreg.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 13 +++++++------<br class=3D""=
>
xen/include/asm-arm/arm64/processor.h | 11 ++++++-----<br class=3D"">
xen/include/asm-arm/hsr.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;2 +-<br class=3D"">
xen/include/public/arch-arm.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;| &nbsp;4 ++--<br class=3D"">
xen/include/public/domctl.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;| &nbsp;2 +-<br class=3D"">
xen/include/public/vm_event.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;| &nbsp;3 +--<br class=3D"">
11 files changed, 39 insertions(+), 35 deletions(-)<br class=3D"">
<br class=3D"">
diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S<br cla=
ss=3D"">
index ab9a65fc14..fc3811ad0a 100644<br class=3D"">
--- a/xen/arch/arm/arm64/entry.S<br class=3D"">
+++ b/xen/arch/arm/arm64/entry.S<br class=3D"">
@@ -155,7 +155,7 @@<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add &nbsp;&nbsp;&nbsp;&nbsp=
;x21, sp, #UREGS_CPSR<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mrs &nbsp;&nbsp;&nbsp;&nbsp=
;x22, spsr_el2<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mrs &nbsp;&nbsp;&nbsp;&nbsp=
;x23, esr_el2<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stp &nbsp;&nbsp;&nbsp;&nbsp;w22=
, w23, [x21]<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stp &nbsp;&nbsp;&nbsp;&nbsp;x22=
, x23, [x21]<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.endm<br class=3D"">
<br class=3D"">
@@ -432,7 +432,7 @@ return_from_trap:<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msr &nbsp;&nbsp;&nbsp;&nbsp=
;daifset, #IFLAGS___I_ /* Mask interrupts */<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ldr &nbsp;&nbsp;&nbsp;&nbsp=
;x21, [sp, #UREGS_PC] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;/* load ELR */<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ldr &nbsp;&nbsp;&nbsp;&nbsp;w22=
, [sp, #UREGS_CPSR] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/=
* load SPSR */<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ldr &nbsp;&nbsp;&nbsp;&nbsp;x22=
, [sp, #UREGS_CPSR] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/=
* load SPSR */<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pop &nbsp;&nbsp;&nbsp;&nbsp=
;x0, x1<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pop &nbsp;&nbsp;&nbsp;&nbsp=
;x2, x3<br class=3D"">
diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c<br cla=
ss=3D"">
index babfc1d884..9113a15c7a 100644<br class=3D"">
--- a/xen/arch/arm/arm64/traps.c<br class=3D"">
+++ b/xen/arch/arm/arm64/traps.c<br class=3D"">
@@ -36,7 +36,7 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)<=
br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;union hsr hsr =3D { .bits =3D regs-&gt;hsr };<br cl=
ass=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot;Bad mode in %s handler detected\n&quot=
;, handler[reason]);<br class=3D"">
- &nbsp;&nbsp;&nbsp;printk(&quot;ESR=3D0x%08&quot;PRIx32&quot;: &nbsp;EC=3D=
%&quot;PRIx32&quot;, IL=3D%&quot;PRIx32&quot;, ISS=3D%&quot;PRIx32&quot;\n&=
quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;printk(&quot;ESR=3D%#&quot;PRIregister&quot;: &nbsp;EC=
=3D%&quot;PRIx32&quot;, IL=3D%&quot;PRIx32&quot;, ISS=3D%&quot;PRIx32&quot;=
\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hsr.bits,=
 hsr.ec, hsr.len, hsr.iss);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;local_irq_disable();<br class=3D"">
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c<br=
 class=3D"">
index 41f18612c6..caf17174b8 100644<br class=3D"">
--- a/xen/arch/arm/arm64/vsysreg.c<br class=3D"">
+++ b/xen/arch/arm/arm64/vsysreg.c<br class=3D"">
@@ -368,7 +368,8 @@ void do_sysreg(struct cpu_user_regs *regs,<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sysreg.op2,<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sysreg.read ? &quot;=3D&=
gt;&quot; : &quot;&lt;=3D&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sysreg.reg, regs-&gt;pc)=
;<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprint=
k(XENLOG_ERR, &quot;unhandled 64-bit sysreg access %#x\n&quot;,<br class=3D=
"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprint=
k(XENLOG_ERR,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;unhandled 64-bit sysre=
g access %#&quot;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hsr.bits &amp; HSR_SYSRE=
G_REGS_MASK);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inj=
ect_undef_exception(regs, hsr);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret=
urn;<br class=3D"">
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c<br class=3D"">
index c021a03c61..74bdbb9082 100644<br class=3D"">
--- a/xen/arch/arm/domain.c<br class=3D"">
+++ b/xen/arch/arm/domain.c<br class=3D"">
@@ -845,7 +845,7 @@ static int is_guest_pv32_psr(uint32_t psr)<br class=3D"=
">
<br class=3D"">
<br class=3D"">
#ifdef CONFIG_ARM_64<br class=3D"">
-static int is_guest_pv64_psr(uint32_t psr)<br class=3D"">
+static int is_guest_pv64_psr(uint64_t psr)<br class=3D"">
{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if ( psr &amp; PSR_MODE_BIT )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 0;<br class=3D"">
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c<br class=3D"">
index e7384381cc..4ccb6e7d18 100644<br class=3D"">
--- a/xen/arch/arm/traps.c<br class=3D"">
+++ b/xen/arch/arm/traps.c<br class=3D"">
@@ -546,7 +546,7 @@ void inject_undef64_exception(struct cpu_user_regs *reg=
s, int instr_len)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PSR_IRQ_MASK | PSR_DBG_MASK=
;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;regs-&gt;pc =3D handler;<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;WRITE_SYSREG32(esr.bits, ESR_EL1);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;WRITE_SYSREG(esr.bits, ESR_EL1);<br class=3D"">
}<br class=3D"">
<br class=3D"">
/* Inject an abort exception into a 64 bit guest */<br class=3D"">
@@ -580,7 +580,7 @@ static void inject_abt64_exception(struct cpu_user_regs=
 *regs,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;regs-&gt;pc =3D handler;<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;WRITE_SYSREG(addr, FAR_EL1);<br class=3D"">
- &nbsp;&nbsp;&nbsp;WRITE_SYSREG32(esr.bits, ESR_EL1);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;WRITE_SYSREG(esr.bits, ESR_EL1);<br class=3D"">
}<br class=3D"">
<br class=3D"">
static void inject_dabt64_exception(struct cpu_user_regs *regs,<br class=3D=
"">
@@ -717,7 +717,7 @@ struct reg_ctxt {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;uint64_t vttbr_el2;<br class=3D"">
};<br class=3D"">
<br class=3D"">
-static const char *mode_string(uint32_t cpsr)<br class=3D"">
+static const char *mode_string(register_t cpsr)<br class=3D"">
{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;uint32_t mode;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;static const char *mode_strings[] =3D {<br class=3D=
"">
@@ -762,7 +762,7 @@ static void show_registers_32(const struct cpu_user_reg=
s *regs,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot; %pS&quot;, _p=
(regs-&gt;pc));<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot;\n&quot;);<br class=3D"">
#endif<br class=3D"">
- &nbsp;&nbsp;&nbsp;printk(&quot;CPSR: &nbsp;&nbsp;%08&quot;PRIx32&quot; MO=
DE:%s\n&quot;, regs-&gt;cpsr,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;printk(&quot;CPSR: &nbsp;&nbsp;%&quot;PRIregister&quot;=
 MODE:%s\n&quot;, regs-&gt;cpsr,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mode_stri=
ng(regs-&gt;cpsr));<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot; &nbsp;&nbsp;&nbsp;&nbsp;R0: %08&quot;=
PRIx32&quot; R1: %08&quot;PRIx32&quot; R2: %08&quot;PRIx32&quot; R3: %08&qu=
ot;PRIx32&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;regs-&gt;=
r0, regs-&gt;r1, regs-&gt;r2, regs-&gt;r3);<br class=3D"">
@@ -846,7 +846,7 @@ static void show_registers_64(const struct cpu_user_reg=
s *regs,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot;SP: &nbsp;&nbs=
p;&nbsp;&nbsp;%016&quot;PRIx64&quot;\n&quot;, regs-&gt;sp);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
- &nbsp;&nbsp;&nbsp;printk(&quot;CPSR: &nbsp;&nbsp;%08&quot;PRIx32&quot; MO=
DE:%s\n&quot;, regs-&gt;cpsr,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;printk(&quot;CPSR: &nbsp;&nbsp;%016&quot;PRIx64&quot; M=
ODE:%s\n&quot;, regs-&gt;cpsr,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mode_stri=
ng(regs-&gt;cpsr));<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot; &nbsp;&nbsp;&nbsp;&nbsp;X0: %016&quot=
;PRIx64&quot; &nbsp;X1: %016&quot;PRIx64&quot; &nbsp;X2: %016&quot;PRIx64&q=
uot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;regs-&gt;=
x0, regs-&gt;x1, regs-&gt;x2);<br class=3D"">
@@ -919,7 +919,7 @@ static void _show_registers(const struct cpu_user_regs =
*regs,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot; &nbsp;&nbsp;HCR_EL2: %&quot;PRIregist=
er&quot;\n&quot;, READ_SYSREG(HCR_EL2));<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot; TTBR0_EL2: %016&quot;PRIx64&quot;\n&q=
uot;, READ_SYSREG64(TTBR0_EL2));<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot;\n&quot;);<br class=3D"">
- &nbsp;&nbsp;&nbsp;printk(&quot; &nbsp;&nbsp;ESR_EL2: %08&quot;PRIx32&quot=
;\n&quot;, regs-&gt;hsr);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;printk(&quot; &nbsp;&nbsp;ESR_EL2: %&quot;PRIregister&q=
uot;\n&quot;, regs-&gt;hsr);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot; HPFAR_EL2: %&quot;PRIregister&quot;\n=
&quot;, READ_SYSREG(HPFAR_EL2));<br class=3D"">
<br class=3D"">
#ifdef CONFIG_ARM_32<br class=3D"">
@@ -1599,7 +1599,7 @@ static const unsigned short cc_map[16] =3D {<br class=
=3D"">
<br class=3D"">
int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr=
)<br class=3D"">
{<br class=3D"">
- &nbsp;&nbsp;&nbsp;unsigned long cpsr, cpsr_cond;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;register_t cpsr, cpsr_cond;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;int cond;<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;/*<br class=3D"">
@@ -1661,7 +1661,7 @@ int check_conditional_instr(struct cpu_user_regs *reg=
s, const union hsr hsr)<br class=3D"">
<br class=3D"">
void advance_pc(struct cpu_user_regs *regs, const union hsr hsr)<br class=
=3D"">
{<br class=3D"">
- &nbsp;&nbsp;&nbsp;unsigned long itbits, cond, cpsr =3D regs-&gt;cpsr;<br =
class=3D"">
+ &nbsp;&nbsp;&nbsp;register_t itbits, cond, cpsr =3D regs-&gt;cpsr;<br cla=
ss=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;bool is_thumb =3D psr_mode_is_32bit(regs) &amp;&amp=
; (cpsr &amp; PSR_THUMB);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if ( is_thumb &amp;&amp; (cpsr &amp; PSR_IT_MASK) )=
<br class=3D"">
@@ -2004,13 +2004,15 @@ static void do_trap_stage2_abort_guest(struct cpu_u=
ser_regs *regs,<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;default:<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gprintk(XENLOG_WARNING, &quot;U=
nsupported FSC: HSR=3D%#x DFSC=3D%#x\n&quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gprintk(XENLOG_WARNING,<br clas=
s=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&quot;Unsupported FSC: HSR=3D%#&quot;PRIregister&quot; DFS=
C=3D%#x\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;hsr.bits, xabt.fsc);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
<br class=3D"">
inject_abt:<br class=3D"">
- &nbsp;&nbsp;&nbsp;gdprintk(XENLOG_DEBUG, &quot;HSR=3D0x%x pc=3D%#&quot;PR=
Iregister&quot; gva=3D%#&quot;PRIvaddr<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
quot; gpa=3D%#&quot;PRIpaddr&quot;\n&quot;, hsr.bits, regs-&gt;pc, gva, gpa=
);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;gdprintk(XENLOG_DEBUG,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
quot;HSR=3D%#&quot;PRIregister&quot; pc=3D%#&quot;PRIregister&quot; gva=3D%=
#&quot;PRIvaddr&quot; gpa=3D%#&quot;PRIpaddr&quot;\n&quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;h=
sr.bits, regs-&gt;pc, gva, gpa);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if ( is_data )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inject_dabt_exception(regs,=
 gva, hsr.len);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;else<br class=3D"">
@@ -2204,7 +2206,7 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)<b=
r class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;default:<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gprintk(XENLOG_WARNING,<br =
class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&quot;Unknown Guest Trap. HSR=3D0x%x EC=3D0x%x IL=3D%x Syn=
drome=3D0x%&quot;PRIx32&quot;\n&quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&quot;Unknown Guest Trap. HSR=3D%#&quot;PRIregister&quot; =
EC=3D0x%x IL=3D%x Syndrome=3D0x%&quot;PRIx32&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;hsr.bits, hsr.ec, hsr.len, hsr.iss);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inject_undef_exception(regs=
, hsr);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
@@ -2242,7 +2244,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)<br =
class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;default:<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot;Hypervisor Trap. H=
SR=3D0x%x EC=3D0x%x IL=3D%x Syndrome=3D0x%&quot;PRIx32&quot;\n&quot;,<br cl=
ass=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot;Hypervisor Trap. H=
SR=3D%#&quot;PRIregister&quot; EC=3D0x%x IL=3D%x Syndrome=3D0x%&quot;PRIx32=
&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;hsr.bits, hsr.ec, hsr.len, hsr.iss);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;do_unexpected_trap(&quot;Hy=
pervisor&quot;, regs);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c<br class=3D"">
index 55351fc087..f0cdcc8a54 100644<br class=3D"">
--- a/xen/arch/arm/vcpreg.c<br class=3D"">
+++ b/xen/arch/arm/vcpreg.c<br class=3D"">
@@ -385,7 +385,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;%s p15, %d, r%d, cr%d, cr%d, %d @ 0x%&quot=
;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;cp32.read ? &quot;mrc&quot; : &quot;mcr&quot;,<b=
r class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2=
, regs-&gt;pc);<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unha=
ndled 32-bit CP15 access %#x\n&quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unha=
ndled 32-bit CP15 access %#&quot;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;hsr.bits &amp; HSR_CP32_REGS_MASK);<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inject_undef_exception(regs=
, hsr);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;<br class=3D"">
@@ -454,7 +454,8 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;%s p15, %d, r%d, r=
%d, cr%d @ 0x%&quot;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cp64.read ? &quot;mrrc&q=
uot; : &quot;mcrr&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cp64.op1, cp64.reg1, cp6=
4.reg2, cp64.crm, regs-&gt;pc);<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprint=
k(XENLOG_ERR, &quot;unhandled 64-bit CP15 access %#x\n&quot;,<br class=3D""=
>
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprint=
k(XENLOG_ERR,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;unhandled 64-bit CP15 =
access %#&quot;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hsr.bits &amp; HSR_CP64_=
REGS_MASK);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inj=
ect_undef_exception(regs, hsr);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret=
urn;<br class=3D"">
@@ -585,7 +586,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union=
 hsr hsr)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%&quot=
;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cp32.read ? &quot;mrc&quot; : &quot;mcr&qu=
ot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp=
32.op2, regs-&gt;pc);<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unha=
ndled 32-bit cp14 access %#x\n&quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unha=
ndled 32-bit cp14 access %#&quot;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;hsr.bits &amp; HSR_CP32_REGS_MASK);<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inject_undef_exception(regs=
, hsr);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;<br class=3D"">
@@ -627,7 +628,7 @@ void do_cp14_64(struct cpu_user_regs *regs, const union=
 hsr hsr)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&quot;%s p14, %d, r%d, r%d, cr%d @ 0x%&quot;PRIregister&quot;\n&quot;,<b=
r class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;cp64.read ? &quot;mrrc&quot; : &quot;mcrr&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs-&gt;pc);<br class=3D"">
- &nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unhandled 64-bit CP14 access=
 %#x\n&quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unhandled 64-bit CP14 access=
 %#&quot;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;hsr.bits &amp; HSR_CP64_REGS_MASK);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;inject_undef_exception(regs, hsr);<br class=3D"">
}<br class=3D"">
@@ -658,7 +659,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const unio=
n hsr hsr)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&quot;%s p14, %d, r%d, r%d, cr%d @ 0x%&quot;PRIregister&quot;\n&quot;,<b=
r class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;cp64.read ? &quot;mrrc&quot; : &quot;mcrr&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs-&gt;pc);<br class=3D"">
- &nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unhandled 64-bit CP14 DBG ac=
cess %#x\n&quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unhandled 64-bit CP14 DBG ac=
cess %#&quot;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;hsr.bits &amp; HSR_CP64_REGS_MASK);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;inject_undef_exception(regs, hsr);<br class=3D"">
@@ -692,7 +693,7 @@ void do_cp10(struct cpu_user_regs *regs, const union hs=
r hsr)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%&quot=
;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;cp32.read ? &quot;mrc&quot; : &quot;mcr&quot;,<b=
r class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2=
, regs-&gt;pc);<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unha=
ndled 32-bit CP10 access %#x\n&quot;,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gdprintk(XENLOG_ERR, &quot;unha=
ndled 32-bit CP10 access %#&quot;PRIregister&quot;\n&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;hsr.bits &amp; HSR_CP32_REGS_MASK);<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inject_undef_exception(regs=
, hsr);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;<br class=3D"">
diff --git a/xen/include/asm-arm/arm64/processor.h b/xen/include/asm-arm/ar=
m64/processor.h<br class=3D"">
index 81dfc5e615..c749f80ad9 100644<br class=3D"">
--- a/xen/include/asm-arm/arm64/processor.h<br class=3D"">
+++ b/xen/include/asm-arm/arm64/processor.h<br class=3D"">
@@ -63,18 +63,19 @@ struct cpu_user_regs<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;/* Return address and mode */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;__DECL_REG(pc, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;pc32); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;/* ELR_EL2 */<br class=3D"">
- &nbsp;&nbsp;&nbsp;uint32_t cpsr; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* SPSR_EL2 */<b=
r class=3D"">
- &nbsp;&nbsp;&nbsp;uint32_t hsr; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* ESR_EL2 =
*/<br class=3D"">
+ &nbsp;&nbsp;&nbsp;uint64_t cpsr; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* SPSR_EL2 */<b=
r class=3D"">
+ &nbsp;&nbsp;&nbsp;uint64_t hsr; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* ESR_EL2 =
*/<br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;/* The kernel frame should be 16-byte aligned. */<br cl=
ass=3D"">
+ &nbsp;&nbsp;&nbsp;uint64_t pad0;<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;/* Outer guest frame only from here on... */<br cla=
ss=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;union {<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t spsr_el1; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;/* AArch64 */<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t spsr_el1; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;/* AArch64 */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t spsr_svc; &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;/* AArch32 */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;};<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;uint32_t pad1; /* Doubleword-align the user half of the=
 frame */<br class=3D"">
-<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;/* AArch32 guests only */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;uint32_t spsr_fiq, spsr_irq, spsr_und, spsr_abt;<br=
 class=3D"">
<br class=3D"">
diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h<br class=
=3D"">
index 29d4531f40..9b91b28c48 100644<br class=3D"">
--- a/xen/include/asm-arm/hsr.h<br class=3D"">
+++ b/xen/include/asm-arm/hsr.h<br class=3D"">
@@ -16,7 +16,7 @@ enum dabt_size {<br class=3D"">
};<br class=3D"">
<br class=3D"">
union hsr {<br class=3D"">
- &nbsp;&nbsp;&nbsp;uint32_t bits;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;register_t bits;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;struct {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long iss:25; &nbsp=
;/* Instruction Specific Syndrome */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long len:1; &nbsp;=
&nbsp;/* Instruction length */<br class=3D"">
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h<=
br class=3D"">
index 713fd65317..64a2ca30da 100644<br class=3D"">
--- a/xen/include/public/arch-arm.h<br class=3D"">
+++ b/xen/include/public/arch-arm.h<br class=3D"">
@@ -267,10 +267,10 @@ struct vcpu_guest_core_regs<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;/* Return address and mode */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;__DECL_REG(pc64, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;pc32); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;/* ELR_EL2 */<br class=3D"">
- &nbsp;&nbsp;&nbsp;uint32_t cpsr; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* SPSR_EL2 */<b=
r class=3D"">
+ &nbsp;&nbsp;&nbsp;uint64_t cpsr; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* SPSR_EL2 */<b=
r class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;union {<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t spsr_el1; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;/* AArch64 */<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t spsr_el1; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;/* AArch64 */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t spsr_svc; &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;/* AArch32 */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;};<br class=3D"">
<br class=3D"">
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h<br c=
lass=3D"">
index 4dbf107785..d576bfabd6 100644<br class=3D"">
--- a/xen/include/public/domctl.h<br class=3D"">
+++ b/xen/include/public/domctl.h<br class=3D"">
@@ -38,7 +38,7 @@<br class=3D"">
#include &quot;hvm/save.h&quot;<br class=3D"">
#include &quot;memory.h&quot;<br class=3D"">
<br class=3D"">
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013<br class=3D"">
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014<br class=3D"">
<br class=3D"">
/*<br class=3D"">
&nbsp;* NB. xen_domctl.domain is an IN/OUT parameter for this operation.<br=
 class=3D"">
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h<=
br class=3D"">
index 36135ba4f1..bb003d21d0 100644<br class=3D"">
--- a/xen/include/public/vm_event.h<br class=3D"">
+++ b/xen/include/public/vm_event.h<br class=3D"">
@@ -266,8 +266,7 @@ struct vm_event_regs_arm {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;uint64_t ttbr1;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;uint64_t ttbcr;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;uint64_t pc;<br class=3D"">
- &nbsp;&nbsp;&nbsp;uint32_t cpsr;<br class=3D"">
- &nbsp;&nbsp;&nbsp;uint32_t _pad;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;uint64_t cpsr;<br class=3D"">
};<br class=3D"">
<br class=3D"">
/*<br class=3D"">
-- <br class=3D"">
2.29.0<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_25CEAEF8F0B3495094659D1896C8266Earmcom_--

