Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMZ2DodDDGr/cAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:03:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9457D1BA
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312778.1582874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIE6-0007xh-1p; Tue, 19 May 2026 11:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312778.1582874; Tue, 19 May 2026 11:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIE5-0007v9-VT; Tue, 19 May 2026 11:03:05 +0000
Received: by outflank-mailman (input) for mailman id 1312778;
 Tue, 19 May 2026 11:03:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wPIE4-0007v2-LY
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:03:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIE4-00D9vM-0b
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:03:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a0c4362-2eae-0a2a0a5409dd-0a2a45068168-40
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:03:03 +0200
Received: from [40.107.130.141]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a0c4367-7371-0a2a45060019-286b828df8c9-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:03:03 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAXPR03MB8051.eurprd03.prod.outlook.com (2603:10a6:102:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 11:03:00 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:03:00 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZMb/epAvqDcokPlhpo9aKZxmAl8NSWhllt5Et9+U7YeHTfIuSYq/UL+ywq0+QPrWF00VtPB6F5hbC3q4IIhClilG5cdSP/uyRWTPPoW5R4VHA5wj/m07e54C7PQiLEyAdpfEdE1zFReQmo8Tho9HOPfniyibmKQtjfCisMXikBpBd3Biv8/EX8ovUhS195l/rTy8XhAIl5TyY3rUftJji7E/lrsKmNVRhVEQAXc/QR1qcfW3XRdHvzqB478ENJq3UrV0mh54+cFExii7iEySP1xyUtSk1Fhoq3zwFsrbEfk76KqPztg3Ysdxf+jcTdbhk0md1WoGZjojKhHS40weA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xO4OPw0UJmY4sskhJ9357fn+X2Reta1/dye1Z+NHLck=;
 b=ve1JSmUFKHrVlXgZ5xE2MipUJKENm1BSG/Aby6gEsEtPTyarBeOI9fzDbvjycXwMTIESZVYa5RqQE3d1Izx76Iz9rvyJKDLdrISJLNFiYfQoNXah8HYN9992d2573APervEhUKRbIyrAGy6bZjRT0g1WEE+nPuMcbycrAOSnAWu+1CYtxpLt2LnrRD7qTy6Ujuld9fTHtbKrvKxDhlUWb2OkA4mccBhKWYViM5DewTVBYEkRhAMDeMfGBF4pQFsmjZtthaKLan4JMP+gB+krObej/xQ45XMH6fKcXpPaGxL3YBqjEdauhgKOWGMbLEa71GWqzH5Ro6FH3NRRga9I6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xO4OPw0UJmY4sskhJ9357fn+X2Reta1/dye1Z+NHLck=;
 b=CVTsweiOzqRZ9PfCKnHabIAKEhacPqxKunioZDjyU6MBeGLH9ouKYv0jqytD1Qpf5orIA3PEKbyHHumd8p9X36eoKoPrUZxDb74kttcjQ+4L7y64ApO91Ie2iJLXgVCSVZeaMO5227lIBDamRhrFzrlPf2QxEXBCTb4q6MwVy9SKTkYNX3F/oX28DJ1BEqOL7r+b/obtxY2Ds0LN4+NWzyEpTEoy8CvRw5yVld32iqmllw7ILKqKASaysoiK6OUX1LLyOvAL67iKmnU1sDZ/NPDAyjDF8xJ1msiq3Zr3Egk41/u0/N+pGuwEKgp5oVTycs0I+RT8BYC4BKXFipOVdQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/eclair: export XEN_TARGET_ARCH during
 assignment
Thread-Topic: [PATCH] automation/eclair: export XEN_TARGET_ARCH during
 assignment
Thread-Index: AQHc53oVx3/uBPUL1EWf6nb6ZvtStLYVKjCAgAAE+AA=
Date: Tue, 19 May 2026 11:03:00 +0000
Message-ID: <50f31733-3048-4512-af12-50dd9ba3cf8c@epam.com>
References:
 <8b3120f7302e591b2828cb77c5f903c84149d498.1779186401.git.dmytro_prokopchuk1@epam.com>
 <0700a54389d4071c7308b8eb3a52c9ab@bugseng.com>
In-Reply-To: <0700a54389d4071c7308b8eb3a52c9ab@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAXPR03MB8051:EE_
x-ms-office365-filtering-correlation-id: 60dea3a1-7f7e-4ca2-6bcd-08deb5963132
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|56012099003|22082099003|18002099003|11063799006|38070700021|4143699003;
x-microsoft-antispam-message-info:
 mfQ14nCvZuHkV3fdJy0KpHYaduGj8A2cStge5oPiw3T0A1u36an4XvlSl0lxmEDdfDAYyln1p8c/9DYThOtgoER7w3h3bQEbvsylFkp4NLvCV0MaAamYkuRI5OGdaaPS99Sag45WsgdQ7urnxyxpaFpDF4sgBiNAxGVkioJF1Xqghj1boPkcIuyDWkOHOJjc8Z4xtfIyOmy+4Lso8cexKVUL9neDszVeBZ2bcpooOrAnPL1n5UlKDj5dKA5QLcoEYY0J299+bEMh03xv3DM1vxAzDybL4BtYt6xKE8e0gIud6ckNgsWH2r1MgiLtse1R2cOR7Xr46PJUXed2JZBD9amoOxc/ahESdu0g+zd91FngzHMEWN4QnFs20pELrdLSzqN9YFjnacA41r2M2t4aSmlW9pf6jCLlZN/I0H6LmrUkVm+oGntpfAJn8nIkh9fyiZP4aOnyBZuqN8y+cy1+Ug+Q3JxPl9KOGmaWpS2XSu9NFtgEu+66azpv0M1uISzYX41L2XIY2SHRQPeQtjy7yV+856KAoIFkvoA9x/IeyjS8/1HHDgt+R3bLGC7WehKd9bvBggjCmNskq/tQSvUovskTYGlcEG9OKLqBINMb+7IlbIdnjvHUy78QmKx9yq0K7ScEZdsS8dCGzDba9ff9abtfCCsZKgAT6pz/Eqlp6wH4gRWGIOmWver4MxAahGO2DKkja/MPeuvbIfv+ckEZ3LvfMvbp2j5rAo54aComza61UPClry99P3RLEJ16CJk4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799006)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkQxRnNvcFBTSWxGcEl4bWh2aFBLajNrbEc1bzk3NXJaMEh6Mi94REYwNEQ2?=
 =?utf-8?B?VnJjZW5acysxald3Yjk0a0t5YU5lL2ZqTXVWdVdtMHhpaUJ5bmQ3L2N6SXk1?=
 =?utf-8?B?OUZzczlpVGo4L2J1MGd1QnBTOHVpRXVJVTNrTm9DYndnOUlXMjY5cTdmMldj?=
 =?utf-8?B?bVJBVkhtRXc4T1o1MmtwTEJTZEc3cWtHNXh0WWtKemlTSTdEeDc0V0c2OVNq?=
 =?utf-8?B?czQ4L0ZMTkhnc3grdnBtb2JHcGM1Mnhxdlh6Q0Jod1poTzNpWmxQM0syZkNH?=
 =?utf-8?B?RlpNNldQaitjdk05QUJtb05MNVpjV2xOQkRmQ3oyUXEvbUl6VngwaTZDeGd5?=
 =?utf-8?B?cVJ0ZUhtbGFlWXUzSW9FL2NCMCsrVVRjMTJLS3VhcDBBSkxIQzh4UUc5S2Vr?=
 =?utf-8?B?MTc5TGNjUHNQMUpNaitFSXVpeHg2UkNMT0lGSHNpZ0VLVEVYa2xDQit3MllC?=
 =?utf-8?B?bDV0TEZDaS9Memx1VEFRT3FxWFBqVmFYVnVTWXJqb3o3OTVrUXRpckhieVdS?=
 =?utf-8?B?Z0hWSnRQaFRFa0VCT3Zvb2VZR3VSeVVVOWtJZGdHM3NjcWx4L1NDSXRWbWE3?=
 =?utf-8?B?SllUeXVhWHh4Yy9CNVkvS0VqV0diRlFOUE1VOVFTYyt5Qnk0T0ZaaFVyNVA0?=
 =?utf-8?B?dkl0a3EyYzRHUnQ0RFF5eHJVRm82ZUVDeXVRajZQaTU5UURsUDZkOFVNZ3oy?=
 =?utf-8?B?d3lPdzIzbnZvM0p1cldvK0JTQjk2ZmpyMmJNOVJvK0VEOXpwSWJnTVBtNU5D?=
 =?utf-8?B?SDZSa2xWUDFzUTgxcnd6SVZOV2ZMY0pOUVNzMi84U05hc2lVL29ydzdscEJa?=
 =?utf-8?B?b0w0aUNBamlBaHFXY1MwTVo1SU5WNEtmRjNZL3JDRmZtVUM5N3Q1Y2V3c0VR?=
 =?utf-8?B?ZFc1OCtHZGJESTMyNUpnWGR6RnErMEUwZWJDL0dWQ1ZIR1FhNVRyb0xFSlZk?=
 =?utf-8?B?c3NiSW5Pd09KZ2pCcmRDUWtFVWlqYUlVdTRGT1ZrUVZkYWVYWkZtMUI0VER5?=
 =?utf-8?B?MCtrRDN5YUk5QlY5UGh2SWNhQ1Fnbk5qcU5ZcThwR3NXL2FXUStvTENsdmRm?=
 =?utf-8?B?T3hRMGNPWDEwWmJGdEFvbVRIcVJTV3laRDZhV0NYaXZjNFF5RDdwcGJMRFBD?=
 =?utf-8?B?SlRzaERsQm1IV1dsUm1oQkgzZENBclZlalh1WXpNd2dobSthOUNNTlFESGxl?=
 =?utf-8?B?dytPM1l0S3czRUNpVGJQQ0Z3QlUySmwrYVlSTklKcXZHVGthT2oxWmM5eUFC?=
 =?utf-8?B?dm5NL2lkZS8xVFRXS1AvWUlSN29vUFlBbFl4QnR6eDR6NnJ3VFR4V2l1aHk5?=
 =?utf-8?B?SDlEK2paMGNHMkd1c0J1bFM4eHVoNWZSaVFkeEliUXRaVFFqZXozaTU4SkNw?=
 =?utf-8?B?T21YQllhTFhhY0Z0cVVOWmV4aUM2a01QK242WmFscEpwU1FDZUlCWE9ncDgv?=
 =?utf-8?B?Y3U0Y0Q3c0ZOTmljYnN6c1B6SDMrQTNoc0ZWTlhsaEpGSnNqOUdCMkNua2dU?=
 =?utf-8?B?SmdJT2V0SzB4OWR5WEdLTXpzdzVmc1lCekpMT25LdTRSOEJSNTVZZDVzYmF6?=
 =?utf-8?B?OVdlYmprYUx4akNQWTFHUWxXRFQyK2hKWjlxZ0pCQ1hzVXBkWmtFK3A2L1Jj?=
 =?utf-8?B?TnJPSjY1bEEwMHh3djZGSCtLTlJRcmNnUmEzT2FQS3ZwZnhnWmhMblp2eHE3?=
 =?utf-8?B?WnBWTnJKK0R2ZzRxbHpHYkxXRW5BWVlNTFhaNHV3RGw0M3M3ZEF5NjVhMkdx?=
 =?utf-8?B?RWRNdkNzMThrSW5KdzAxc2hxMHZXTGloKzBML1c4OW9WVzJsbE1mZXkyNTdY?=
 =?utf-8?B?L1ZrcndaNWgxaklXQXdzRmtvaTVhR1NEL1ZjeExkeGJCUmx0WmhVbDdrQk9C?=
 =?utf-8?B?dWtIZjQwUVVrVjZxaWJxK1hRRlFxeThQbko1dSs5cU9pM3NKMFhseDR1bWxX?=
 =?utf-8?B?VWlrMlVJOXF3WTNyU1hsYkJ0YktWS2pIRlBkNHY0ZSszcmd0dTk4UnduaHJy?=
 =?utf-8?B?Y0NaSXFJckZCMTk0aUFkemV4RndWYUZ5V1dtZUpMWGFhMTFqQ0theEhaMFEy?=
 =?utf-8?B?ZTBkRjFoczVSMUt3d1ljNFhMdTNPQ0pWUmxXcVVsNEtKWkNwUC95R3VaM0F6?=
 =?utf-8?B?eUJiN04weDE2ZzJ4UW9QQ1FNMmRQTlFHdUY5aVkvV0ZWbTdrZWVFaElpRFNu?=
 =?utf-8?B?YVk4eUtPU2RMZmFUQXk0ZERSZ0E4SUorRHZBWWJFYzJDak8vWWlZa0NRQ1FZ?=
 =?utf-8?B?eVl4Nm83bWt4Tk42bnZkTHFZK052SFo5cy9uZGY1enVyeWdEY2FjWW1DM0RT?=
 =?utf-8?B?ZU9PenBJRXZRbllXRjkxMUxHZHNvUmFLcWhMM3Q5RTlidU5GNmhxRFEydkZ5?=
 =?utf-8?Q?BMKVYlcP072SyCwQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10DB9017EE2D7648BC8BC0F14C275D3E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60dea3a1-7f7e-4ca2-6bcd-08deb5963132
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 11:03:00.7780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdnRtn/tIWIotmkpTBSj9fNXGlv3jgu6sBfnq5NDaJtHRBwFD07zyCaCJfrR/VGQJE8iEpowpibxelBNpUj89Fv0v7uka5kkmHggaTfN+o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8051
X-purgate-ID: tlsNG-16d1c6/1779188583-7FF7BD75-F2225C33/0/0
X-purgate-type: clean
X-purgate-size: 2176
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:email,epam.com:mid,epam.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 96E9457D1BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gTmljb2xhLA0KDQpPbiA1LzE5LzI2IDEzOjQ1LCBOaWNvbGEgVmV0cmluaSB3cm90ZToN
Cj4gT24gMjAyNi0wNS0xOSAxMjoyNywgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gTW92
ZSBYRU5fVEFSR0VUX0FSQ0ggZXhwb3J0IGludG8gdGhlIGFyY2hpdGVjdHVyZSBzZWxlY3Rpb24N
Cj4+IGJyYW5jaGVzIGluc3RlYWQgb2YgZXhwb3J0aW5nIHRoZSB2YXJpYWJsZSBiZWZvcmUgYXNz
aWdubWVudC4NCj4+IFRoaXMgZW5zdXJlcyB0aGUgc2VsZWN0ZWQgYXJjaGl0ZWN0dXJlIHZhbHVl
IGlzIGNvcnJlY3RseQ0KPj4gcHJvcGFnYXRlZC4NCj4+DQo+IA0KPiBEaWQgeW91IHNlZSBhIGNh
c2Ugd2hlcmUgdGhpcyBpcyBub3QgY29ycmVjdGx5IHByb3BhZ2F0ZWQ/IEFzIGZhciBhcyBJIA0K
SSBkaWRuJ3Qgc2VlIGEgY2FzZS4NCj4gdW5kZXJzdGFuZCwgdGhlIHZhbHVlIG9mIFhFTl9UQVJH
RVRfQVJDSCBzZWVuIGJ5IHN1YnByb2Nlc3NlcyBpcyB0aGUgDQo+IGxhc3QgdmFsdWUgc2V0IGZv
ciB0aGUgdmFyaWFibGUsIHJlZ2FyZGxlc3Mgb2Ygd2hlcmUgdGhlIGV4cG9ydCBjb21tYW5kIA0K
PiBpcyBwbGFjZWQuDQpZZXMsIHlvdSBhcmUgcmlnaHQuIEl0IHdvcmtzIGluIHRoYXQgd2F5Lg0K
SU1PLCBleHBvcnRpbmcgZW1wdHkgdmFyaWFibGUgbG9va3Mgc3RyYW5nZS4uLg0KDQpBbnl3YXkg
dXAgdG8geW91IHRvIGp1ZGdlIGlmIHRoaXMgcGF0Y2ggaXMgbmVlZGVkIG9yIG5vdC4NCg0KQlIs
IERteXRyby4NCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4gLS0t
DQo+PiDCoGF1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL3ByZXBhcmUuc2ggfCA2ICsrLS0tLQ0K
Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9wcmVwYXJlLnNoIGIv
YXV0b21hdGlvbi8gDQo+PiBlY2xhaXJfYW5hbHlzaXMvcHJlcGFyZS5zaA0KPj4gaW5kZXggZTk0
MWU2ZWRjNC4uZmRlODNjMmQyZCAxMDA3NTUNCj4+IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2Fu
YWx5c2lzL3ByZXBhcmUuc2gNCj4+ICsrKyBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL3By
ZXBhcmUuc2gNCj4+IEBAIC0yMiwxMiArMjIsMTAgQEAgaWYgWyAkIyAtbmUgMSBdOyB0aGVuDQo+
PiDCoMKgIGV4aXQgMQ0KPj4gwqBmaQ0KPj4NCj4+IC1leHBvcnQgWEVOX1RBUkdFVF9BUkNIDQo+
PiAtDQo+PiDCoGlmIFsgIiQxIiA9ICJYODZfNjQiIF07IHRoZW4NCj4+IC3CoCBYRU5fVEFSR0VU
X0FSQ0g9eDg2XzY0DQo+PiArwqAgZXhwb3J0IFhFTl9UQVJHRVRfQVJDSD14ODZfNjQNCj4+IMKg
ZWxpZiBbICIkMSIgPSAiQVJNNjQiIF07IHRoZW4NCj4+IC3CoCBYRU5fVEFSR0VUX0FSQ0g9YXJt
NjQNCj4+ICvCoCBleHBvcnQgWEVOX1RBUkdFVF9BUkNIPWFybTY0DQo+PiDCoGVsc2UNCj4+IMKg
wqAgZmF0YWwgIlVua25vd24gY29uZmlndXJhdGlvbjogJDEiDQo+PiDCoGZpDQo+IA0K

