Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00197C8D3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800652.1210608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srFrO-0001L8-Ed; Thu, 19 Sep 2024 12:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800652.1210608; Thu, 19 Sep 2024 12:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srFrO-0001IQ-9a; Thu, 19 Sep 2024 12:02:10 +0000
Received: by outflank-mailman (input) for mailman id 800652;
 Thu, 19 Sep 2024 12:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1srFrL-0001I1-V0
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:02:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2614::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd21a04a-767e-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 14:02:06 +0200 (CEST)
Received: from AM7PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:20b:130::23)
 by AS1PR08MB7404.eurprd08.prod.outlook.com (2603:10a6:20b:4c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.14; Thu, 19 Sep
 2024 12:02:02 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:130:cafe::54) by AM7PR03CA0013.outlook.office365.com
 (2603:10a6:20b:130::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Thu, 19 Sep 2024 12:02:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 19 Sep 2024 12:02:01 +0000
Received: ("Tessian outbound d89c8a00b6f7:v457");
 Thu, 19 Sep 2024 12:02:01 +0000
Received: from L0e593a5d16b9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F36EBD2-3CDD-449B-BD75-18D654DDBF4A.1; 
 Thu, 19 Sep 2024 11:53:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0e593a5d16b9.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Sep 2024 11:53:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB8476.eurprd08.prod.outlook.com (2603:10a6:150:84::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.14; Thu, 19 Sep
 2024 11:53:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 11:53:19 +0000
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
X-Inumbo-ID: fd21a04a-767e-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JssUsnXORHcxqxCs1ZvRPiOOD4ZgfJtCf17z9rvL6ZW565iIZ71Ob6KsfDyXzH4r4aMh4jLpvVgXOxUSYf6W6ddlnTrLOiuKnd1tK/eLUJ1jW94m/Lu7EN8a1Th3IWuhwGkc+0RZcjtsWq7CdDtSKAtFtpXxLDpi0rT0AlshGCbj7RXa/TZtiftFd+b61Di3uxfGAl7HOumw9YninwX+izGiu6hGVVCcCD6t5N19pC4/DUA6z4fuaLgGJH/MuOYgFI/47U+zqVqjEPvNBcR61E/g0GkfWABUMmnwSiEzH/jtUW3TEcKeITBI8d3RnZL7/MJlHckd7oCg0ju8iqHUgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlghDQzdo04bKGITpolabJX8FvX8BVdxQL2ss6EjCFs=;
 b=MUVR6V0tuzZ2vLg1cBJ2C43dPsGBZ5dZkc2WTlMH9wm2i5+weGNAuLrwDMR6R3PdhEmGxu2ps7L9BWV3OAbyzfMknPYLpx8duDB6wzudYcSEjOYWuMk85l/6u9pODbXQhct9WyFSAJt9bAXPGxCy+ZCzq9YX7c4PCBCadCQDEvyFpmeRYpq0tzhvIU5V8/p2+ovSW/pkilrZ1Mqzx7LsJnAZqQhfzxc4clqBR4mO1Vu0dWGHXFZS8/XcbGo+Nz+VCWigznK8GSHWDFhIlJDaPztLCBAlcmTSvqtSorBxC6/rx5tpt6jvPPlQeyUx30p0bfILQQBat+ucg77wf3en1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlghDQzdo04bKGITpolabJX8FvX8BVdxQL2ss6EjCFs=;
 b=aoy4/yxj/f+aT8j6PcaPx7zJmI7JEHqrSxQgiwo2tZdqbFbBfaD4uWHIQD/1dWJmG/JbEQIwSTC3jQeFw7E7GcRG2x4BEd+Iv2UC8U2S6UBzlgXiGjFmaAJt6nH35uCOOnAdH2zF84BzgbOfQUAdcbgDXwOAifiFXQFUNzMY2RA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1cad921367be5dde
X-TessianGatewayMetadata: BrQtKRhCG+CIxPB3gucRexXcAqp9r6SfdF2AdlQRie98GDT/U0Ox7cZoLvyh93VJ9vwx9FiC8e+cJNrQulMdDsfVASADlGa+e/1C+aGkYdBqshXgN7HFb1+ECBmrq4eZsT78je5F2YQ+8Igc7RxCAAs868lqm/PdYrkhz3145U0=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0y73OMajPJqDbnS8pO79CBRGMZ46dn2NfsX80IRGEb72ozH8NlwPY1D9Sonb38gq1wfiyBNS9gJ6MBHMkW2gfz1hfIxV1M+ajsLILGvEpZ5FFCTMGC2farFog1jG+DJARYkDdA/phcEBsG5E0y6kIRP/FIuEIYrin3C5vftmh6rHBHsbKoe8B+ZoR5/uKuJxdD1++jg28DmrT7kPVze4RRl3TIa2xADuPvbOUPC4Al7EBoOHoYsj0+9ukRXvg5kJ7o5r5sHdbUrx4Ufbu24sDkGwg5B8k2mZ/UvIo1JqiL2PzImMjsJmn4fw04GpQIq13/+ru3yyF5IUE9emkxnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlghDQzdo04bKGITpolabJX8FvX8BVdxQL2ss6EjCFs=;
 b=LKRFvJA+mSh1AepDRd8Ui3eYTgY5Xa2e4cjQH9oykqQjTjbwy2+RhHqScgffeXqVj+6AePD3h/NYRSDJSz+KTCROxbZYHRzxjYOZjwEVhT5fu0AOpXdJOcQkxpn/OOlyc1iuWu0cd7uAXPcOzBjjdWkqC6dBfexRN/zl0Gi3OZY5DsorYCrrtJjD93OI0MNerG4NBDLPOBgoltP02JD3zFztOZQS8lMTwAWjYYFDCfa+T4UpMo3AwDbh7p5JP+qkZQJmOKywMoru/KAJc3SzgLWdwJaTDN/4IZdri5pDpHqBaHvCFu6Xoj7tL1agmBhyYilUMlVkHpBCL2bCUsdj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlghDQzdo04bKGITpolabJX8FvX8BVdxQL2ss6EjCFs=;
 b=aoy4/yxj/f+aT8j6PcaPx7zJmI7JEHqrSxQgiwo2tZdqbFbBfaD4uWHIQD/1dWJmG/JbEQIwSTC3jQeFw7E7GcRG2x4BEd+Iv2UC8U2S6UBzlgXiGjFmaAJt6nH35uCOOnAdH2zF84BzgbOfQUAdcbgDXwOAifiFXQFUNzMY2RA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2] docs/misra: add R17.2 and R18.2
Thread-Topic: [PATCH v2] docs/misra: add R17.2 and R18.2
Thread-Index: AQHbCgie8BoAtxq2Jk+2dIA8q9C8grJfAOyA
Date: Thu, 19 Sep 2024 11:53:19 +0000
Message-ID: <F60A85A5-7C6C-4D67-AF44-B167CDE17884@arm.com>
References:
 <alpine.DEB.2.22.394.2409181322070.1417852@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2409181322070.1417852@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB8476:EE_|AM2PEPF0001C714:EE_|AS1PR08MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1b108a-1778-431a-602b-08dcd8a2df28
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?N9APe4wG6DBcIxdskKLiGFBLf718ALTAnWlO0Tukm6vW5nYQzfRSW9KEdb?=
 =?iso-8859-1?Q?WqQ5RlGBWE9dNHK8xvsMTDvPYN36JP8AVViW1Ux95/OAX0TSot9PjDjRwE?=
 =?iso-8859-1?Q?mGoIbHDooBSSI7Mv27jvHoqyqw66qx9nwagDi6ZR14scFqymt89u8ozWVw?=
 =?iso-8859-1?Q?JyzftgNI1S82jAfUbGE3aefxBT/fItftD7bz+EWIJfTk9xhnTvdTKok3+O?=
 =?iso-8859-1?Q?7GPys2Ma+F5suplkqHjuwBonnaGOTA57ViaZnFg8iHXmsXUyrWgxV/nM88?=
 =?iso-8859-1?Q?5h4lNMlmYZ1dCquZRJwfLly0SfQZic+2zLeY/Mn8gxeXC/nUz1wf6lAvLn?=
 =?iso-8859-1?Q?c4+7eBMGVCPsRDpSEatJ4bl71A9DBEfbA8lp/fZ6wt4/rlD/tBtDU37UIV?=
 =?iso-8859-1?Q?rER54cm7HjA9x1fhaNieqK5kW4JjEA84T2Qb6Mh1dxLkZA5Qx64GWRxKX3?=
 =?iso-8859-1?Q?+r/OwAz91DnR8wbsCmtF3iObfyWghdtL2m9iDSLuGynA9t+RkfZQlj9A3V?=
 =?iso-8859-1?Q?hZMcxVB84eHWa1SII281CVxPyNDUmme5qIY2ql72DzAxw3RyuBxCEAc6EI?=
 =?iso-8859-1?Q?XedkFGk0c+wOYlMWGb1kL3Ho9OaXLtDvXCy9PCEOEuBhftjm/wLhUznh+1?=
 =?iso-8859-1?Q?fNHhb382N1KwsDx8uwbrHHtDhwL6/oY5/8ew+unLiSxWeA5pwf7whahMZf?=
 =?iso-8859-1?Q?/pGhwGu8F1PJid0UenzKHsAAhZ1XqF+A4ZCSaQTjFfoEXPrV54D1xphKm/?=
 =?iso-8859-1?Q?22AUxjVMUqNrYgOJisa+9vqtmxzyflmDN8yF+4aYMkQz4Rgh5sk5METxJ+?=
 =?iso-8859-1?Q?YjvPpW8XVaGweAvhyFfiQ3ILu0QRsfxYHpSFQvIYVARhDGCVfnS5BeXwfJ?=
 =?iso-8859-1?Q?g5qXF2qKUF2mL61eqzsa9Jrg9x0CI4P/pv6kcmLSupcquFgT/rgrzwrS2w?=
 =?iso-8859-1?Q?nPpoDSCfw5ciO9tvx/sOFWLlcfgx+2GXwMoXKFeeNVaYgBJlcIf2mSt/8n?=
 =?iso-8859-1?Q?C3yuVHYyovX5hkp9Nj7oYIVcAVz/tSNVs1q/086EAtALcW77Z+Y3YX+csz?=
 =?iso-8859-1?Q?INSqZORRi8NZZtD5gql5lNQGX2BSwFpxP1bkKtiby20sYlqFHS18G6J98h?=
 =?iso-8859-1?Q?2h/CZFUL0jm9mxi6mnECui3bduYEB17Xeh/Kahkb86XNwztf0VpoLZiDYL?=
 =?iso-8859-1?Q?xkOrkbAyb5KXpS7Jhu/NJXu4GUyAv2/o/t9cxg62BD6i9i4RPnfxTF4nG9?=
 =?iso-8859-1?Q?3/CrHndRM3RpCKYnIw0IiQg0ht8j0x0Lk8I3+u/Tpv/pZ8RPoJFS1p8Hfo?=
 =?iso-8859-1?Q?A0SxiLKr7F1jNqjdk19qKBegRaIs8mWnDUSgC8AFFiDfMEDIHaaVtyYLly?=
 =?iso-8859-1?Q?YSt9N9wb7fJbNyFv8zhTH5Sa5riLzvlfc9oUjhlVosPkzUYj8Ikqw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <81C9A1738F6529419070629E05126FB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8476
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47f37ce3-eae0-4430-86a6-08dcd8a1a7bf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?TX1jJ2POLwbpP7qV+WcXPybnmOhVkbCRhJVB0l4T44z+aOF/UVj2Vm0A0q?=
 =?iso-8859-1?Q?wms1Zo7q0/smm5IGDlP5V4/UYfFNpy6RdAdoJ9dCxF4D1qAPyv/Zzx3r25?=
 =?iso-8859-1?Q?hYmMAZN7pXPSVmwpKese3GBt5LnQqb9hqFXVt365d7+n3A5+KlYfdKMoUT?=
 =?iso-8859-1?Q?yt0cLYwq8yQTPmF98Z37Inx0FUQcPntJ6hCzYrX6qsBMXGh4CN0mj9X/P0?=
 =?iso-8859-1?Q?YvLMLhsKNwSmYf5KZcgG1dYO04P3keqX4p0Ar3BG0E8+NSZ0qgt2QlzTfy?=
 =?iso-8859-1?Q?3iYCAwWvHrpey0YKPWzNo1n8Q5sTd2P9R3/3O/msvBjr1cVf8ww9AC9nt1?=
 =?iso-8859-1?Q?1lHeTrDKzQPXA4rkEwHTtPQthsbQFbAWu1eJvhdKagZ9T1970+fy2humSg?=
 =?iso-8859-1?Q?MF110L+dYRCa/UcwkcyzdSLvRv11Pz5ViOYT9eIWJ+O7TDGFURwvnH0bf1?=
 =?iso-8859-1?Q?FJbYcdN85npzZFxmUmF1WoYzlAK2za6U2RX9rUM8mxolfSPljU+5Zl/F2A?=
 =?iso-8859-1?Q?dc+ukUE4JFOspd+phOCDK070udttsbazRbxeP9JnSq5pNX7R/lPRhgc0wm?=
 =?iso-8859-1?Q?kUpsmmpeBLsuiW+0iIurHwjUfST0TFFNvaL7FWEGcMZ31il+/ffK7twUcX?=
 =?iso-8859-1?Q?amo4lDmakar5GikBPhESfoMPrkkHqrIX/LBNw9O90ueZU4pmL2wT17SAHT?=
 =?iso-8859-1?Q?cipWZaCaLhEGyX2ShK/FqJsUAlQ4XKAsYeKSAilDva1y4PiDpiUhzjcWeT?=
 =?iso-8859-1?Q?72YKGrsktFNi+VsfJYnvd/r3Um9hVJdJQldmHeNQA9KzTi47nwlD73hnVl?=
 =?iso-8859-1?Q?ULBtIczFEq5sOqYS3Vmmb9oM80zgtW73U/H/6XoOJ5NJnohP3s+2c/XFle?=
 =?iso-8859-1?Q?qCwSQoZcQ7ca/domgZdJn7c+Bdvk5nSwkXRZByWjGfNj5FdgSPtMrEU/ef?=
 =?iso-8859-1?Q?+tCHGXsX07sLpqDl6uXp+Cw2FEMfH5pocgyx7vlWL1dSL2j39QuzaEanX7?=
 =?iso-8859-1?Q?i/06XBBrV5pdn/0zM87xGFB72fKJME7Rj9G0s0olISA//oueCCXkgUMuyZ?=
 =?iso-8859-1?Q?ajXtkq0tlYlRWtIZWWuxDRm/1JqbnjseYUD2DjHYBavDe5KKw9/jIG29AZ?=
 =?iso-8859-1?Q?X6lDN8bwq0OvGkRySft7Wjx7eMqFhILbUS8rq60vr5sdaFnywkT8wosrVe?=
 =?iso-8859-1?Q?m5CfNbmIRhn36r2HDtEnkEjEF2+tjawnKDkzUmIKoBWtcnQiFvQhedMlEW?=
 =?iso-8859-1?Q?+y2xnA3y+MEsi25dDnLcQ8VJmKyLZI5nzacuVykEBvwCuL2bp8ttx8/Bv0?=
 =?iso-8859-1?Q?uWaiVBkAD0/mtWDqKcM8E6MZ3lZEewrsjmK59W9h5cHi+qgiCdOpzZbLzl?=
 =?iso-8859-1?Q?95x9q354wSG9TfURqV1K+6erD81uPFnoHMZk5w2I6sMY4L3/3lSJa/ecD+?=
 =?iso-8859-1?Q?BP6DpMQjkgach2EliNan6kcA4a6+z43k3rNCEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 12:02:01.9565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1b108a-1778-431a-602b-08dcd8a2df28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7404

Hi Stefano,

> On 18 Sep 2024, at 22:23, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> The Xen community is already informally following both rules. Let's make
> it explicit. Both rules have zero violations, only cautions. While we
> want to go down to zero cautions in time, adding both rules to rules.rst
> enables us to immediately make both rules gating in the ECLAIR job part
> of gitlab-ci.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - improve the note of 17.2
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index e99cb81089..4a144da8d6 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -561,6 +561,13 @@ maintainers if you want to suggest a change.
>      - The features of <stdarg.h> shall not be used
>      -
>=20
> +   * - `Rule 17.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_17_02.c>`_
> +     - Required
> +     - Functions shall not call themselves, either directly or indirectl=
y
> +     - Limited forms of recursion are allowed if the recursion is bound
> +       (there is an upper limit and the upper limit is enforced.) The
> +       bounding should be explained in a comment or in a deviation.
> +
>    * - `Rule 17.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_17_03.c>`_
>      - Mandatory
>      - A function shall not be declared implicitly
> @@ -593,6 +600,12 @@ maintainers if you want to suggest a change.
>        submitting new patches please try to decrease the number of
>        violations when possible.
>=20
> +   * - `Rule 18.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_18_01.c>`_
> +     - Required
> +     - A pointer resulting from arithmetic on a pointer operand shall
> +       address an element of the same array as that pointer operand
> +     -
> +
>    * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_18_02.c>`_
>      - Required
>      - Subtraction between pointers shall only be applied to pointers


