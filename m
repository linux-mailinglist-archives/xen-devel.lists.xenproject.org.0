Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6757C50A6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 12:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615450.956672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqWrn-00070d-Lh; Wed, 11 Oct 2023 10:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615450.956672; Wed, 11 Oct 2023 10:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqWrn-0006xG-Ig; Wed, 11 Oct 2023 10:55:03 +0000
Received: by outflank-mailman (input) for mailman id 615450;
 Wed, 11 Oct 2023 10:55:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgCM=FZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qqWrl-0006x2-GE
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 10:55:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe12::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d9f5542-6824-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 12:54:57 +0200 (CEST)
Received: from DBBPR09CA0041.eurprd09.prod.outlook.com (2603:10a6:10:d4::29)
 by PAXPR08MB7465.eurprd08.prod.outlook.com (2603:10a6:102:2b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Wed, 11 Oct
 2023 10:54:41 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::3e) by DBBPR09CA0041.outlook.office365.com
 (2603:10a6:10:d4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Wed, 11 Oct 2023 10:54:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.27 via Frontend Transport; Wed, 11 Oct 2023 10:54:41 +0000
Received: ("Tessian outbound fb5c0777b309:v211");
 Wed, 11 Oct 2023 10:54:41 +0000
Received: from 9c6a770eeca4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AE443C74-C319-496A-BFDD-86BEB872623C.1; 
 Wed, 11 Oct 2023 10:53:58 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c6a770eeca4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Oct 2023 10:53:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9320.eurprd08.prod.outlook.com (2603:10a6:20b:598::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Wed, 11 Oct
 2023 10:53:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 10:53:56 +0000
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
X-Inumbo-ID: 9d9f5542-6824-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B05IP0LF1YtdMjYZHGPJXUvFghrLe7+cpYr/c1UcDc=;
 b=PHW7LkYbZb/PjpdUW7C6cV3/S20d4ayxw4vDoM/DN4SPzH+rc1c0WoFWUcuwAUwk805fYS1nuvH4VsJPjU9NRXqOstgoK3++XH1RaP0+wfp0+9LkLd0z0wyc5NYUV/R6G4sbjvgsRwD0D6hy6BeHYmKp/D+LqPViAJTYAuf7TtY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a2fea5dd0843a72
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFZ6JRkUR2VLWTt/cKwL0L1jGXF8o7KA8JkYhYoJYpanXBPVwmIMsqkRQvpz/0HnCo1xgRpIrWkFODqBYFy/1cSKZaY5XZ/hPM81IIwRa5IAdWF7XDL1tRarePpX/M32mVFbkyAwCpUxPUf9IeIPX7jIC9lbE5pm9iNxaaNuNoKvsq5K7nEUWdQMdDi1Jt70/pcwII2yD49t/1Fx8OhICIWH2d8UNGOo2jBqyqMW9zAvvmiDJc/cjIVZ+i7lvonWOClvduNg42+AiIpHYCgQXRg9y4QwNiw4bB7tqPAHk5UwWsziT/9fG+RbosXjuzj640/tGiCXdAmc+VaWWWUWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B05IP0LF1YtdMjYZHGPJXUvFghrLe7+cpYr/c1UcDc=;
 b=Z8B+tnmWVXD5WBDxiICDe3Li2WvMZCwd9g+LpObRgtpPLAMNkHmUhhPTx8akP/4CanR0Rqehs8RO7T3UyokhwqNk/hXxwbaUQE4vXmybbWJQ/xaZfiQpkThzzZfW05uJFZbGhMlLoTsfyTGfx4pQT/gqiR1KPyik9GD/qrOsDdXFyfnfCd71XZ2AbwmuD5peehW7pFo3+crL4cAYSa8ezS/cd3hv7GJeGcDFtYbVUD6vz8K9QC0rjy6mpJpTk/kW7caV2eldWAfKbXmTeBbv+HYxiCk9WibpYoBUSpfPMfA5uJEn6ojanHg0eJtYtZv/zSezVPtSZpPfD4Qk6pwclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B05IP0LF1YtdMjYZHGPJXUvFghrLe7+cpYr/c1UcDc=;
 b=PHW7LkYbZb/PjpdUW7C6cV3/S20d4ayxw4vDoM/DN4SPzH+rc1c0WoFWUcuwAUwk805fYS1nuvH4VsJPjU9NRXqOstgoK3++XH1RaP0+wfp0+9LkLd0z0wyc5NYUV/R6G4sbjvgsRwD0D6hy6BeHYmKp/D+LqPViAJTYAuf7TtY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Topic: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Index:
 AQHZ9qj87vFsnMRst0ybMa+ffKOLU7A5Z4mAgAAGhgCAAAYzgIAA1KIAgACGqQCAASTEgIAAdASAgAEY6ICAA60ogIAA4ZaAgADQ0QCAANf6gIAAqUEAgAABkwCAABF9gA==
Date: Wed, 11 Oct 2023 10:53:56 +0000
Message-ID: <6BB62AEF-FCE1-412C-87DD-479319623092@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
 <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
 <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
 <1ceb5aa0-d374-4357-964f-1341468d542e@xen.org>
 <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop>
 <8c3d7933-c139-49dd-8c62-2d4543176f8f@xen.org>
 <alpine.DEB.2.22.394.2310101635280.3431292@ubuntu-linux-20-04-desktop>
 <80f4df2b-a8b2-4494-94e0-47de55c01597@xen.org>
 <1766b5f3-490c-4bbe-902c-3970c28041a7@xen.org>
In-Reply-To: <1766b5f3-490c-4bbe-902c-3970c28041a7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9320:EE_|DBAEUR03FT051:EE_|PAXPR08MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3bf956-6b70-4858-cdba-08dbca4878c3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9peaHsIZMH/3DsV+BLiArG8ZGqenVJBkjHXH2iyQrRzzWDzpdv72ZREY3DrjNwgDTfBrFntKLm+Im6Sr3m/njLFEiFxjjlgGV6dC2DYBYoZWEIuK/Gsok8LzIj1lRCdKtDmuNquygRIhJ6gzpSXIoNiPXBMwsg3WrqTKamFRQoKtkdPOqsHOKWmZR5rQCYesCBYU6Z4MzzZNUjJRJ8IgFM8xu5k4FwR+szo6jFixzHZOVl90tYjUdjv4ZGPmZKaQyJI0IrzxKGuG0u9e15QyxFYnckhSIt6Kijrf3/GAqJoocW6wPLUC3Dsq63uV4jHBSGsjVaSeQFeHt5x0/TxlOBRM6FsdjwwRUpmrOViF76xmXzwZVywEFqvudB+a8IuLAHHjs1VLczvPwvTIokfbRThoL0SHlrzDI/IVySV1ngWGuJpm2ByuV6f6yXYDUARUIaO/PMnAOiXXGIItSkG+Yho3gCfSMPVHne5GYq7Yi5G51rBh3QXwfDDXv1xC1kM14pt4s+mmJTveLqVYxJcmf0HIKoDGwhjTRgOwJ51BvElZmfa/G/sqU/3tBFjrTY4m0XO1pTFwM03Oc4LlnFQriSKnaBx0cD/7be9urGSZsH3qLb4sk3Ym4xhn4UnXtafV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(71200400001)(26005)(2616005)(6512007)(8676002)(66556008)(76116006)(8936002)(2906002)(7416002)(478600001)(4326008)(6506007)(66946007)(66476007)(64756008)(66446008)(54906003)(966005)(5660300002)(6486002)(316002)(91956017)(41300700001)(6916009)(38100700002)(122000001)(86362001)(38070700005)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7035AFD0A7724643A58A42E0E80A25DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9320
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0fb1269c-2f0d-4e9d-ae15-08dbca485dd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TrXsTJmMXgt5Oaq2UY6IWQkBDW+ys26pAvbVzelYNACkAiB6sDgQSOMFzbekINQEFP1vE/EJKnBhoF+UxDEpNZ4/1RJKnd+yoQTkvpiKr6tK2XSTxoSFAj+k5GG5Noyzk1rP+gQ4WXbkvGmH1MAxYEI3G6KUO+UhRjMr8X7J5dPWVOHdNFSxX7YpxcCq0zYicIFW9eflEaRgDsZqGlfN+ccEbjbF4A3fKwnAMrJvSwJOXWXHV7L6I+WR6lUooQ5/IvJdfoL2oW3sdViClbY+rc6Q7yH6NaiNhqKHnUEC/QAjIdRedG10SbDTC9wv2SLQkJC3Ha9rbUc+3//Uka2ZWgOxe+NkIcTiCxc8KwYUbf29hOjKRxn92owZIObKIwRWZ1iAYiJgz/Hg8hzfNX3deJXu9zCHtgFOVTM1GGBc6YUvBoFBBGh9iqY4r4BDmeH/thh2kxoFlsG+jYRYgu7QV2mxdDpu7nEYEOR/DLSRhk4t2D2PzMs4sX5FQjB4HlqYTFcc7mlBSb28KNLgHGnyH4ax7IOI5pNQXMoY3WR8muOvbp/7cB270QgIMaRPsmARmAx118iBaYx0UCTfEBXMSoAzJbxOuBziQqX4ZOTR6Cez2MdRv11moUm+PKE4fvIuFJ7U6gNNg+lwblmxh6g0s3kjYdAdgndTOY9R4GDjRnfJlUH4siPnECtAIQVYQvLnE58d6XP1/IpJw8kAty42pDt4d62KFE0YxF2ZGyOQJ+g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(70586007)(70206006)(54906003)(316002)(6862004)(4326008)(8936002)(8676002)(41300700001)(36756003)(336012)(36860700001)(356005)(82740400003)(5660300002)(81166007)(33656002)(6512007)(2906002)(6486002)(966005)(47076005)(26005)(2616005)(478600001)(40460700003)(40480700001)(86362001)(107886003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 10:54:41.5455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3bf956-6b70-4858-cdba-08dbca4878c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7465

DQo+Pj4gDQo+Pj4gTHVjYSBhbnN3ZXJlZCB0byBhIHNpbWlsYXIsIG1vcmUgZ2VuZXJpYywgcXVl
c3Rpb24gYSBmZXcgZGF5cyBhZ28gYWJvdXQNCj4+PiBDb3Zlcml0eTogaHR0cHM6Ly9tYXJjLmlu
Zm8vP2w9eGVuLWRldmVsJm09MTY5NjU3OTA0MDI3MjEwDQo+PiBJbnRlcmVzdGluZy4NCj4+PiAN
Cj4+PiBTbyBldmVuIGlmIHdlIGdldCBjcHBjaGVjayB0byB3b3JrIGxpa2UgdGhhdCwgd2Ugd291
bGQgbG9zZSBDb3Zlcml0eQ0KPj4+IHN1cHBvcnQuDQo+PiBJIHRoaW5rIG15IHN1Z2dlc3Rpb24g
d2FzIHByb2JhYmx5IG1pc3VuZGVyc3Rvb2QuIFNvIGxldCBtZSBjbGFyaWZ5IGl0LiBUbyBjb3Zl
ciBtdWx0aS1saW5lLCB3ZSBjb3VsZCB3cml0ZSB0aGUgZm9sbG93aW5nIGluIFhlbjoNCj4+IC8q
IGNwcGNoZWNrIHRhZyBuZXh0LTMtbGluZXMgKi8NCj4+IGxpbmUgMQ0KPj4gbGluZSAyDQo+PiBs
aW5lIDMNCj4+IEFGQUlVIEVjbGFpciBzdXBwb3J0cyBtdWx0aS1saW5lLCBzbyB0aGUgdGFnIHdv
dWxkIGJlIHRyYW5zZm9ybWVkIHRvIHRoZXJlIGludGVybmFsIHNvbHV0aW9uLiBGb3IgQ1BQQ2hl
Y2ssIHRoaXMgY291bGQgYmUgdHJhbnNmb3JtZWQgdG86DQo+PiAvKiBjcHBjaGVjayB0YWcgbmV4
dC0zIGxpbmVzICovDQo+PiBsaW5lIDEgLyogZ2VuZXJhdGVkIGNwcGNoZWNrIHRhZyAqLw0KPj4g
bGluZSAyIC8qIGdlbmVyYXRlZCBjcHBjaGVjayB0YWcgKi8NCj4+IGxpbmUgMyAvKiBnZW5lcmF0
ZWQgY3BwY2hlY2sgdGFnICovDQo+PiBOb3csIEkgdW5kZXJzdGFuZCB0aGF0IGNvdmVyaXR5IGRv
ZXNuJ3Qgc3VwcG9ydCBhbnkgb2YgdGhlIHR3byBmb3JtYXQuIFNvIHRoZSBvbmx5IHNvbHV0aW9u
IHdvdWxkIGJlIHRvIGFkZCB0aGUgY29tbWVudCBiZWZvcmUgZWFjaCBsaW5lIHdoaWNoIHdvdWxk
IGltcGFjdCB0aGUgbGluZSBudW1iZXJzLiBUaGlzIGlzIG5vdCBncmVhdCwgYnV0IEkgdGhpbmsg
dGhpcyBpcyBhY2NlcHRhYmxlIGFzIHRoZSBjb250ZXh0IHdvdWxkIGxpa2VseSBoZWxwIHRvIGZp
bmQgd2hlcmUgdGhpcyBpcyBjb21pbmcgZnJvbS4NCj4gDQo+IEp1c3QgdG8gY2xhcmlmeSwgaGVy
ZSBJIG1lYW50IHRoYXQgZm9yIGNvdmVyaXR5LCBhIHNjcmlwdCBiZWZvcmUgdGhlIHNjYW4gY291
bGQgY29udmVydCB0byB0aGUgbXVsdGktbGluZSB2ZXJzaW9uLiBTbyB0aGUgbGluZSBjaGFuZ2Ug
b25seSBpbXBhY3QgQ292ZXJpdHkuDQoNCkhpIEp1bGllbiwNCg0KV2XigJl2ZSB0cmllZCB0byBh
dm9pZCB0aGF0IGJlY2F1c2Ugd2hlbiB0aGUgdG9vbCBpbnNlcnQgbGluZXMsIHRoZSByZXN1bHRh
bnQgcmVwb3J0IHdvdWxkIGdpdmUgd3JvbmcgbGluZXMgbnVtYmVycyBpZiBhbnkgdmlvbGF0aW9u
IGlzIHJlcG9ydGVkIGFmdGVyIHRoZQ0KaW5zZXJ0aW9uIHBvaW50cy4gU28gdGhlcmUgd2lsbCBi
ZSBhIG1pc21hdGNoIGJldHdlZW4gdGhlIGNvZGViYXNlIGFuZCB0aGUgcmVwb3J0IGZpbmRpbmdz
IGZyb20gc29tZSBwb2ludCBvbiBpbiB0aGUgZmlsZS4NCg0KSeKAmXZlIGNvbnRhY3RlZCBTeW5v
cHN5cyBhYm91dCB0aGUgaW4tY29kZSBjb21tZW50cywgdG8gZGlzY292ZXIgaWYgdGhleSBoYXZl
IGRpZmZlcmVudCBzeW50YXggKG9ubHkgdGhlIG9uZSB3ZSBrbm93IGlzIHByb3Bvc2VkIGluIHRo
ZSBkb2N1bWVudGF0aW9uKSwNCkkgd2lsbCBsZXQgeW91IGtub3cgaWYgc29tZXRoaW5nIGNvbWVz
IHVwLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

