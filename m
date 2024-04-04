Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EE28983F5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 11:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700761.1094383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJOH-0005kZ-1R; Thu, 04 Apr 2024 09:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700761.1094383; Thu, 04 Apr 2024 09:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJOG-0005jq-Cf; Thu, 04 Apr 2024 09:28:12 +0000
Received: by outflank-mailman (input) for mailman id 700761;
 Thu, 04 Apr 2024 09:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClcT=LJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rsJOD-0005i3-Rx
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 09:28:09 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2607::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5bd7e7c-f265-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 11:28:08 +0200 (CEST)
Received: from AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::24)
 by DU0PR08MB9026.eurprd08.prod.outlook.com (2603:10a6:10:47a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 09:28:04 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::f5) by AM0PR10CA0044.outlook.office365.com
 (2603:10a6:20b:150::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 09:28:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 4 Apr 2024 09:28:02 +0000
Received: ("Tessian outbound dc0a9029eb2c:v300");
 Thu, 04 Apr 2024 09:28:02 +0000
Received: from 0dfbd8d3455d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F20DD501-49E4-4E47-A54F-58EAA9D0110B.1; 
 Thu, 04 Apr 2024 09:27:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0dfbd8d3455d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Apr 2024 09:27:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8269.eurprd08.prod.outlook.com (2603:10a6:150:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 09:27:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3716:2f81:3984:f186]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3716:2f81:3984:f186%3]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 09:27:47 +0000
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
X-Inumbo-ID: a5bd7e7c-f265-11ee-afe5-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=S5eUbsYK92cyMkxqtwNK3S0VIH4uphY5PWjqeBVFUXlb73ezGipe40G0Ni2RPbTxNgky27QAoY08o78cuCjVJwM/xQTKvqmGVuoDEj4l971NR1DPIcS3sOmp8zXZkw5aBzpuRCpUJADR1uOqUPpAjBaP8G99hj18NO5H+JVT8THTlnZXis4T78jLyWf509/EdbuDkQgvYUSKBolYT1gPAnQ/2b5ilRVR8vx3lh/5YFzJxCuoWHreiaNXJ4OoDCJwbhEjhnNDdGymd2ofLy1fI1H0oqRV/Ahv9usH77LAGrQzmh13dV8Hm62ImbR1c49+j3rfUs4sUAKAd+90YSz0ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Fg51ZUFHtjpVEZiwGUv3H9M1YsNRXkjRQoAZBiqzM=;
 b=nlFWAc+Rj6jaahU3Ro4TzfAbZg23EGI1wrsa7U7+heXjNSe20aA2gq29GJoR3AM0NEJpSyG5xqLe87KgWUJI2DzOmz41ZKe12iHGDENHviB0QF76F6QJ/L1wR+H8LutYBnziMflLH4m9YDs0j/uzA5hj6GXSrwy2uaVwf6R7+N6yN37PVyA/mYMDwRi94fvt5H6yTOr2Xv9hpJRlwaeyQQACw/fvUchTmRMBJmnOCz0J9+b3C0jgqsmKHimnSSHx9/cOzfGb6ZVn5EzhJ5EZasz/LZH11SQ8LvRAdYbpEBeJwFI4QhV0MmvevkGaqj7ODa62FnZ2rUqBYFSaUUL1Vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2Fg51ZUFHtjpVEZiwGUv3H9M1YsNRXkjRQoAZBiqzM=;
 b=aLw23cR2d1iM8fXSscuieYeb7rx+iAhjOXVYBnhDiQQ50ty+GnN1YnbA5jwvVvL3cqV5Nq7VCqOZ9+TN2DQ6ZKAb9WtwR+14autI9Bh/umqdZkwJbTDqqGLzmtYUTxRHG3ay7j8qt2cnrTLHwdZ1wNa+fil6VkMEQNmlBS1l8ec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29447c925fdfa02b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV/WrgmfoM0n/LRe1BhTF2TKMhA7V9Rx6N3Q3VuqgavU+sRLHpwoSSitQr1Q5RI6GoH1CbRfvbF0S7o108huSwCN7MxPqLXGK9PPqrgx0Ky8KByFXN1S1s668Deka6Jri7s0Rs14FUJKXHmERZw505uhQNT6L9NCU4uh9lvuFUt9K7vfAIkKUfI/3hYBuDzuLK17w+QT4JFYy/6n27vemMSL3u9DSOIFCs+5juahEKscfpBi89n5JI87JBax7uaswgP1LR38lROny43C6OxkW4LrGBNa0GBp06jLwXYO/dlXv/rMItr32Sk2jTaFyBduZLYGevwnowKGYJw2Zh0ZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Fg51ZUFHtjpVEZiwGUv3H9M1YsNRXkjRQoAZBiqzM=;
 b=jTJtkppJ9ymIC+KpkLFOOlvCV0FPBJyS1tesoz3e8VS9kDhscLcJRfykp4RLb6vqmidAjnuOEzx6G6KVEZgMmPuxF6x/6nlUi0IgroagXRzxKKEjEUYLKkZTGIlSWu0Y5eRhDbWGlH/PioYNBxZr6agHcStzBBg9xgcjMpCWwoP71LEo+ZXwksr/gtZ64jhDotq794uzd8SKXvpdSwSB5LZrSWSgvUajmTYWXhfllIuE2ealIK/IV8blDn/6iQx/IBg47aVuYjMuN4EsUoxmgjZvt+kCLkOEhTAXmYC3hoXnQhEY1qb2ZOPw/TgFCISzcBLLv4zM0hgt1HcQJ0ZzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2Fg51ZUFHtjpVEZiwGUv3H9M1YsNRXkjRQoAZBiqzM=;
 b=aLw23cR2d1iM8fXSscuieYeb7rx+iAhjOXVYBnhDiQQ50ty+GnN1YnbA5jwvVvL3cqV5Nq7VCqOZ9+TN2DQ6ZKAb9WtwR+14autI9Bh/umqdZkwJbTDqqGLzmtYUTxRHG3ay7j8qt2cnrTLHwdZ1wNa+fil6VkMEQNmlBS1l8ec=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 04/11] xen/arm: Conditional compilation of
 kernel_info.shm_mem member
