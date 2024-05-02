Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82228B94B6
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715549.1117261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Q0z-00088O-0v; Thu, 02 May 2024 06:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715549.1117261; Thu, 02 May 2024 06:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Q0y-00086r-UD; Thu, 02 May 2024 06:33:56 +0000
Received: by outflank-mailman (input) for mailman id 715549;
 Thu, 02 May 2024 06:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7KU=MF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s2Q0x-00085D-K9
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:33:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2029258-084d-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 08:33:54 +0200 (CEST)
Received: from AS9PR05CA0311.eurprd05.prod.outlook.com (2603:10a6:20b:491::28)
 by DB9PR08MB9801.eurprd08.prod.outlook.com (2603:10a6:10:462::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Thu, 2 May
 2024 06:33:23 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:491:cafe::4b) by AS9PR05CA0311.outlook.office365.com
 (2603:10a6:20b:491::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29 via Frontend
 Transport; Thu, 2 May 2024 06:33:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Thu, 2 May 2024 06:33:23 +0000
Received: ("Tessian outbound af213ececc3d:v315");
 Thu, 02 May 2024 06:33:22 +0000
Received: from 9d42171dc654.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D2D2663-D161-4D80-934D-3EA3F3091C3E.1; 
 Thu, 02 May 2024 06:33:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d42171dc654.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 May 2024 06:33:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB8102.eurprd08.prod.outlook.com (2603:10a6:10:386::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Thu, 2 May
 2024 06:33:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 06:33:12 +0000
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
X-Inumbo-ID: f2029258-084d-11ef-909b-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=D4lbCH20xwLmVm9/jrUKHO4M8dNC2VvXWC7VQkug9urURtDmYVIxbXb28PEkHdQKddKBJDNm4GjmTcPfjThJTJF+XFM1XQnZzKuvN3LCq2W6fl4ArKVxBL95i4UwS3FVQAUpegyguBDt7aNfMlMxw+AhBw/0BDexBwyCuNQ9FlWXGZWWW1T6GrN12xzAkuR7kCtKTHnPqAc4fAzQUSnvFlw4wqhlbf9OrNQE3C6HBjFWJQfa57Pghhe4PDpzYw7S2vDt/rk9zxOuqYhV5ADu8JVji4/eCnQ+2FQpol0DsoDwmwyleRJQgPGdXYCH2iI/hYgPxOcGJQZIViawqzWJDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6FwU0Q3/gqWAiXf1Xgd8ehO2TYoveL/szN9rczxeDY=;
 b=M0t9jdZ/S5x/xivj1UXJlaob9fbMc0vP5ND7iGyBKyW3Z3yhgL35lqUYO2YvJd5d0vppvYRHfd80eTVeSFByIhsD6yDwCpEUDdmebQ31vzxGUB0NzAISfb9jJkmrVrVy3JgdHBjD7dzpqyWZ6fFkH2BQcvKKq8qaiLofjSGc6g4ewnWTOLWW6ufvvJQdemm/Yj8DGq8zFKFGl51QlFdrwWlXp7RRn1XoS/w4DmcB0d/1sD8vfIga/OtVTwbr2sF6goI3NWObgrNdJsxTlCU+SrJ8bZkE4tOjM8i9z/4h5CCEz2TBjRYV8NRvtuzIUxmopIgOBwu0kW/4b6YLThJdcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6FwU0Q3/gqWAiXf1Xgd8ehO2TYoveL/szN9rczxeDY=;
 b=pJ+gjDPCZR+4pBjM6/FDm1f+4lP5zp/LDeIFFLBbxctLCl8RnR3QqbuMZ8Qn8N30DjalbdJL76VNFe27fJNlwYrsPelhLuzB0IEAPklV3TtG/9YaJscjPV/0dWVLNqnhlTLD67ByiixmXILOQNpbvxAQeSCc6bQPU+w6aO7sTZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ddc738dbce6feb10
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQc2oVk9e9mQncIHU6jpw+vMkqqdj62r99B7NSA+37vMRZ+Cz6zdJRH8qspSwScZRKWyeZrE088aSZwlnBkoZV+zxljsErPbXPyn6uKzzN4wCrO1qpeIZuuyFKiwxqWw8B+8vVlAqODtVJmAYeHJ7HjusiXjJfwG5a7lBhRJM4HGNL03RmiD4gXVK0eKMSna/08uL5VHG7YNcm4ckuOWUmGUGDPPAsqgtHfMNMG6ffVcVRPiwLm3FU8aTWqcloOat1DJEgwszRGewy3q4iFj7PKxl2JD4TNf2PVQ5K/YsEM8cc4MsJaVnpVBBumOUvWCSFUE/6E7WV0C0lFwoInW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6FwU0Q3/gqWAiXf1Xgd8ehO2TYoveL/szN9rczxeDY=;
 b=KKvoOmKZNbU7aAA9LLYgh3nm1T+JbS7qrCvyOAPFnSj53KOZU2sRI8iekoftndGSsqZztWmCUKrTINjPyGCQ0xi/bsUVOCb33EGCr0fj7WDOtG8IdvwNb7NJp8DdlZ4CaVA1hmgcz2Oxjgv8207245KBbCOCjAgupMytSrmm80wU86VSs+SCQVAU79mWKL0FqlVg4nBcozts2x+5axb/b7AmX+qd8FBcoXsCfWUXKYd1pKzsAf1FmMFXidBa35WbIxQRIz6HgRciUvNZktksckEgRTM9oGFGjzGb1DIv7nRpcqZiEtGDJ9KEA52Dy7h7zZ0z2216cMhXUBDs6wyrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6FwU0Q3/gqWAiXf1Xgd8ehO2TYoveL/szN9rczxeDY=;
 b=pJ+gjDPCZR+4pBjM6/FDm1f+4lP5zp/LDeIFFLBbxctLCl8RnR3QqbuMZ8Qn8N30DjalbdJL76VNFe27fJNlwYrsPelhLuzB0IEAPklV3TtG/9YaJscjPV/0dWVLNqnhlTLD67ByiixmXILOQNpbvxAQeSCc6bQPU+w6aO7sTZI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "consulting @ bugseng . com" <consulting@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Thread-Topic: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible
 array member not at the end
Thread-Index: AQHamu72Eq1RpEGs60mNp9DIfY8mn7GAr6+AgAFEGQCAAYYzgIAABVAA
Date: Thu, 2 May 2024 06:33:12 +0000
Message-ID: <29573F6B-BE27-4A65-A310-35883A39F989@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
 <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
 <de09e134-0150-49ca-8338-a0f4759c218b@suse.com>
In-Reply-To: <de09e134-0150-49ca-8338-a0f4759c218b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB8102:EE_|AMS0EPF000001B7:EE_|DB9PR08MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba21527-031e-4e5f-3732-08dc6a71c3f8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RGEwSW53MjFkRS8rOXRhWU0weWQ4dUtqYVZZMzRCdmJuWTZoeEdWVXlBbzZk?=
 =?utf-8?B?NG1hTmhSNHJEb3lTNGRvQWxnTUFXWm03ejU1YlR6eDJ1MUZhSDltRFFEZm11?=
 =?utf-8?B?djQvVEhnOHRxRVRhY29wek1rYjVyNUIvOUE0a2ZXZWVJd3hjSnU5TlpRUnFx?=
 =?utf-8?B?SjZUa1ZTWlZPd01jNnNGRlU4Zmw1UXJvbHd4VTJtU09KQ3VSUjJwNVV0ejlV?=
 =?utf-8?B?Tmw5RTFPMkJ0TlhYakQ2Y0I4ckVNWXgvYnRkMzRPeEQxRGF0Q1FDenI0SjZB?=
 =?utf-8?B?UUx4MVJqQmk5S2FhRy9STEZiaTdVa3AxTSt6bUs4RWFqYTlJSitXMVhlejNp?=
 =?utf-8?B?cjFqWHdDb09DSHZrajdXUjBQN1lIRGJjYTlibGQ3M2RhVWlZM0Z5V1lEWlVX?=
 =?utf-8?B?UGZsS0MrVUxqbUNaRkk1b1NocVRoYUE3M091Zkh3ZG5qdEZpcWlNL29TbTJ0?=
 =?utf-8?B?cWZpREdwOEh2SitzVHVBdTFKY2JnbndKajQxYnI5WnBDWDRHbzZMemVQbkZI?=
 =?utf-8?B?ZVQxUlhCdXBNaS95TWlxWGUweDFRSFY5QnVsLytKSUxSZ1o3NURBUmczVFZH?=
 =?utf-8?B?aTJDTjd3V0VmdFJuNDQrV0w0YVZyNms3Ykh6K1pYbTVOU00rNzRsYk9LUEht?=
 =?utf-8?B?NzJaZm1vRU5UcVFwRlZ4M1N4aFFzQ2JXbEhmMGZaSzQyaEo1QXFGUjlJOUd3?=
 =?utf-8?B?WXRjU3RjNk9GQXJIenpJTU5CeDF6Vzc5akVFc0NCUDlwR2RFVWJBclhqVFVS?=
 =?utf-8?B?VmpZMVE3ZklNY2VxMVF3WGU2WE1jb05lRWM3N1g5UkVVNE9mSzJRK080NVkx?=
 =?utf-8?B?bzUyVFNHcElkTStDT0JKczdlWXV6dWpaTFFXRWlWejMzRGZPTXp1NkhoZlg4?=
 =?utf-8?B?dnkxVDBZU1ltZDBEZjRsaTRqUFBNT2dVbi9mK1A1RW1jSmZhZ09lWXU5Ujho?=
 =?utf-8?B?bldpNnFKNlRVNzRpMTVaUkxxOEFEMTlISDg1SkVUeUtBMWdKTnVoU2czb3Bk?=
 =?utf-8?B?cG1GT09laFlIK2lONDA3Y0tRSkhiY1JOeStDdHc5SlltalRUTUpzanorMHc5?=
 =?utf-8?B?UStkTVhtWlZJN0VBUU5SVTlXZjJQUTBpMmdXY3hZQXdxNEU2eldHK1lDdnJh?=
 =?utf-8?B?SW5aVFZEVGY0UWYwY01ZUnpleXBEY3ozQitTNlJmei9icTZVR0Npa0pQWitt?=
 =?utf-8?B?Zm9FK1N0UmtaTVlUT202SXV2NmpOdTV3SzhTZGZ6czM0cTdJRnJLb3JsVno2?=
 =?utf-8?B?aTFwNnRPU2cxbTZJVE5nV2IvR250dldaRVY3Rmw3SG8xQlBQWnZTd003OXdt?=
 =?utf-8?B?WDNiNERPVDVPUUxlNWlYRVJ4NmJwVHVKVGxSNWxvU2R1WjdSOVNoRkMwRDdU?=
 =?utf-8?B?SzFJUURnTU9waU9WWFA0aUJrNHlrbVhiTW9NNFM4U2lDQzJjU2Y4ZExXU1Zi?=
 =?utf-8?B?bTBzZVJNS3l2eTA0S0Vqa2dGVktjdjBVbURDRlNHclZVMWRGUFlYVHF1T0c3?=
 =?utf-8?B?T05jRlVtKzlBd1JPaWhndzZNSXowSnROOEhhT3MxT0ZSZjZ0UzU2cWJhZUxm?=
 =?utf-8?B?L1IxOVNtYW0vck5zSDBxL2tra01uN1VibSs2dHg1N1JjSVprQXhlbWRvQnJj?=
 =?utf-8?B?NDZiOTQrRDZQM2xlM1plK0VoMmJuYXV5QklwTGxndVFKK1ZwUHk0K2VuZWNZ?=
 =?utf-8?B?UU05WlZwYUxRODl0dVdFQjRSKysxOUNIRHQ2Tkw0TGJhSEpUUzJvN2MvRWM2?=
 =?utf-8?B?OHdNVm03c1lOYXFGaTNxNXdSc1BncG8zRyt6bGNhZkpuT3MyMTRiZE5VOTNJ?=
 =?utf-8?B?NThaZ3VCNGZRV3pKMG80dz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BCB814F3B538F46BA42E049A0E23142@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8102
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	769d5853-aafc-4409-35eb-08dc6a71bde3
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW9MU2k4MCtSazJRYVNkNXJmWkY2UWMya1dpeW02d2c2S0ZlTG5YWHl5UkFV?=
 =?utf-8?B?ZTloUnhkVmh0L0ZZYnhCZzFkdGJ6QXNxem9WUFBZdENQenRPSCttdENGUjRh?=
 =?utf-8?B?UkxDdld1S3pHTnhLUDhKTFJnRWFZR1RaaEQ1bGVjTkVkUmJIYnpQNW4vcitl?=
 =?utf-8?B?anNzakJvTzdZT1Z1N3BJRzJJTWIrV1U5LzZ2MkI0NVN1Y2lEZS96bXp4bTNn?=
 =?utf-8?B?VVVXbmpkSDdYOGJhN2U1WTMwSHdoN0JnbFJVWWtoR2NtUnBhME0xczNkRnla?=
 =?utf-8?B?VSs1cW5SWWthcVZoamtGRGE4VElkVlJQNjJjSGhLVHpxN21pSElTcWZsS1dv?=
 =?utf-8?B?VTNVYmVJNFk0NmhneHlJZTI3VXNiVm9vazUvSm9RbE9LNmlYMDBvNFBxbkV2?=
 =?utf-8?B?WFBvbWZ2MnB1ZEJwM1k3azM5UGRBUG9udnBlNHRlVGdzTUxnL0NqR1B5S2VS?=
 =?utf-8?B?TGVUeW1uZ0dQQUViQ09DTGNSSlNaS2hUTzFzcDl5SUJ2am5LM1lUTXQwakR1?=
 =?utf-8?B?Z2Jmb3pCUysxSVI0cDczZzVkYVUzUG1hUVBzRUhDVFBSbkRCaFNqcnNyaUo2?=
 =?utf-8?B?UHlxeDlBa1JBNWo0TnZPdmdkQ25qUlhCYkQwb1RoWUpmY0FtZ0Q2Z2lYaUNO?=
 =?utf-8?B?WURSUmQ3VmpRT09wSTE5eHM4U3pNeEhuSlNYallPenN2Z0xCeStqdkJ3RUpu?=
 =?utf-8?B?aHJqdVdZOGJTV1c1SG5ra3pIckJxdDdFL1FrdDVnUzV2UkhhRVZORk5MVnRN?=
 =?utf-8?B?QngyWkpwUGc4ZE91eGZTcngyUmh4MTdILzdwR2MrWVlWK2JqUHpSdUZxZngy?=
 =?utf-8?B?Y2hsU01qamxOM2VMT3BVVFlDaGxhYTU1SkNrVXlpUEdmbGFBNFNqSWJBOUNB?=
 =?utf-8?B?SW4zSTA1SitrZHN6aTJnN0VaNVJnc1U2OEZvd1FjYjZLVFZuUzRmSHRqTFpV?=
 =?utf-8?B?Y3pBVVFmTWFxWEduVFRIV3NVS3pkREtKZDAxNG84Qmc1NTBEM3prcitoMS9J?=
 =?utf-8?B?dVNRYmJJNXNuR0ROR05ONVU2cEZqVm14UktycnhlMDNvakttWi83V2w1VGVa?=
 =?utf-8?B?NlJjQkk5WlpSdTcyTFNGVXVFNlZwK1VjdWhwNnh5OW1jTE01SkwwQWQ2TlVR?=
 =?utf-8?B?WFZ3RVF2dDk5Z0JYTGJRcmg4Rngza3lQWWhRZzBzN0Y5aUttcGtoQ2NXOHhi?=
 =?utf-8?B?L3pvRUVXcmhRbStlQi9vUURnMHYzN01IVlh1T205OGRubzhBVnZwSTVBLzJu?=
 =?utf-8?B?bHZEUmxxRk1aR0MyZDloMHNCb1RnTFNLNUVVeExJeVBiN09QcEh4OTJ2OWow?=
 =?utf-8?B?WWlOYUo5WHhBZkdjNnZCYzQrTVNHVDNJV3poRUFORUNZaTEwUVJFQVQzc1Vu?=
 =?utf-8?B?bkI2OGlObDZBWGo4VVFuVm1TVllPbTRRNUMvRGhsVXFNQk1wY0IzN09Ga1Q1?=
 =?utf-8?B?NmlacENlL0VaUitmcjZoaUFBUDJZVWZFZ2JKUlhEdU1ZQTNJa1oyZzdDWjlo?=
 =?utf-8?B?S3YzcFhkSEpGNVVLRTcwbVVKSTF1VHJCRTJEQXIyemhTZmk0TzVoZ3YxdThh?=
 =?utf-8?B?bzNBaFIwUDVlU0lGbW13dnZPYjZsR3lWQWxhN0dkb1ZXZUJyeVJ6REZVZXBn?=
 =?utf-8?B?TFM3K2Z5SWNoUDc3M3AxLzNGbzRkajRQaFliL3ovc0EwbXQyU0paVDl5Vldw?=
 =?utf-8?B?UlZ4ZXpQdTJHU2t1YS90TnFSMWZHNWxac3BMZ2V2cTlvWC80N3hvQlc0RmFt?=
 =?utf-8?B?REQzVEFKS1ZNRmxZcUhHMG9xUWtQSGJWMnlNOStueXluUVYvU1g4TXlPVVBD?=
 =?utf-8?B?TitmODI5a2dremlGdHFNVVhYbndQR1hnZmk0L096TEZyNTRlQ21oYzdkcHRR?=
 =?utf-8?Q?J7SaH670wnMmG?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 06:33:23.0815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba21527-031e-4e5f-3732-08dc6a71c3f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9801

DQoNCj4gT24gMiBNYXkgMjAyNCwgYXQgMDc6MTQsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMS4wNS4yMDI0IDA4OjU3LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gSGkgSmFuLA0KPj4gDQo+Pj4gT24gMzAgQXByIDIwMjQsIGF0IDEyOjM3LCBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDMwLjA0LjIw
MjQgMTM6MDksIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9zZXR1cC5oDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9z
ZXR1cC5oDQo+Pj4+IEBAIC02NCwxOCArNjQsMjAgQEAgc3RydWN0IG1lbWJhbmsgew0KPj4+PiB9
Ow0KPj4+PiANCj4+Pj4gc3RydWN0IG1lbWJhbmtzIHsNCj4+Pj4gLSAgICB1bnNpZ25lZCBpbnQg
bnJfYmFua3M7DQo+Pj4+IC0gICAgdW5zaWduZWQgaW50IG1heF9iYW5rczsNCj4+Pj4gKyAgICBf
X3N0cnVjdF9ncm91cChtZW1iYW5rc19oZHIsIGNvbW1vbiwgLA0KPj4+PiArICAgICAgICB1bnNp
Z25lZCBpbnQgbnJfYmFua3M7DQo+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBtYXhfYmFua3M7
DQo+Pj4+ICsgICAgKTsNCj4+Pj4gICAgc3RydWN0IG1lbWJhbmsgYmFua1tdOw0KPj4+PiB9Ow0K
Pj4+IA0KPj4+IEknbSBhZnJhaWQgSSBjYW4ndCBzcG90IHdoeSBfX3N0cnVjdF9ncm91cCgpIGlz
IG5lZWRlZCBoZXJlLiBXaHkgd291bGQganVzdA0KPj4+IG9uZSBvZiB0aGUgdHdvIG1vcmUgc3Ry
YWlnaHRmb3J3YXJkDQo+Pj4gDQo+Pj4gc3RydWN0IG1lbWJhbmtzIHsNCj4+PiAgIHN0cnVjdCBt
ZW1iYW5rc19oZHIgew0KPj4+ICAgICAgIHVuc2lnbmVkIGludCBucl9iYW5rczsNCj4+PiAgICAg
ICB1bnNpZ25lZCBpbnQgbWF4X2JhbmtzOw0KPj4+ICAgKTsNCj4+PiAgIHN0cnVjdCBtZW1iYW5r
IGJhbmtbXTsNCj4+PiB9Ow0KPj4+IA0KPj4gDQo+PiBBdCB0aGUgZmlyc3Qgc2lnaHQgSSB0aG91
Z2h0IHRoaXMgc29sdXRpb24gY291bGQgaGF2ZSB3b3JrZWQsIGhvd2V2ZXIgR0NDIGJyb3VnaHQg
bWUgYmFjayBkb3duIHRvIGVhcnRoDQo+PiByZW1lbWJlcmluZyBtZSB0aGF0IGZsZXhpYmxlIGFy
cmF5IG1lbWJlcnMgY2Fu4oCZdCBiZSBsZWZ0IGFsb25lIGluIGFuIGVtcHR5IHN0cnVjdHVyZToN
Cj4+IA0KPj4gL2RhdGFfc2RjL2x1Y2ZhbjAxL2dpdGxhYl9taWNrbGVkb3JlX3hlbi94ZW4veGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmg6NzA6NjogZXJyb3I6IGRlY2xhcmF0aW9uIGRv
ZXMgbm90IGRlY2xhcmUgYW55dGhpbmcgWy1XZXJyb3JdDQo+PiA3MCB8IH07DQo+PiB8IF4NCj4+
IC9kYXRhX3NkYy9sdWNmYW4wMS9naXRsYWJfbWlja2xlZG9yZV94ZW4veGVuL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9zZXR1cC5oOjcxOjIwOiBlcnJvcjogZmxleGlibGUgYXJyYXkgbWVtYmVy
IGluIGEgc3RydWN0IHdpdGggbm8gbmFtZWQgbWVtYmVycw0KPj4gNzEgfCBzdHJ1Y3QgbWVtYmFu
ayBiYW5rW107DQo+PiB8IF5+fn4NCj4+IFsuLi5dDQo+IA0KPiBTaW5jZSBmb3IgcGF0Y2ggMSB5
b3UgbG9va2VkIGF0IExpbnV4J2VzIHVhcGkvbGludXgvc3RkZGVmLmgsIHRoZSBzb2x1dGlvbg0K
PiB0byB0aGlzIGxpZXMgdGhlcmUsIGluIF9fREVDTEFSRV9GTEVYX0FSUkFZKCkuIEFsb25nc2lk
ZSBvciBpbnN0ZWFkIG9mDQo+IGJvcnJvd2luZyBfX3N0cnVjdF9ncm91cCgpLCB3ZSBjb3VsZCBj
b25zaWRlciBib3Jyb3dpbmcgdGhpcyBhcyB3ZWxsLiBPcg0KPiBvcGVuLWNvZGUgaXQganVzdCBo
ZXJlLCBmb3IgdGhlIHRpbWUgYmVpbmcgKHBlcmhhcHMgbXkgcHJlZmVyZW5jZSkuIFlldA0KPiBp
dCdzIG5vdCBjbGVhciB0byBtZSB0aGF0IGRvaW5nIHNvIHdpbGwgYWN0dWFsbHkgYmUgZW5vdWdo
IHRvIG1ha2UgdGhpbmdzDQo+IHdvcmsgZm9yIHlvdS4NCg0KSSBsb29rZWQgYWxzbyBpbnRvIF9f
REVDTEFSRV9GTEVYX0FSUkFZKCksIGJ1dCB0aGVuIGRlY2lkZWQgX19zdHJ1Y3RfZ3JvdXAoKQ0K
d2FzIGVub3VnaCBmb3IgbXkgcHVycG9zZSwgY2FuIEkgYXNrIHRoZSB0ZWNobmljYWwgcmVhc29u
cyB3aHkgaXQgd291bGQgYmUgeW91cg0KcHJlZmVyZW5jZT8gSXMgdGhlcmUgc29tZXRoaW5nIGlu
IHRoYXQgY29uc3RydWN0IHRoYXQgaXMgYSBjb25jZXJuIGZvciB5b3U/DQoNCg0K

