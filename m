Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CmOCosb+mkJJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 18:32:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1304D1570
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 18:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300884.1575332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKIfx-0008WI-OZ; Tue, 05 May 2026 16:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300884.1575332; Tue, 05 May 2026 16:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKIfx-0008UW-LJ; Tue, 05 May 2026 16:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1300884;
 Tue, 05 May 2026 16:31:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wKIfv-0008Ty-88
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 16:31:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKIfu-002rwh-Iz
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:31:10 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa1b4a-bab6-0a2a0a5309dd-0a2a4509bbb0-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 18:31:10 +0200
Received: from [40.107.209.43]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa1b4c-2497-0a2a45090019-286bd12bf7d9-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 18:31:10 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by DM6PR03MB5209.namprd03.prod.outlook.com (2603:10b6:5:245::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:31:06 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 16:31:06 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quHbZgRZqUJKNkQH265J7o7HtLJ7viSgeHEx0IbOjNiQAt06C0yYSRqZwCRuMyyo5rQ3xt8CxInv7q3EWm8FUT6CZV9agmdY7yXWLSj1KKxH8Rl9Kbws8PelIeHGz4XLLvAOtf498w6DEiSozoAXW5Sr3TGOYs9BJMQDDi3ZNvv2qU3o0Rwyj4Nrt/w3dGvBzdSSf1TrqqznoUB7pQTBp1bJvR9fuTDcg7+WwiGTLqauo/+BSy8fQmiEb4UiJ7x2FLWcR4bKSt+M08qaRbW9++dGcAHL9X8x4EoltzxcEmgMUGfyhiWUYNEO95dPDdvto3C35Bwhc3VDCxYYHaCtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nqiA/BVuEQkhZmEA9uB1+MCTU4aOSAawbd56ML86Pw=;
 b=WcZVD/vj8Gbvu7IEk360sLJr0YstTrNJQK55XD0oP66Ogo8dm5TskO9gkT5Yz147fbnpHydOuP72D8BsO9wyypBW0VgUv+14SgHSff6nqV8jvBeM2s2NagmMPZVxEzCVsBMgT256e7GI9or/DduL9fWDQrd9LvWsiESVqRFZGZ8gnctrYMLoCVmzvbHLO/1X2oATNC+RSlpPfQ7D1o0fXGSmbnb/ADKtr/941RazcdBrykoxNgxXUpYjA2get77cuMfe9SiT4sB9APSSepyjp7pvpdYap/AM2cX2Os9dPU3wwlk1TvcpAUEpNR2OR+W8tDO6PLHuK3366S36XGBM7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nqiA/BVuEQkhZmEA9uB1+MCTU4aOSAawbd56ML86Pw=;
 b=kDBOcyn4yKzv002M1PxOP0XqjFNjZ64jnZ/si0PIrrW7HrfzJQIyC2apw6nOfquaSjwr92PcZZPMW1tI0JzTKSoq+AEEie5Ia++h14w1AX7eobwfHnwfE5ttuhe7M3RU3OmF3W3uYYcjyuaEcg+57aP654LjW2rH3mSoOJh5K4s=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later
 functional changes
Thread-Topic: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later
 functional changes
Thread-Index: AQHczBIVjQaUKhelwUCYpZQxzVcChrXqzwoAgABXiPCAElKBgIACIl5Q
Date: Tue, 5 May 2026 16:31:05 +0000
Message-ID:
 <LV3PR03MB77072A8F8F64A584929B1FB6873E2@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
 <5302d33e7e896347acc7a8212df4f28ea098e28e.1776172526.git.bernhard.kaindl@citrix.com>
 <3df7352b-7502-4c2a-bc3f-0cb4fa7014cf@suse.com>
 <LV3PR03MB7707C0637B5F73CA26E3F4D4872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
 <3867aa2d-ed58-44dd-bc06-94643ee5918c@suse.com>
In-Reply-To: <3867aa2d-ed58-44dd-bc06-94643ee5918c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|DM6PR03MB5209:EE_
x-ms-office365-filtering-correlation-id: dd5a01a4-3783-4b58-a8f7-08deaac3b4aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 MXSyJI9xs8YkdReWieHBYQaDBWlqusWHuElpF8++GRxPPiNR3ekwBxo+gh6p0dWJVqmj18/nVF3CS1UYtTiRkNlnqgfHOsfFpf1NOnGeJhBAyAjIjIHuPCfD+zdh2OfzU0ICg66DRb8tuSJLxc9qC2jLnrCP0zaiCoHm6lsCKdQJ4CTzfVa0grkFibDoMfNQWqrVk6N6OKoNiMi6dqR7Bo4vkobKdZH+DIUxYT1GowUAIecTg0GyrFOQ+0uJKLDB6x0Eh1sEki69o0QUu4GobLc7ceKvXVQ0/yvSKpZRZr+w9S4d5cBvcRv9zEjsv36pF50s3r0X1spvAS4Vd8WpHChps/QQpMhCp/NUn5EqToPa0tURe00edEEuLg0zreev7aZoivJruvjXCHzpp99+GzBNc8dDaMnO/KN/hwa1RmF4teeh4sYhfrrTZFY3Vm2s4O/dboXWXrEQEHp+gnheM8tfaUOaPWh+z5/CTL8059GSYEPblDUjNhxvHveHpqok2gsVlV2iDd1raV+iGzzszr/omccVUt5swIj5G9qJXrDxwpYZNWNfNZIfiTRbof6uXJgH8rNE2hadA5THm23BLevMON9KuBMJwY4naRO7feaZmEG/P8mkImfq4uudI7esvqoae+5JBOV56WxaaNTe6l8422uHrPK5S9FyKuCXLcIolyPtZERL6g/4yL4tPdrIv85yEGGjKzOLJZWpDJXcrpBA7yGrjW7Av8tCHtaEjNMn6QAlvWb6JDgUeNGAJvSa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFUwUC9SWkQwUTBYU1NlYVhKM0lBbVpWalNMWGx5VElIbyt5czRxcW93eVIz?=
 =?utf-8?B?M3VncHIramlTdzN6R29vYTZtVGxPa2R5amM5a1lZWXJ4L3ZIVUNBZGtDM3lq?=
 =?utf-8?B?cTFxTjJkMDBTMnJxWlBDR2JLN0NCMFQrdHZtcDU4Z1FHd0hkUGoyNmhTUlZ3?=
 =?utf-8?B?L2tod1N0U0JlSWpENE84WndvZnBwa29KUEpNQ2NqMCt1MXVna3BVNlNrQ2Ur?=
 =?utf-8?B?djZwenpxNWwzeFFSSHFTbXlya3owVHF1enBPd1JJbnVOeGZBTDl3UTdxdDI1?=
 =?utf-8?B?cVB1bHBPOVJDNDlwc0FMM1BIU1c0blJBQmtBV3lCOHVyYzV6Qm9BYWxQeEpZ?=
 =?utf-8?B?aXBBV2ludmViNmZ5NzQ0Yy9hdU5QQTZtVTljQjR4NGJOK2x5NFh0aHZ3UU95?=
 =?utf-8?B?VlNka21ET0JDNGU5K2h5c1puM2NURDEvdjJiOW1tclRnZVI1ZldwSXNralpj?=
 =?utf-8?B?MmJ5YTI0MVdlNGJIc1QreUJic2VQT0tNUjhFLzk1dS9RM2cvRUFmVVQveURJ?=
 =?utf-8?B?MkdBNFhjU0hndnNXNnJpcWM2KzdCalNxL3M1OEhRb3h3SUFWS0hHZ3liMHFq?=
 =?utf-8?B?MCtlaGZXVjdRaGNxcmRnaDZ4a1FLamZuenZiUmJ0NUpnV2puNUZxanNkdkh5?=
 =?utf-8?B?YTc0cHg0MmtkOHMvajFPYVZTdkVtN09uNWNXU3N4SFVDSlJnY3pPZkRvK0FL?=
 =?utf-8?B?Qk1qWDA4eVBXU0pVNVZDbnpQVXkwSzZ4Nm9kOEhLUVhZeFREMTBaMFUvbm9m?=
 =?utf-8?B?MGVmdWhrT1dRNTdmck8zVGtQZWFCMi95eEhLcGpJS2RFeDI0SGJXcVVkeDRi?=
 =?utf-8?B?R2dNTzVrcnl0QVZqYUxVWDVXNTZHWGltZUVEc3NuMlQxVXZRVWJWVmRhUEF5?=
 =?utf-8?B?VWtCUVo5MWRpeDREWDBkSnFoaGQ4ekp3R0ZnSzhtSFlJN2NsUS9zUzVzUWlM?=
 =?utf-8?B?UGRZUzJ2Mnd3cnhhK0tNbEJ1MzdENmNycW5CcFZjVHZJRkxmZllYU3lkMjJa?=
 =?utf-8?B?TDRGN3Zmd1VGUjQvaGowSWVaQVAxNy9lOE8xS3hoZ1dtUEg2RFRYZnVRc2c4?=
 =?utf-8?B?ZkNOZk0xSHhOYVZJbHpHaElZOEx6TjZnR05XV2NJb0YzQkFKdk85ZTAxbm9P?=
 =?utf-8?B?NmtBM0xCZjdSNDh3NVFTVWlMMVpabExMV0RldllaMnpCRW1PdDg1NGZvZlh2?=
 =?utf-8?B?QWVEVWZ4S29pOTVCVUdxdHRlM1NFZVNnaElhZXBSeFY5SzE0ZGgybU9OdXhY?=
 =?utf-8?B?eWxmSjQvSlU2ZDNqNkNOZzRIOFpIWWtEWlFvb2htLzVqSTh0WG5CY20wd3Ix?=
 =?utf-8?B?a1lDQlkxSUhmQVNJamF2bVAwd0JWYnlpU0V3QzNra1psMlZJd2tqWmtuSXRD?=
 =?utf-8?B?T2Vad3pOdE5yaFdUQUNROVVoTWFwSkpiQ2U4S1lnTkd1VWtpMXRqWXdJU25B?=
 =?utf-8?B?QVpwQVgwQkRIbS9OdlZHTnA5UkNMaFNidThGSFlUdE5CZE5aZFF2VWFGZW1s?=
 =?utf-8?B?ajN1eFo5dkpMRTdMQ0F6R1lQakhUdjlHWC9CZTdIaGdka01nUmdMdXNMTnc3?=
 =?utf-8?B?VkhjOEdiUmR1T3I4TmZ0dWJDSFJCOTZFKzhmS1NjSnFOaWxuUlhJZnU1WGpH?=
 =?utf-8?B?MFlnMVAxZ0RkZDFmWGhrVHFqMmpHVVByRGhrdmF3dGlub0U1Y0ZEQkdLejRt?=
 =?utf-8?B?VVhNN1hSemV6ejg3eWR1NUpRZGpScWpMZTFCVkJudUpCZmFvSXZBcXJUaW9m?=
 =?utf-8?B?NWlWOTl1eUdWK01YRTFjUTVJNHJCU0NjdEFWWHV0eFVYMWZjUStVUXZYZHZy?=
 =?utf-8?B?L3k2aFBPU2xmV0kwL05odkN4ZWJvTllscDM0WUt5OXUxdldjTjdWS01OdE9y?=
 =?utf-8?B?ajgycmp3RE5XTUxWa28yY0FlM2h2NlBndjJpRFUxeVJGQ0svdkVKS0R0VUg3?=
 =?utf-8?B?dTZVTkR3aGNjMjdVY3ozZm5TdGtJRWhqazRmbXVvc2dxNXljYnkzdHdacjVm?=
 =?utf-8?B?eFhBS21oeDNaNzRLNWY0NmVDN2dMUUVBOCtZZWVyUVVlTkl0VlJ2YTlJYXNK?=
 =?utf-8?B?SUd6bk42VTZIbFl3c1JNOUpZakZNUkhYUk1WNDREVWNDWFNDREI3bXp3S0sr?=
 =?utf-8?B?ZEJXVUw4SFJNVGhPa3c0dkNNTHZiSS84QkJ1alpNTGVveDJmRmw4S1lwUXlY?=
 =?utf-8?B?NlNQaTUyc25RU0RVRHdMUkRQSEJNTDNHQ3dXVnBZdTk3L29RRW1kTTNVR0pl?=
 =?utf-8?B?N1pVekw4NlhpZ2ZyV0ZQVnRzYm5lK1dmSmw3bGE1YVpSbnZ1cFpob0F4Rld1?=
 =?utf-8?B?QUNIM25qWGwrQnJ5QXhTbFZ5aWJncDYzNll0cWdhTWhvY2JML2pEOUxaeWdt?=
 =?utf-8?Q?tiQ7b8hy/+/ZaSMGd1OCb07Fa2PtLipYwENoPcrrn9mNS?=
x-ms-exchange-antispam-messagedata-1: UG31VL/MJ65P1Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5a01a4-3783-4b58-a8f7-08deaac3b4aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 16:31:05.9351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VyCjiKbhytP9FWbF1aVpyt3xayR3w1qlrh78QjSi/qf6K010/V70iZowd2NoQCmU1nEq7rj2ruMjTA99F9YGbX67trECpudz/hMge92BDfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5209
X-purgate-ID: tlsNG-bad1c0/1777998670-48AAEA53-07B76F2E/0/0
X-purgate-type: clean
X-purgate-size: 1314
X-Rspamd-Queue-Id: 8B1304D1570
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

SmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gJ05vZGUtYWdub3N0aWMnIGJldHRlciBkZXNjcmliZXMg
dGhlIGFyY2hpdGVjdHVyYWwgaW50ZW50OiB0aGF0IHRoZXNlDQo+ID4gY2xhaW1zIGFyZSB2YWxp
ZCByZWdhcmRsZXNzIG9mIG5vZGUgbG9jYWxpdHkuIFRvIHJlc29sdmUgdGhlIGFtYmlndWl0eSwN
Cj4gPiBJIHdpbGwgcmVwbGFjZSAnZ2xvYmFsJyB3aXRoICdub2RlLWFnbm9zdGljJyBhY3Jvc3Mg
dGhlIGJvYXJkIChkZXNpZ24NCj4gPiBkb2N1bWVudGF0aW9uLCBjb2RlLCBhbmQgdGVzdHMpLg0K
PiA+DQo+ID4gU3BlY2lmaWNhbGx5LCBJIHdpbGw6DQo+ID4NCj4gPiAgICAgUmVuYW1lIHRoZSBm
dW5jdGlvbiB0byBkZWR1Y3Rfbm9kZV9hZ25vc3RpY19jbGFpbXMoKS4NCj4gDQo+IE9yIGRlZHVj
dF9ob3N0X2NsYWltcygpIChzaG9ydCBmb3IgZGVkdWN0X2hvc3Rfd2lkZV9jbGFpbXMoKSk/DQoN
ClRoYW5rcywgeWVzLCBJIHRoaW5rIGhvc3RfY2xhaW1zIGlzIHRoZSBiZXR0ZXIgY2hvaWNlLg0K
DQpJIGFsc28gcGxhbiB0byBtYWtlIHRoZXNlIGhlbHBlcnMgZXhwbGljaXRseSBkb21haW4tc2Nv
cGVkIGFuZCBzd2l0Y2gNCmZyb20gImRlZHVjdF8iIHRvICJyZWxlYXNlXyIuIFRoaXMgZmVlbHMg
bW9yZSBuYXR1cmFsIGluIHRoaXMgY29udGV4dA0KYW5kIGF2b2lkcyB0aGUgZmluYW5jZS1zdHls
ZSB3b3JkaW5nLg0KDQpUaGUgZnVuY3Rpb25zIHdpbGwgYmVjb21lOg0KLSBkb21haW5fcmVsZWFz
ZV9ob3N0X2NsYWltcygpDQotIGRvbWFpbl9yZWxlYXNlX25vZGVfY2xhaW1zKCkNCg0KVGhpcyBj
bGFyaWZpZXMgdGhlIGRvbWFpbiBzY29wZSB1cGZyb250IGFuZCB1c2VzIHRoZSBtb3JlIGFwcHJv
cHJpYXRlDQphY3Rpb24uDQoNCkkgd2lsbCBzZW5kIHRoZXNlIHVwZGF0ZXMgd2l0aCB0aGUgdjcg
c2VyaWVzIG9mIGRlc2lnbiwgY29kZSwgYW5kIHRlc3RzLg0KDQpCZXJuaGFyZA0K

