Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOjaDF3OgWl1JwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 11:30:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CAAD7AC4
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 11:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219211.1528145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDg9-0001mx-3F; Tue, 03 Feb 2026 10:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219211.1528145; Tue, 03 Feb 2026 10:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDg8-0001kb-Vp; Tue, 03 Feb 2026 10:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1219211;
 Tue, 03 Feb 2026 10:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RKol=AH=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vnDg7-0001kV-RG
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 10:30:40 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f56da5d-00eb-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 11:30:34 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB6744.eurprd03.prod.outlook.com
 (2603:10a6:20b:292::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:30:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 10:30:31 +0000
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
X-Inumbo-ID: 5f56da5d-00eb-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhA5yvmpZE4zW3UILpC95vLObEct038WHF+F2AAEblfwiFbH++zcmoNr8Zf27u2FMHZn7MNTS54B2OQEXEB87iFo/hrGzA+THwasV+2nGshnIWCYQOWRqfkfI6PDf6I/VbWEBqrd9JYdh+CHUlIAt8eVtCYSSplGjXBGspYzmpu8hLNvgCcolDQwM15ULzSRwY9P4J13jQypBqdtPRCN0LIQkwkN49ITJpW9/PqHrjyZb650Qo9mantTW+xlP5cITSvE7+kRVRIG/J6tXNkkTsAfX9UMH/PVWpRss9HA1EC7YOq6fWsLZN7WZ3TPeu8d/543zTddOnYqqxYdIfsVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuJlEAEZUQfOv4NBsTAQ+dFXfQEQL1xDAZQMohHfLcs=;
 b=CP3N/h/D5BC6X9hyQMM1hDPetQwK5aMtl3BM5+Nr7Rhm0wNJRKZ5FRlbxwakiqDU91Xwvu5/Tv4S0HM4lJ56jHsMgqAnxNueoS+4XR5L7W5tfu6LWDa2cM+9Spo/xiJeTmQyvixfnutTWD8roALScLZ3Xa83CteRYp7f8AwyhUbZc+Xb82BG2/XWLgOSDXFO/PQS6rNBA5JWMbalwQB2PD/Oqm4+yQoAV5fsXqzaWfpHRNSqR82eYrML6d1EgYuUT3BFK9elggvmzhdRYZ8F0SdtFCv211MjyV0OxDWObUq2Ygxw1npMHVEBt0cc/4qqcKv7iHhURDzT+c7/BD3p0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuJlEAEZUQfOv4NBsTAQ+dFXfQEQL1xDAZQMohHfLcs=;
 b=h0QcLDJX+YpHHGXKqizfyJptd+8NYiW9I3TliUrdv1vWrX/D0jVVJrhK9T+c9men0uZeItA4ReqRVuUCGZOSiqMStolHqff8qcrZmd7nCX11vGGoyBJDF7B0lQ7zRfnjWMrKaOeZ7FcZ4Dnvphl5KrTss8venJnHQVo4Am68NuUGGrw8sXcx0Y3e8DUhoSUhQb1iKC+MWoXLtI8vGdmnwWURq2RuHJZfOWeGi+qsgzYoq7Y9u0MPPYwChNVcTm5A8Vp02qFVDxUYcafBtLXJwmTBS7XopALqVLidj2CCRvx+tdQub5nFYmAyKzvtKDAQJ81FGTgtuF5S0GLtNDeHzQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v5 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHchGj873UPBMyph02N0fqNmGIWE7VRbWqAgB96AQA=
Date: Tue, 3 Feb 2026 10:30:31 +0000
Message-ID: <17a56445-0c5b-48ef-9adc-3544d06abe3b@epam.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <54a015e0e47ea311471bad7f13fbf21e14389ef3.1768293759.git.mykyta_poturai@epam.com>
 <00e17b41-f31e-4121-80c8-d4ea2bb02f34@suse.com>
In-Reply-To: <00e17b41-f31e-4121-80c8-d4ea2bb02f34@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB6744:EE_
x-ms-office365-filtering-correlation-id: e1fdb3e1-09e8-4e7d-0275-08de630f4216
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDM4eDVtYUNZWGZib0dBWUp5QkhvRWtFQWlZY3hlbUxUSW1SUllnc2tvUzZj?=
 =?utf-8?B?a2l2ZDJpNDVMTEQvOHpaZlN2aGwyZ3BMWkdjeEh4RmMrMW9Cd3U4eVBTVUNR?=
 =?utf-8?B?S2I3enN0R1ZXQVVIWk14c0FneU1BM0F3aUhSRGRIMUU3T3ZFc2ppamJCVGtY?=
 =?utf-8?B?aEZkN3NmQWxaTW1ZaDJSRllXb05qZGxVMlEydjZBRUMyU1VYMW4xZ1FhQ28v?=
 =?utf-8?B?eFYzWXp5elZZUmVSbkE4d3JNZ1MxcWo1QnRVTlZqUWZjQjloNUF4SU14R04v?=
 =?utf-8?B?Y3o4K0g4TzJ1cDBRRElRSm16QXl1eU05Z1JYRE9DZW12bWlBV0FLRit3c1Fk?=
 =?utf-8?B?U0hEN3ZVNndubEc1Qk04d1haOS81Z2QvWUkweXkxL3RUQ0JrcU9SSUZUUVBh?=
 =?utf-8?B?eVJPTmxJSUNpbmNDbTZRMU01NXc3dWdsZ1p3aDU4OGtEMVlBR0RWR1pEdVk1?=
 =?utf-8?B?QnRPK2twcXdBaHpnZE1CbVhaWFpMeDl3WFIwYjFZYm1QUjRVdXhSWHVPMEZm?=
 =?utf-8?B?dllEM1ExNDJKOWxZOHhVOGVpL1VuWmtKR3lPbFZwcTVSTU96RzZXOURWSTZz?=
 =?utf-8?B?Y3hNMUJHc2J6bll1SC9GdUtBQ2p0WGFLcTV2R1VKRlpaTEZYdmlXcU9IY25O?=
 =?utf-8?B?VnBZNXgwQ2xGakkya3JEZjk1RjdDSHBGT3ZjR1MyQlE0blFBTWNsQWVvUUM2?=
 =?utf-8?B?ZThmbmhEZWdwdElrSlNpdXljcVFXMjFCenVxSS9rTnVLTDhnM0d5QnVSV2g4?=
 =?utf-8?B?dTJTUC8rd1dYZjdxeEswM1ROaDVCZXdvUnRSTDlraEsrenBYN0ZLeWxrcFU4?=
 =?utf-8?B?SmlOeTI2SEdGcEEyUmRJTzRwV0k5OWJ1dnhRem9kdXRSdy9yNmI5b05aQWQz?=
 =?utf-8?B?N3VoL29LQXJrYkhlU1ljcGtrOHhqeHR1TTdJMXZSNG9SendOSW5RT3ZIME1h?=
 =?utf-8?B?eFB5bGhLaEtaWjdRWGdRUzYrTTVHdlR4UEVCNEJlOHlKSmMxeWptaFdhWVcz?=
 =?utf-8?B?SFF0NkJEaHRJMW1nWlZqQXZObkZDaHBGZ0FxU1lNTHI2SEpNa0I4S1hUbHgz?=
 =?utf-8?B?dnNFUklpSFpiNGpUR2p5MGQ3TmRteno4RTlodUkwR3NXT3hGcGVnOUxpOE1z?=
 =?utf-8?B?djl2U09HeUNHTks0VkRMM3BoRm40UTk5ZDFFc2dQUzc3Q05iY2hRSmt6V1I1?=
 =?utf-8?B?U2lKOTd4Q3BZNnZqM0gyNHIvV1ZpRTEvN2liWkpFMFdtWDR3bUYzRitOL3ZY?=
 =?utf-8?B?WUgxYmtVZFZZYUF1VVJjV0xwUEhEUUVMMEVhZFJsY0FCdk5MUEl1RHhuUzV4?=
 =?utf-8?B?YytWU1J2dDJNLzE3ZTRqNktUT2cyakVXVy9TM1FOTDArWVlSb0Jzem8zeUVk?=
 =?utf-8?B?WDh2Z1ZjcFk5SzFKRFFuTkJRMHdiM3NKN2dZM3ZjeXhkbXQyNStMeVVvUy9w?=
 =?utf-8?B?ZnMrN3BHYWlMY2wwenJEN08zRGh5NkZuKzZTUnBQT2dTQ3QyWndQdXA2NUxs?=
 =?utf-8?B?a3NSM002NjJWR3Jqc1o2bStLN0Nrb3E5S0ZmSVA0eTlaRTlCSWZWdVVYQkc2?=
 =?utf-8?B?bC9hZ1pWVDBZNlBOVHJyaGYwQm1KSnJFSFpjbHNMb3B0QkxQbXJtRitJL1Vx?=
 =?utf-8?B?TmFBT2NVUGVQOHFqc2d1Mms0NitQREdNbU55NUtzWVkxRDIvaVladm1RTVlB?=
 =?utf-8?B?Mk5MZWVNWWZRMlV0MTNDRVpjSmNleW95aVFSR3dyM2NPQW5xTzFCYlNDN1ZT?=
 =?utf-8?B?VXJDc0ZxSU5YZ1NESGovVSt1cGo0ekpvUDFTNVFiU29SMG12dDhpTXBWSWtZ?=
 =?utf-8?B?OGE0cW5xT0xNVUovazY1YXRsZGRzQTJCYVRBZlJHZGxPTXVndlN6V29TV0Y2?=
 =?utf-8?B?OGJabjNHWGRuNlJabHhENVFacHVhWW5DUGhnL0NpOVllMHIwT3lyWnFaSzhr?=
 =?utf-8?B?L29mck5BNW9RRFpoU2tCNVZPaFNwNktGUkFYdGlZVGtvY04ybkgxdnZnNUNZ?=
 =?utf-8?B?ZFdYcjVmcmZXMlhvTU5wRTNnU3EzTXJEblVCQjVvQnA3VFNLYkUxWnJJQ0th?=
 =?utf-8?B?TDZMUmpVeStvNEJGNWgvTlRBdElPMk91VTlhZU5ucGYxWFhhSTMrZjdZd0c4?=
 =?utf-8?B?R2ZyVkNQVitjdXVwaFNEZ0dtZVR0KzdwdWhnZ3BCcVhka2FZSlcrQmRUei9w?=
 =?utf-8?Q?VHJp9hcD55ZC0hVA9/jSHbA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnVvMWEyMFdkNFBHRG9EK1lFV3hvbUl3ME9TbTVFTXlldzRrWnVZVHFJOUlW?=
 =?utf-8?B?UTJJNU9EKzNWNGhlNmZQemwzU1k1cks4b2gyR2c1TWpIZzJUL0c2UXl1M0xU?=
 =?utf-8?B?Yk01WUVGcnVnMmlpS0E0OGRybHQwL3NJU3ViZ0F4aG1WM1o5VHh2QUZ6c2xB?=
 =?utf-8?B?bFVIdzhJNzNpa0dPZU9qT0VvRWl3cG03bGNQM0VWajlwQTNuUEJoSFdJZlZI?=
 =?utf-8?B?aFY3TDZDMys4dVBacXU5bGZyd2FncnMvWWt5aGp3aWdvVHduMldXSmNnL2Jy?=
 =?utf-8?B?WldvMCs2OFE0aGtwdlZHL2doQm4zNVNPVERrZlo3aEY5eU5JaWVsaUQ5dE1U?=
 =?utf-8?B?TGgwa1p0c245cVIvdjd3VWNwYjIyY29QWVoxLy8wTlBPc0t1Qk5Zc2xxQ01L?=
 =?utf-8?B?a0tjVk44ZFAvQWZzV2toM0JVK3pGWHNtU0ZFeUdvVldnejNzVExEZkVObEdL?=
 =?utf-8?B?NnBIYS84NXNhV3pmQnZjZTRPR0FMUzZTMjBhWTIzZkhHRnp6cG1MUnpBWHNm?=
 =?utf-8?B?dXlPaHNxbDBMZytHZmJ2Ym9oTXUzMlBsT2RZR1R4QXdRajU3emFJVTBremJB?=
 =?utf-8?B?RnhLVEdrMW00Z2N3U0VIM0ZhK1RoRDJmNHdxYlZnOU4yZDV2V1h0d2ovZlRi?=
 =?utf-8?B?WEh2UC82dXZsd1oyVjNlRXUwOVltYmZ5UklOTFVRTDNOKzdqZHkzZGwvWDdr?=
 =?utf-8?B?LzYvb3V3K1BUK3FDS0NuTjV3MWpZZ1BiQWNZMDRVMGVVOXhXbWlRd1VCeUkr?=
 =?utf-8?B?d2Z3Lytib3hQK3dRemp1NXBHY0IrM3dPUWhLdHBVYldLQ08wd09uRXdMS0lQ?=
 =?utf-8?B?eDMxdUorKzkxZmg1TmhuNGxVd1U3WU5VbFpVemg4aFRFUEFJSXdPcW9qRFdC?=
 =?utf-8?B?Nk82VldBbXBVMzRLRHNlMVlCQmhvcmNTVU9LM1JnTDNzZHZNRys0VklQWHpv?=
 =?utf-8?B?cjliRk53Qlk2VHV2eEN3RGNkY2MzR3Fibmpud2sreVQ3NlFwSS9tOGpkYmcw?=
 =?utf-8?B?STBSUjl5QXkxdUgrR09IWk9iNFlaRlpnYUYvelowd3kyd0RPTlB2dGNIRkUw?=
 =?utf-8?B?ZmQ3WFcrUHZHeWExcE5BRU5rb1ZsWkkvR2JTVWdMYStBY1o3cWs3N0Vqbm11?=
 =?utf-8?B?TVc0cHpoT0V2bFA4RmJ4bm1PQ2kvdzdPZTAxVW91TnFkNnl2eEtSbFAxVjI0?=
 =?utf-8?B?blJHOWczMDBGcVp2UUM1cDNHNkZyb3B5TytBU2tzQkFvSExJYmhVZXUwc0Nn?=
 =?utf-8?B?MlNnOHErVURtSDV6NVFrWU1XWmgzRkxOb092OVFGeUpmNDM0WHdhZGZnYzJz?=
 =?utf-8?B?cWJMQXJXa1NtTUYrOVE1c2RqRytJaGYxa0FRS0Fqb3cxRUdqbXNvSUZMMFBY?=
 =?utf-8?B?ZDJqa0tJeVRrT3RCbEladE9Da3F2QklSUWtiV3h0NVdpSW5rMkh3dnNYbFAw?=
 =?utf-8?B?ZU4wMEFFUnlCWWw5cUR2TzJZQkpqYXhtRnFzYys5NUZ2VVVCK2IrdGF4aFFZ?=
 =?utf-8?B?MlY3UFYreXR3azJHT2R3QjdKc0dBdFZzWTNrQ0NsNVE0WWZtODFrR0RHb1ZS?=
 =?utf-8?B?T3EwWnd2L3NrNzVkelRERTY1cThpSGp3QmlGVEhMUEVXTVdXL2FMTVZnZ0ND?=
 =?utf-8?B?Um5nZFVVOHdUdFV2Zys5N2lPRDU3QmhpTjFGTkQyWGV0Y1ZEK0dqbFFCS0pj?=
 =?utf-8?B?ODVOWXRTSjRQNTdZV3BlbE1ISEVROFhSczY5NmtnZzFFWmh0RmY0VmpXYnF1?=
 =?utf-8?B?TFVPeXhXcXB4YkQzN2hKbytaVXdCQ1NwRXpRNy9VVExIRlBtUkE1aVJOZmNO?=
 =?utf-8?B?cGFFbTRJYjdSVjJsOXRQUjNIS0VWOC9MQzBVRDRYam9rTEYrTEtIV1dXa1Iv?=
 =?utf-8?B?SzJYV0xnQlVUM2hMSlI5NTFkYXRhb3k1S2RYd1BwejVGeHptVHNrT1hwdnl1?=
 =?utf-8?B?WCtvR0xhcGxUUjZYUHFSL1hndFdwY1R4QVNuaUd0d1BFbENRTFVoNHdlT21r?=
 =?utf-8?B?OTY0Tjc2RHVJZEtMY0hKOXNWeFo1VFoxbXJjRWJJejcxNlBGa3JsMWhzUVFB?=
 =?utf-8?B?bGlEcVZCbExTNkdTZ214S0ZVNGtWRXJhRVVQSWVPOXZKSTJqam1YRWpIUWdZ?=
 =?utf-8?B?ZjVMa1RUR0RRU3lINldSK0MybWVPcGduNWZ1OWpYb09EZmZDZmJmNmFNYk9a?=
 =?utf-8?B?dTZBSkY3UXZQcFZ2dHkxYU5Jelc0bDliZ2JrS2s0bjBHTzFQcjRuWTY3L2NU?=
 =?utf-8?B?cElaRUdHcjE0eW42Tklwa2VIMXNDd2FWc1NzTVlmMzNJdXpwWHRzcTcwelBw?=
 =?utf-8?B?SWlCSHZlWWh4c2RGcGFKa1FMejFuTTJRdDk0WjFCNzFSMGRPMmJaSVA2M29P?=
 =?utf-8?Q?3UpWS1K3KEXkWSLQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D0C08310B0BE344A5BBFAE9EF233A75@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fdb3e1-09e8-4e7d-0275-08de630f4216
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 10:30:31.7004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFyGf+FM4bIrXip6OlYWwDTYsfFGQraGjiA55k+86TwK4AszEDxIYfiz+ahMUqmmhNXIgwrmDD7NeSWzzUOqmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6744
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 77CAAD7AC4
X-Rspamd-Action: no action

T24gMTQuMDEuMjYgMTE6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4wMS4yMDI2IDA5
OjQ1LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE1vdmUgWEVOX1NZU0NUTF9DUFVfSE9UUExV
R197T05MSU5FLE9GRkxJTkV9IGhhbmRsZXJzIHRvIGNvbW1vbiBjb2RlIHRvDQo+PiBhbGxvdyBm
b3IgZW5hYmxpbmcvZGlzYWJsaW5nIENQVSBjb3JlcyBpbiBydW50aW1lIG9uIEFybTY0Lg0KPj4N
Cj4+IFNNVC1kaXNhYmxlIGVuZm9yY2VtZW50IGNoZWNrIGlzIG1vdmVkIGludG8gYSBzZXBhcmF0
ZQ0KPj4gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGZ1bmN0aW9uLg0KPj4NCj4+IEZvciBub3cgdGhp
cyBvcGVyYXRpb25zIG9ubHkgc3VwcG9ydCBBcm02NC4gRm9yIHByb3BlciBBcm0zMiBzdXBwb3J0
LA0KPj4gdGhlcmUgbmVlZHMgdG8gYmUgYSBtZWNoYW5pc20gdG8gZnJlZSBwZXItY3B1IHBhZ2Ug
dGFibGVzLCBhbGxvY2F0ZWQgaW4NCj4+IGluaXRfZG9taGVhcF9tYXBwaW5ncy4gIEFsc28sIGhv
dHBsdWcgaXMgbm90IHN1cHBvcnRlZCBpZiBJVFMsIEZGQSwgb3INCj4+IFRFRSBpcyBlbmFibGVk
LCBhcyB0aGV5IHVzZSBub24tc3RhdGljIElSUSBhY3Rpb25zLg0KPiANCj4gRm9yIGFsbCBvZiB0
aGVzZSAibm90IHN1cHBvcnRlZCIgY2FzZXMsIHdoYXQgaWYgYSB1c2VyIG5ldmVydGhlbGVzcyB0
cmllcz8NCj4gV291bGRuJ3QgdGhlIHJlcXVlc3QgYmV0dGVyIGJlIG91dHJpZ2h0IGRlbmllZCwg
cmF0aGVyIGxlYXZpbmcgdGhlIHN5c3RlbSBpbg0KPiBhIHF1ZXN0aW9uYWJsZSBzdGF0ZT8gSG1t
LCBJIHNlZSB5b3UgLi4uDQo+IA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+PiBAQCAtNyw2ICs3LDcgQEAgY29uZmlnIEFSTV82
NA0KPj4gICAJZGVmX2Jvb2wgeQ0KPj4gICAJZGVwZW5kcyBvbiAhQVJNXzMyDQo+PiAgIAlzZWxl
Y3QgNjRCSVQNCj4+ICsJc2VsZWN0IENQVV9IT1RQTFVHIGlmICFURUUgJiYgIUZGQSAmJiAhSEFT
X0lUUw0KPiANCj4gLi4uIG1ha2UgdGhlIHNlbGVjdCBjb25kaXRpb25hbC4gQnV0IGRvIFRFRSwg
RkZBLCBhbmQgSEFTX0lUUyBlYWNoIG1lYW4gdGhlDQo+IGZlYXR1cmUgaXMgYWN0dWFsbHkgaW4g
dXNlIHdoZW4gdGhlIGh5cGVydmlzb3IgcnVucz8NCj4gDQpUaGUgd2F5IGludGVycnVwdHMgYXJl
IHJlcXVlc3RlZCBpbiB0aGVzZSBtb2R1bGVzIGNhdXNlcyBYZW4gdG8gY3Jhc2ggDQp3aGVuIHRy
eWluZyB0byBvZmZsaW5lIGEgY3B1LiBJdOKAmXMgYSBmYWlybHkgc2ltcGxlIGZpeCBhbmQgSSBw
bGFuIHRvIA0Kc2VuZCB0aGVtIGV2ZW50dWFsbHkuIEnigJl2ZSBkZWNpZGVkIHRvIG9taXQgdGhl
bSBub3cgYW5kIGRvIHRoZXNlIGZpeGVzIA0Kb25seSBmb3Igc3VwcG9ydGVkIGNvZGUgdG8ga2Vl
cCB0aGUgc2VyaWVzIGZyb20gYmFsbG9vbmluZyB3aXRoIHRvbyBtYW55IA0KcGF0Y2hlcy4NCg0K
Pj4gKyAgICBpbnQgcmV0ID0gY3B1X3VwKGNwdSk7DQo+PiArDQo+PiArICAgIC8qIEhhdmUgb25l
IG1vcmUgZ28gb24gRUJVU1kuICovDQo+PiArICAgIGlmICggcmV0ID09IC1FQlVTWSApDQo+PiAr
ICAgICAgICByZXQgPSBjcHVfdXAoY3B1KTsNCj4+ICsNCj4+ICsgICAgaWYgKCAhcmV0ICYmIGFy
Y2hfc210X2NwdV9kaXNhYmxlKGNwdSkgKQ0KPiANCj4gQXMgeW91IHZhbGlkbHkgbm90ZSBpbiBh
IGNvbW1lbnQgaW4gZG9fc3lzY3RsKCksIFNNVCBpcyBhbiBhcmNoLXNwZWNpZmljIGNvbmNlcHQN
Cj4gYW5kIHBlcmhhcHMgZXZlbiBhbiBhcmNoLXNwZWNpZmljIHRlcm0uIEhlbmNlIHVzaW5nIGl0
IGluIHRoZSBuYW1lIG9mIGFuIGFyY2gNCj4gaG9vayBmZWVscyBpbmFwcHJvcHJpYXRlLiBQbHVz
IC0gdGhlIGhvb2sgY291bGQgYmUgdXNlZCBmb3Igb3RoZXIgcHVycG9zZXMuIFdoYXQNCj4gdGhl
IGFyY2ggbmVlZHMgdG8gaW5kaWNhdGUgaXMgd2hldGhlciB0aGUgQ1BVIHRoYXQgd2FzIGJyb3Vn
aHQgdXAgbWF5IGFjdHVhbGx5DQo+IHN0YXkgb25saW5lLiBUaGF0IG1vcmUgZ2VuZXJpYyBwdXJw
b3NlIGlzIHdoYXQgaW1vIHRoZSBuYW1lIHdhbnRzIHRvIGNvdmVyLg0KPiANCg0KV291bGQgYXJj
aF9jcHVfb25saW5lX2FsbG93ZWQoKSBiZSBva2F5LCBvciBtYXliZSB5b3UgaGF2ZSBzb21ldGhp
bmcgDQptb3JlIHNwZWNpZmljIGluIG1pbmQ/DQoNCg0KPj4gKyAgICAgICAgY2FzZSBYRU5fU1lT
Q1RMX0NQVV9IT1RQTFVHX1NNVF9FTkFCTEU6DQo+PiArICAgICAgICBjYXNlIFhFTl9TWVNDVExf
Q1BVX0hPVFBMVUdfU01UX0RJU0FCTEU6DQo+PiArICAgICAgICAgICAgLyogVXNlIGFyY2ggc3Bl
Y2lmaWMgaGFuZGxlcnMgYXMgU01UIGlzIHZlcnkgYXJjaC1kZXBlbmRlbnQgKi8NCj4+ICsgICAg
ICAgICAgICByZXQgPSBhcmNoX2RvX3N5c2N0bChvcCwgdV9zeXNjdGwpOw0KPj4gKyAgICAgICAg
ICAgIGNvcHliYWNrID0gMDsNCj4+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4gDQo+IEkgd29u
ZGVyIGlmIGl0IHdvdWxkbid0IGJlIG5lYXRlciBmb3IgdGhpcyBhbmQgYWN0dWFsbHkgYWxzbyAu
Li4NCj4gDQo+PiArICAgICAgICBkZWZhdWx0Og0KPj4gKyAgICAgICAgICAgIHJldCA9IC1FT1BO
T1RTVVBQOw0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gLi4uIHRoaXMgdG8gZmFsbCB0
aHJvdWdoIHRvIC4uLg0KPiANCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIGlmICgg
IXJldCApDQo+PiArICAgICAgICAgICAgcmV0ID0gcGx1ZyA/IHhzbV9yZXNvdXJjZV9wbHVnX2Nv
cmUoWFNNX0hPT0spDQo+PiArICAgICAgICAgICAgICAgICAgICAgICA6IHhzbV9yZXNvdXJjZV91
bnBsdWdfY29yZShYU01fSE9PSyk7DQo+PiArDQo+PiArICAgICAgICBpZiAoICFyZXQgKQ0KPj4g
KyAgICAgICAgICAgIHJldCA9IGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoMCwgZm4sIGhjcHUp
Ow0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIH0NCj4+ICsjZW5kaWYNCj4+ICsNCj4+ICAg
ICAgIGRlZmF1bHQ6DQo+PiAgICAgICAgICAgcmV0ID0gYXJjaF9kb19zeXNjdGwob3AsIHVfc3lz
Y3RsKTsNCj4gDQo+IC4uLiBoZXJlLiAoTWluaW1hbGx5IHRoZSBlYXJsaWVyIGRlZmF1bHQgY2Fz
ZSB3YW50cyB1bmlmb3JtbHkgZm9yd2FyZGluZyB0bw0KPiB0aGUgYXJjaCBoYW5kbGVyLCBvciBl
bHNlIGFyY2gtc3BlY2lmaWMgYWRkaXRpb25zIHdvdWxkIGFsd2F5cyByZXF1aXJlDQo+IGFkanVz
dG1lbnQgaGVyZS4pDQo+IA0KPiBKYW4NCg0KV291bGQgaXQgYmUgb2theSB0byBtaXggZ290byBh
bmQgc3dpdGNoIGxpa2UgdGhpcywgb3IgaXMgaXQgdG9vIGNvbnZvbHV0ZWQ/DQoNCiAgICAgICAg
IGNhc2UgWEVOX1NZU0NUTF9DUFVfSE9UUExVR19PRkZMSU5FOg0KICAgICAgICAgICAgIHBsdWcg
PSBmYWxzZTsNCiAgICAgICAgICAgICBmbiA9IGNwdV9kb3duX2hlbHBlcjsNCiAgICAgICAgICAg
ICBoY3B1ID0gX3AoY3B1KTsNCiAgICAgICAgICAgICBicmVhazsNCg0KICAgICAgICAgZGVmYXVs
dDoNCiAgICAgICAgICAgICBnb3RvIG91dGVyX2RlZmF1bHQ7DQogICAgICAgICB9DQoNCiAgICAg
ICAgIGlmICggIXJldCApDQogICAgICAgICAgICAgcmV0ID0gcGx1ZyA/IHhzbV9yZXNvdXJjZV9w
bHVnX2NvcmUoWFNNX0hPT0spDQogICAgICAgICAgICAgICAgICAgICAgICA6IHhzbV9yZXNvdXJj
ZV91bnBsdWdfY29yZShYU01fSE9PSyk7DQoNCiAgICAgICAgIGlmICggIXJldCApDQogICAgICAg
ICAgICAgcmV0ID0gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgwLCBmbiwgaGNwdSk7DQogICAg
ICAgICBicmVhazsNCiAgICAgfQ0KI2VuZGlmDQoNCiAgICAgZGVmYXVsdDoNCm91dGVyX2RlZmF1
bHQ6DQogICAgICAgICByZXQgPSBhcmNoX2RvX3N5c2N0bChvcCwgdV9zeXNjdGwpOw0KICAgICAg
ICAgY29weWJhY2sgPSAwOw0KICAgICAgICAgYnJlYWs7DQogICAgIH0NCg0KDQoNCi0tIA0KTXlr
eXRh