Thread-Topic: [PATCH 04/11] xen/arm: Conditional compilation of
 kernel_info.shm_mem member
Thread-Index: AQHadH3RHiV9l/CStk23F/JZ/hhrzLE/Mq8AgBjI/4A=
Date: Thu, 4 Apr 2024 09:27:47 +0000
Message-ID: <80AC304B-270F-4EB7-85BF-78B55D5C454E@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-5-luca.fancellu@arm.com>
 <0dd4d824-068a-4975-a1af-e194337a64b9@amd.com>
In-Reply-To: <0dd4d824-068a-4975-a1af-e194337a64b9@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8269:EE_|AMS0EPF000001AC:EE_|DU0PR08MB9026:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5e0asRGrKyHDSAX5vPLB34qZ61cvP4bWq0GoBMoWsCrj+TY1UgdOIIGCQZ84nZp7p5l3BiDHRbuAr5gVlUN8zHHNo3sT/P67LHzscPhM13l/vXJQdfxQRd7lSdmFUoczmgtvMWxi3cZHlHjAqiawBhbFSQ/uVbc+L2g5Mbq9486qla2x1aiWRaarbcHIMJZ7xnLNLz1pqncI/5JFiFyGUvBlPoDcthgTDr4JJmQb6KhzAJVSKsnnY4HM+/yLhiClDUyexX0OZtHqt0kxaVF3sS6Sl4dXnEHiQdF/QKbZXi2XjNHyXPsuYlq1YxB4Hv93k5/BZo4jmld414ZLpPcUaphAtNKcEXJHr+9AOHICKAIi2ijAgsc8XpwFknUHdf1WMUAVMrVp9iBfoOifa+L4BOs15FDweHKDvRQdlWE0J9tUD6F2AoriMvGJnlxFIvKXmpTwZZRp/3uK+A6vv1o0rnfK4qAAG2HyNKo11H0zL+O99E7VbNWRwwSbRsBH60V0BpFC9uSSiuneaQVQXb6VRPpgRPRMeB4ziRNW8YhOXNm2kAFaZoYbcpAGzCcXGcpXureEvBs5ute1tadmBVdJXyw7czCP8gUTZB527aWnRORyt55+1ioUo1SPtBWWcc0ctZcUZ95DvXgPFlRd9No5cDHfCYi+1sTwXaCayWOAPSI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <143C879C08870F4986D8F6883EFB4A34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8269
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 138ba02d-8edb-45eb-1662-08dc54898681
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t6emNqRVczjpjaM3E6B0pJ4BMQH8HKIxpujMJNmy7O3+ZCXswbIuEbIV7pPxvZRYrIuR2TAey3eXpHaKclgJ6fCZDnqHzpsoxyZz1Pfbh4O2LWMk9OwnNvr0ZWmlCYudWlIl4QvC76wom4MLADuT8S+zDhUgpsDY8svDdYanBgJNeF9GrE/gQhXU2Q+cnIbBaPclfdyxoeKnqln5hF8LCXYf0u16gf8QG4cJH+8ec7B3leVh9U29cnirXqiuYy18hkPiG393rXqAzsBNLbb8sPcy2neutPdmU7A48cIzV6FRBWCe56WR/r/ZaxJTXcf+wNrKrVEy7sGEg8y3AuuzZU0ZXrlt3Qi4dZybuWke5J/N6Ox66sVW2PRzown8In1DeykdMUmmon6ZOxF21Tj5kVaiJ2mdPxr4aMi6hhZgByRcueLLdS+u2yRxj3LtxVmH8cnDO8tQ6Jl/U9wgdzrbFZ9yk0sjymbnLWFg2zJjPXZbw1Cb6muhl9OSaOEs2j2qzltSHy/CyNFMt+AwhjiCCcRtesr3+vNaxGlJPZ2oiOZMdakboK4mA/zWt4GHehSwp5lk+5jVA2y14RNBIBlw4GiBOnh9+3d/E/ug/M/DtGiUwDqv1TAQ2NHVyqL0OeIsKsdZYErnt1R7HvEO5JfVCUSDKvh2AWTkZxh2iaYA2M3mE7kW+jJINlktC6I5ij+kAVuFJVcYT/4KvdeMbnEA4ZOKzdkcDgSZ7/XITc9f7JAMNeu/8OaZ/241wllAVBrD
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 09:28:02.3002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 138ba02d-8edb-45eb-1662-08dc54898681
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9026



> On 19 Mar 2024, at 14:58, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Luca,
>=20
> On 12/03/2024 14:03, Luca Fancellu wrote:
>>=20
>>=20
>> The user of shm_mem member of the 'struct kernel_info' is only
>> the code managing the static shared memory feature, which can be
>> compiled out using CONFIG_STATIC_SHM, so in case the feature is
>> not requested, that member won't be used and will waste memory
>> space.
>>=20
>> To address this issue, protect the member with the Kconfig parameter
>> and modify the signature of the only function using it to remove
>> any reference to the member from outside the static-shmem module.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> NIT: I always wonder why we have hundreds of functions taking both struct=
 domain and
> struct kernel_info as arguments if the latter has the former as its membe=
r. As you are
> revisiting the function and modifying parameter list, you could take the =
opportunity
> to change it. But you don't have to.

You are right, can I do this modification as part of patch 3 and this one? =
Also, can I keep your R-by
here when doing this change?

>=20
> ~Michal
>=20


