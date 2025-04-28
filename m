Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6AEA9F47C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 17:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970828.1359407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QSu-0007eU-Vf; Mon, 28 Apr 2025 15:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970828.1359407; Mon, 28 Apr 2025 15:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QSu-0007cG-Sl; Mon, 28 Apr 2025 15:32:16 +0000
Received: by outflank-mailman (input) for mailman id 970828;
 Mon, 28 Apr 2025 15:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+1Z=XO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9QSt-0007bQ-GD
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:32:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2416::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f38ea1e4-2445-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 17:32:12 +0200 (CEST)
Received: from MW2PR16CA0043.namprd16.prod.outlook.com (2603:10b6:907:1::20)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 15:32:07 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:907:1:cafe::a6) by MW2PR16CA0043.outlook.office365.com
 (2603:10b6:907:1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 28 Apr 2025 15:32:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 15:32:06 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:32:01 -0500
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
X-Inumbo-ID: f38ea1e4-2445-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUjpN+RjZUnnM+b0Ye57E7ipDxZQS4egQKDxPzAoveOLYJ2PUnDDiZcj5mC4MZ+102rmtRfoDEf5++cAIM+1msx/uRtdVNMMOJrmY6hgNhghE/j6lpcMradednfcTQi862FiL+PzXrLcOmdwfZa1ba37UdM6mUAxCdfPe4X2EwmHJTX+ELSUvyydYbsbQjdYn4IjBUBQEDaU7AdpTt+5rQbO8TEA/Iv+Njl7qOWVP7Fpz0+Hu8rQVOY0uWdmxjfP4d+C5ZZvs8jDACbOkPr2O7sFWxvqmJKSkcqn6LAsTNgF4H5xkSENPtcWbjqvbFvHYjru9j2+0wKHJvRvsnH9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1MvL+yIuix3zjIxsZ59EzJqGTka7oPPVDHjEUjSTg8=;
 b=nPaYgfBbE2HZ8+0vXib8HbIE/WlcBgQelDnowGcDI2V6mJr1ZUwTUaFQMw8Y+pUD4F6pUFo1bGfdMY9BlPu1ByVeEIlVGSLI0filZsc2X/xP6YF1Jx9dZ28QvhGgxtEA00GVyS8nQXiUomaXJtmxw1QL2PbssErCH1AMD5aH5gwMPxGuL4qRzG+lRoOxn4wnWfz2oX9lxewdWuBDfRgbl0+FfIe21kctH154KRRbqAqa+nc2eH2ZGqMDEAkX1vdl4s4nru7ZQ0ZRNfOrE3pAd7/dlN9wboySRLo4K0ZmXXJS8h0vD/bzJYnFa313i54lLeskdFMcjBut0uMpDZsdJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1MvL+yIuix3zjIxsZ59EzJqGTka7oPPVDHjEUjSTg8=;
 b=Ncq1mUA6m4BLEbp/IMDrbjjgKI6wrs8mREtM0TEEyAseUac+9UH3QG4Twi7dvnFTRhkTDHWB2BvrZAJwPnzCdLWTS69CEa4d7Q5SPX/1rfJ0eUFEA6XZ9GcBtBO81mcqlUL8QjDhpHgK0c8njb5A7y6EeYyScSeQukf9zWOK2zg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Apr 2025 16:31:59 +0100
Message-ID: <D9IDPE8Q5XKK.2CSC9N1BMSU2Y@amd.com>
To: =?utf-8?q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, Anthony PERARD
	<anthony@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com> <aAoHOrcZ5LlhEObL@l14>
 <D9IDA8NYNZUG.2Z1IGCDV4YI5Y@amd.com>
 <198ec36e-15e3-491a-bd15-d440d9d578da@suse.com>
In-Reply-To: <198ec36e-15e3-491a-bd15-d440d9d578da@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e3969d-f7f0-47f7-d906-08dd8669d586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3I1cTl2SmxFTXUyRjZvN3cxNmZxUDdMMEdsMTBRREQ4SUY5dVJ0ZDNxdUZJ?=
 =?utf-8?B?NGMzdHZnN3BKOFQ3RUdnVXUzNWNtcms3RXE1bExlMmZmdzZvTjVqU0F5dG5O?=
 =?utf-8?B?bGFQbDVZZ2ZBNER2aE9MQlliVFBJeFhVK0dLdFkxMUl4aGtWeUEwWEhJUEZO?=
 =?utf-8?B?b2VHRXNkcVZMaVhsWGJ4eGVhTVhZVE5aMGREZnpscllwUGFYNkZKMEtHeUpj?=
 =?utf-8?B?NUIzazdFc2NOaXIxL1pWbkphelVFcm82WFF5Y0lPSEpQTmNkNHdzeWV3aGha?=
 =?utf-8?B?dnJ2eXlpaW93Y0RRbTBlOUpxb283UXcvcnlCQUJSR2VybHY4R3V0M2RDZy9Z?=
 =?utf-8?B?S1Yrc0U1M2lvRzNQSGxZWTNadmM4MVZrWmpJbjVhY0pBbHFlQ2pQQ1VqbTZI?=
 =?utf-8?B?dnpJNVRLTFA0VXhWZ1Y2WFBoTDMxN1pxNUtvRit5WWNqdmR6TnBqT0RxZE5O?=
 =?utf-8?B?OTBhekh0dXRybmlLYUpNOGRUOG1rLzNxSXdIU2NwaVZ0UG91cDdQUmNzUU5G?=
 =?utf-8?B?MVJ5QmlLc0tPbDJ1U2VvMDVZVXl0My9CTm8yVVBkamhmZmhsZW4vQmVscGpT?=
 =?utf-8?B?bDJ0NE5nKzB6UVF3enlURGRMVmZrcVVzZ1FqaVYxclUwQ01jMS9RTTVpRTQx?=
 =?utf-8?B?TURhTk9TbHZzMmpXVUJwb3QwZjRWVE1oYktiN3lCUlhkSm51NlNvTUt3Yk1V?=
 =?utf-8?B?UGwyK1BjME1FSkh6Qkc4cmU2eXk0OExPeWRDNTVQMm9NaktQSEdVTkJnbkxk?=
 =?utf-8?B?bno5aGVTOXFGT1B2d3BMSGpnOXBWMXFEOFhjSThtUTV4c0tKOXh5SnJYU0lF?=
 =?utf-8?B?WmZpc1dvYTM4VW96ZnQ3SzU0MkgzZmFYOWIvcGYycWpNbHhFSXRxQ1pDOTEz?=
 =?utf-8?B?d2dIc0t5cXpVa2FuelFNbjY3VUF2dVF1YkxxWVM4d253OS9oM1NYaUJLN1Vz?=
 =?utf-8?B?Y2FYWVo3ckszSUVDaDlTbUo4eDBZbGhkYTNnRGVZRXZ2M3FDQmQxV29yaGF0?=
 =?utf-8?B?dHQ0ajhHU2h2dGpFM3V2TkN3aXNETjlOeHoxYlBienRBeUU3QnB1dW5BTEND?=
 =?utf-8?B?OWRBYnRWTTViVW5pdFdWNnhFekNIMUlRa29nQXJaVE5Nb1dFTm1GUi9NT1pU?=
 =?utf-8?B?N01XaXRIVy9neVQvcURiU3FDdUlmbENKQ0xHZDdBNmY0ZDRaOU12YUxTbTNm?=
 =?utf-8?B?R3pWV1N3TDJCek55ZGN4QkF4bVQ2bDEzK21yU21YQ2lUczE0UnZHQy82YU9B?=
 =?utf-8?B?L3N0YzhRT1IwaHp0V2s2VVFVeTVFOFI1L01NbTVDSGpiL2ZGR00zVHBVdWhU?=
 =?utf-8?B?SmNrWEtocUo0WGZTQlhld25tanZOOXV2cnhjZEtocnJJYkhmSmI3OXB4NGpp?=
 =?utf-8?B?WlBzK3dNL3RQZ3ZGTXJnYUVPTVlidXJSM1YxV3N4WDZYVWhQVWNPdU5Sd3V0?=
 =?utf-8?B?bTdFK1d1VWJNZkEzdHVQaVljRnBnU0ZocUdYcFZvMVF4ZkN6THBzdCt5ZnM1?=
 =?utf-8?B?clBPNjFGV2hINUo0SW5PdnJVb2FYa2ZkdFZ1eWx4WVUyRUlycStnT2t4MnFi?=
 =?utf-8?B?aTFwdnB6UHlPQmJ3Ry82K25JVGpvRmYrc0Z6aG9ycnd3QzNLZ0t4dkMyendF?=
 =?utf-8?B?aUZhUlJQdnN4cmpKY1BwU1dERnRLME5pc1cvN1pESFNVbVlIbG9zaTE0cDBB?=
 =?utf-8?B?NDRQZG5xNDdkZE9tQ0doWWx0NUtyVG5Wem92SnVnSlJEMVpDc1QrZE1GUnFH?=
 =?utf-8?B?V09RNTM1Z3duU0wycDZzNUQyWnVOY3JBdC8yL2dyeXhOYUdyeUt1WUhPZ0dG?=
 =?utf-8?B?QnVzaTFMWnI3WkIrUDJhYkQ5WWlJd3hBM3V1UExIeDhXUE81L1VOYndvblFB?=
 =?utf-8?B?V1dBdUpxQmZnMkhUa3UyT0diQjdIRyszTWJocGpsT25XQ2dzT0NzV3VEYkw3?=
 =?utf-8?B?UWo4aDdnemhqOUtGRklwQjkvRzVYUklhSkRuYzJkZndwYzBJZUQ5K0JzR283?=
 =?utf-8?B?YnpwSVNTZ3loWThvY1ZZN1VCdWxHZ2d6S1BNZm1DUGliZnNUb1FMeGd1SGpV?=
 =?utf-8?Q?MfH9LL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 15:32:06.6990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e3969d-f7f0-47f7-d906-08dd8669d586
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885

On Mon Apr 28, 2025 at 4:15 PM BST, J=C3=BCrgen Gro=C3=9F wrote:
> On 28.04.25 17:12, Alejandro Vallejo wrote:
>> On Thu Apr 24, 2025 at 10:41 AM BST, Anthony PERARD wrote:
>>> On Tue, Apr 08, 2025 at 02:35:20PM +0200, Juergen Gross wrote:
>>>> @@ -1903,10 +1894,7 @@ it may be useful to request a different one, li=
ke UEFI.
>>>>  =20
>>>>   =3Ditem B<rombios>
>>>>  =20
>>>> -Loads ROMBIOS, a 16-bit x86 compatible BIOS. This is used by default
>>>> -when B<device_model_version=3Dqemu-xen-traditional>. This is the only=
 BIOS
>>>> -option supported when B<device_model_version=3Dqemu-xen-traditional>.=
 This is
>>>> -the BIOS used by all previous Xen versions.
>>>> +Loads ROMBIOS, a 16-bit x86 compatible BIOS.
>>>
>>> This option is not valid anymore, libxl will complain with:
>>>      "qemu-xen does not support bios=3Drombios."
>>=20
>> Sounds like a good time to remove bios=3Drombios altogether and strictly
>> support bios=3Dseabios only (plus the override).
>
> Fine with me.
>
> But probably we should NOT drop building RomBIOS, right?

On staging/master? I don't think we ought to waste cycles rebuilding it.
It'd only be a dependency for stable trees, so shouldn't it be built
there instead? Then by the time we don't support it in stable either
(because they all went EOL) it'd naturally just stop being built.

The mechanics of how that would work I'm not sure. We have per
stable-tree pipelines. Do they build everything, Anthony?

Cheers,
Alejandro

