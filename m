Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650058BE576
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718204.1120756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Lby-0003qq-OI; Tue, 07 May 2024 14:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718204.1120756; Tue, 07 May 2024 14:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Lby-0003nc-LD; Tue, 07 May 2024 14:16:06 +0000
Received: by outflank-mailman (input) for mailman id 718204;
 Tue, 07 May 2024 14:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rSc=MK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s4Lbw-0003mw-Sj
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:16:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55b9eb64-0c7c-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 16:16:02 +0200 (CEST)
Received: from DUZPR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::25) by AS2PR08MB9714.eurprd08.prod.outlook.com
 (2603:10a6:20b:606::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 14:15:58 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::7d) by DUZPR01CA0149.outlook.office365.com
 (2603:10a6:10:4bd::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29 via Frontend
 Transport; Tue, 7 May 2024 14:15:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Tue, 7 May 2024 14:15:57 +0000
Received: ("Tessian outbound b7675f20d34d:v315");
 Tue, 07 May 2024 14:15:57 +0000
Received: from 70aa33a8b9ee.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4BB05AE4-046F-48DF-AE65-C94E4C18A604.1; 
 Tue, 07 May 2024 14:15:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70aa33a8b9ee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 May 2024 14:15:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB8046.eurprd08.prod.outlook.com (2603:10a6:20b:586::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 14:15:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 14:15:43 +0000
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
X-Inumbo-ID: 55b9eb64-0c7c-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SF39ZeanH4pz/8iEVER6c/q3QV9tBl9AbFg+OWwReqcpZiD0fQ1+szOHSptjOV3gSpH+hyTYB4uG7FywS5IxcQe78tvL7/syBFM+uJ2jQxXchqrv2LnxZwAuLRe6XV+uT+LkUsbLbPoCCPjV2t2nkI1pxh7BGW7ZtbiDRZzEFH1AVLarvKsZs/ZMmYzhXv1eY1T5QMXFxUrLBwIdaHKICd68ZN1kbmTcOzz+M24aRkTlHEPIRZyx89nkNc7oFiXSSTc9IdM8ufHIY67YfJ05jINa3n3H/ktJLyDLxwO5OpgEROZNBYf3cg7QGlAunk8XWOjuEuPPRrPESCl7fFl0bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDhY/V3mlF24qJu1Y0rzcDgTa62AsaR53Ul8cRp69tg=;
 b=ag0RZbEMvgMAHiMzWVaStb8VaKtrL81PPIVbtCrWtJeTImdTD/BoKHxAC32fN3PLksOMEUazqY+ErEJX6OtuA5P4L0hqkOBQI4O+S+yWqQzrIJ8SMkZJAFGwIOgPQAEU59EdrtsKEjtrouyPmgKRtdF0bOt+xwQGcN0KmqkI60gfPtg/7kh5U59IXd1nIhTUKO6oYzHcN46nvRZAbuI3A1mFPjEo3vSy2fUsaLwlRN9ZnRlJQhfMHV5U4VUJrhwm/ipzcvUcIjoiZYpATY3sN4cZ12a3JBhCy87nFIpi0qVFEhnTba5L0dkQZjizy468gTGSYYFzG0fS0gOBVQzUzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDhY/V3mlF24qJu1Y0rzcDgTa62AsaR53Ul8cRp69tg=;
 b=WFAUBK8Kq6Gp4hUR25LmUZuM8iVnpApkpXE3Pkt8MBRv+V74UEeUG0ALWwjIOxQjX0RknZDNnvMYdGQTRhCJUKEd/SJfvX9aC0hqpsJouV1V7TA+BNaTKCNrBQwNddZ/WFxRPz6f8wfWV/yfNzkID5bKTNOqBVcsgW8q/Z80zxg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0597d7055ea7f21e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg3LTHNgKhoqDReRD7zzTtrEdB6N6CaPtQRMjYUSoIC19v+4xpmIGmNrUlme8G3Yz/Tbrr74gCoqaTOF7+mAhiDY28GIqWOjpYRuRsiV4PeizSFjAspw7/jzWY7NjyjQZ4Hzj1WGigqcw/9N3BsQhGiNn/ppkfiyd1GOsu8OGPQs1JD8oEljpu+BIHEg1OEyZq36HBanvr+M5xvW4rHp2IeyQMRbzTZPPYjcjodbz6o3CtQuyFynj7W/FVM1gFyO+Ivyp63qKR+2SF6uwhxpqC5wqsr2LDLsv79vxXYP7eXlv4KOyHWnZ9FH6yxnMaVnrVQERQ1f5t3kJjkdDA8QFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDhY/V3mlF24qJu1Y0rzcDgTa62AsaR53Ul8cRp69tg=;
 b=oXn34NpzNg5QVPUnH0P0jLXWHaA4iK6dDgfJLZnJF/3HfnFTcecfXGzjXFA35DkL7eLxVxWHsp88W5Na4sAzLpHqN3hi8AHi6b1MRWtbLokr3FkEZglAO43IKRRTMTJlm8q6mVmjK6MawX/ZQ44ka0SxH+uEVp9g0uTVDSZm2Hzo7VdSZ20AoUVk0DJpHj/edMPg6Nm6SScWFeUXF0ocE1ZZhwnHyCvCb2W214D/0GvlpT6QRNTUtrEMooThrdhMn8eLe5LJKWBKBWQkZbvHPEMQU4UV9Nd8JgdGkDBqAvyC3sAEemS4gRNRbhlpLbbqBL1eM1MDkRnggTwPDDtH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDhY/V3mlF24qJu1Y0rzcDgTa62AsaR53Ul8cRp69tg=;
 b=WFAUBK8Kq6Gp4hUR25LmUZuM8iVnpApkpXE3Pkt8MBRv+V74UEeUG0ALWwjIOxQjX0RknZDNnvMYdGQTRhCJUKEd/SJfvX9aC0hqpsJouV1V7TA+BNaTKCNrBQwNddZ/WFxRPz6f8wfWV/yfNzkID5bKTNOqBVcsgW8q/Z80zxg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/7] xen/arm: Wrap shared memory mapping code in one
 function
Thread-Topic: [PATCH 2/7] xen/arm: Wrap shared memory mapping code in one
 function
Thread-Index: AQHalVfkdpwTrVVpI0ikGFOyHt7ILLGKSvyAgAGXWoCAAAL7gIAAAgkA
Date: Tue, 7 May 2024 14:15:43 +0000
Message-ID: <3CCC6BD3-0A1A-4AE4-BF81-DFBE3A11364C@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-3-luca.fancellu@arm.com>
 <ef9b0a4d-134c-4eea-927d-5cce0b330aff@amd.com>
 <E429579D-8698-4A92-BD9A-CCD686D1720B@arm.com>
 <86e0857b-32f3-4e53-b869-604f7c6c82c6@amd.com>
In-Reply-To: <86e0857b-32f3-4e53-b869-604f7c6c82c6@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB8046:EE_|DU2PEPF00028D02:EE_|AS2PR08MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7598b5fc-7265-4596-d41e-08dc6ea03709
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NDhlbDd4NVIxNmVGWFN4Rm1md3F2cVAzQUEwQWl6d3BrRldwZ2xiamhhQUNJ?=
 =?utf-8?B?TkhUQ0RwTTgvUmJ5SHBMRy9tWDBJWU5QdEdUNCtpVUZwWFlaMjhOZlNxczR3?=
 =?utf-8?B?blhKNTF2M2YyTWxRcUltbHVydElyUWExWitMNmJJNjk5ZWRLbjljRE5EWEla?=
 =?utf-8?B?UnhaK1A0QTZSUTdYYTMxa3VGZzJ1TWVUN3U3dEZlNkZmZWdxWnQveVBXTmZE?=
 =?utf-8?B?NFJma0RvNVNXWlpEcDlUMEt1UzVucmxYQko2cnJmeVo5UjFNS2dZZjR0UXJ4?=
 =?utf-8?B?dThRUnFwamlGWkVKSm5KVjlLYnhKakFxOThzL29penl3Snd5c05zMWhEdnVD?=
 =?utf-8?B?WEhkdXZBOXdwRVlxSTJMcW9ZbURFTnE5L0RpNlZBSlBZVUFDc2JENW04b0Yv?=
 =?utf-8?B?SXBTZWFxS1J6T05vWURTd096ZWNjTnhSdzhIQnlrdnlJRGdDNjFOcGJCR0xi?=
 =?utf-8?B?VmMxT01xbExubklkVVk2SGhyancxU2xzemNvb09PQUhsUU9DOGlNakdXRkNm?=
 =?utf-8?B?UzVXTjZJdmEyS1IrVVBlVlRIRm1xSnNXQXRYRTRmZHRLOEVQS1ZwcmtvRmt1?=
 =?utf-8?B?OVNhUkR1YnJZTUFYMHF2Ni92cEQvWWxGUXk1SllXQVpWejBrTWU3bW9nMk9x?=
 =?utf-8?B?Y3kycWNCWTdjMWhwRjcwWDRFZ0R6ZFpWN0tzV01nL2hNcXBxM0JFYUVkeWkr?=
 =?utf-8?B?OCtjOGVRNHpHa0UxMGVFQ1ZzdUVVdjl4bnRMVm5semVZOW9XWS9DN2lvNGFu?=
 =?utf-8?B?a2NXdDhZRHF3TXZyZ1JxTHJ4QWE1ZmhDM1p0UFQ3ZEdiamRZRlpabDJrZ1dL?=
 =?utf-8?B?YlExSWxRL0YzeWlNaFlmakdMRlo2WjZudFE3cndpd0NkNDBndXdiVXBSZ0V1?=
 =?utf-8?B?K3ZhZytmbHY0NWZhOTJWWkZqcUxEc0ZmeHArM2dCNnN1Q2krWnMvbXlsV2xQ?=
 =?utf-8?B?aWkzbmVwVnlPSnFTaGFKdUJNd2xEaVVWMkN1ckV4T1NaYTRQRm00cno2S3JV?=
 =?utf-8?B?NEQ5a0pQYXVyMjZyTVg2UEozOGV2Vk1EMFVycmJkM1N5WS9HUVJJeUN2aito?=
 =?utf-8?B?cnB1SnJmTjZPSnNYZVZIR0gzUi9sc3h2RUV1cXUrZzFhSWNSeEF5S2VFN1RM?=
 =?utf-8?B?NXMzaC84bjM1aUVveGJjeU9RYVRwTFhSN0pSOEtCQnQvdUFBMG9MZFdaTGdk?=
 =?utf-8?B?VG5lUXV5MGZsWHN1MUloVEU5VlMrS2VtU0J3bDBVbDVJWXlaZGs3WnAraDND?=
 =?utf-8?B?YUlPRFFiYWNyMFhWeUEyUjVWWXlOOTM5Slh1dTBJWW42QXpsbWFwY3pLQy9r?=
 =?utf-8?B?Q3NBOVVidGYraVZvTVZ0YlN0cHpYOFJmYXVuVHB6aklZQ1lvUU9SeWQ1b25n?=
 =?utf-8?B?VTRyRXpXdkVXQkh2a3lhMHVwQ1ZWam56S1NBTStXOVllYmRzNGNnUUNZQ0I0?=
 =?utf-8?B?MkptQUlkbGNaamptVERVZWZSQ2tSdEVsT3VNcGxqVEYyR2V2N0NxNXdwaXZP?=
 =?utf-8?B?S3F6eU1jUU9XbHdWN2RydGw5UDNNM0RoOEVmdE9tc011ZUpVTExlSmE3cTJP?=
 =?utf-8?B?WFhhdzZlUFRSQmJCN0FxbUdCV1JoRXpSTDZhR2RFYmhqd0J4ZlpBTjdBYmNs?=
 =?utf-8?B?emZvSERnMVJCdXBsTHhlZjN3MnZidEZabzBEOHQ5ZGdmVHlXNktBaElsUEVM?=
 =?utf-8?B?K2FxU0tMazVudUlLaldFMXZSTndRMjZTNXQ3ckJodjVnam11TWpLTHlZY3RB?=
 =?utf-8?B?dEk0R1FGSWZpdVZQZU16TVJ2eC9yRk5keHF6blorUlltSHV3aFlydkFacU5z?=
 =?utf-8?B?UjdIcmNteWFVbThiV1NiZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFC1163C432FF8488B83842DE93B887A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8046
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46c2aac2-1d64-4c1a-6bfc-08dc6ea02e58
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|35042699013|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nis0V2tuSGMrdFdaZVo3MmhITldaeVh3Q0p0cmtRWkRPNldyNDlZbG9Cb1Bh?=
 =?utf-8?B?L0NFemkrQlRDNjgxamZ2S3c5ZHVmMW9wQVdUM3VyZkxxeDZqZmdUL3ZrS3Jx?=
 =?utf-8?B?VVJwRmt5YUtZY2FtYzdUbDFXdDF6ZFgvZERzcnhLL1M0RFd0THlSVjk3TFIz?=
 =?utf-8?B?ait1SDlXWG8yU3JGdkgwbkI2bUhMTGpSYWxHSVVjOUpLRGxrSkhXc2JPQlMz?=
 =?utf-8?B?R2pna3l4NWhBTUpyQTlFKzZMNGVGL2tHaFFZR0F6UDhsZHdRMUlqbHVNZWVM?=
 =?utf-8?B?MmliY2NmSkpZQjFHY3ZGdmpOU0t5NktzN2hvdmlYc1grSWVHbmFGVnl0OXUy?=
 =?utf-8?B?ZjV5V3luL0hzYVJMRFRUMXdCSWE0bUNMVzV1Y2dKRUt6U2pVelhsSyt5ZmZr?=
 =?utf-8?B?VnpJbmNOL0ZiMnBDOFhYLzYrcWJHS1MvVUszN3UyQkZrNmJxMlJDdnk5Y1NP?=
 =?utf-8?B?S1UxTmxUZ3RRTnI2czFnaml6SStVTGVVN1BJZ2JraHlzMmtza0V4a2k0bkFl?=
 =?utf-8?B?cTU1ZjBmaFdseVFGajBRdFVoaXV1TnUvT01NSEJRMzJ6ZERuMmVqNEE3RHQz?=
 =?utf-8?B?UHBxWmM0NlBjY1JHNFhhZ0hoTkZ3YmtNb1cvYXFiblR6clg3NTYzS3VSNkYw?=
 =?utf-8?B?Q3ZORXlLRGZOU0grTzZTWFpQbm9ZRks5MXB5QzAwKzVFU3l5ZFpYWmJHRmxm?=
 =?utf-8?B?bVp1OHBxcGE1akRhM1E3M0ZQR2tCRGwvbko3VTBPQUJjbVg5NE95WkxneTRH?=
 =?utf-8?B?dWM2WmVtY0lsMkJLZms4ODR5ZGRPaC9PLzgwRGxybitqVzE3aE12ZGlBV2xl?=
 =?utf-8?B?U0pSTDZNZnlORlR5UUZSekswTkwrSnJxL0d1Rm93ZHZaWmRMeWJvL2NoR2FS?=
 =?utf-8?B?Y0IrRUlRTmdyRnNoNWJxRGdjaVcxcFphWUhaVmFkMWNTWmorWTFzbWhYOFM3?=
 =?utf-8?B?SUJMbUF2U3FNZWpNem04OXlaTElOOWVubEt1azVkZUZYREZPZktMa2hUelJv?=
 =?utf-8?B?cGVBb0Ewck5SWnlhK2I5YjRJSzNmSGZabVMwVkFiMTVsbDBhamtLRDlVaDVX?=
 =?utf-8?B?T0Vva0xtTmFsSnVJNjdaaHdkZGUzN1RsQ2Z2alFRek1CMHdnUjVwa2JqblpF?=
 =?utf-8?B?WnFPT3ppUEZuVnR1WUZKY0hSN1dXK2NkR25ESE1YZnYxV2pVTGVqdWhRQXVu?=
 =?utf-8?B?b2I5OEZEcGpUZEFiTWg1L2lwZ2xXcGtNR3hQb1RPbGtNNU52NlptTUQremZa?=
 =?utf-8?B?OStaWVhyU2d4eGdML05QK0t1Y1hxdVBGazNrRVd3bk9YK1lMRjR0bVZrSWF4?=
 =?utf-8?B?UzNkVjZja2drcCtzNnR3UXkyVFIwVk5uMm1vQ1FablYvSzdmT01QYW9KRTZJ?=
 =?utf-8?B?dkVjb3VmbUNndjQvYUhORjlRZXkxWEp6N04wMTg2c25HQktobmx0bkpTT3Iz?=
 =?utf-8?B?TFQvTVNYTTlqTHNXbEZuYkppRGFBZ0Q3MjVLSjk5aWZPeEFXSmcrOFFKdXZt?=
 =?utf-8?B?eFZJWnJLVG8zbzlCdStxOEhSSE5zK0RlYnhOOHBtdXR1TysxYStHYmYwRnN4?=
 =?utf-8?B?QWVtNkdsU0E1cDQxTStaTnhtcjdCMDBwSCtpU0xxL2VlTlJCLzlkdFByVHQw?=
 =?utf-8?B?R284NHROd1ZZdC9taVdSRkpyYXNUUzBhVDlMbjByZkV4cVZwc2pzbFRway9x?=
 =?utf-8?B?TnpXZmdiNHBlbVFKYUJsM3NUMFNCM042SzR1ZUVMN01uQjZoZk5tOVVYelJR?=
 =?utf-8?B?WWJKNytDdC9jWTloNlMyak8wN3l2enM2M09mbXhEcWpSZ2VDUGZQaTBSaEov?=
 =?utf-8?B?S0JVaCtpUUxuZjE3bEVkRUFIQnB4cnV4VGE4TXF1enVQaGl0czgrQTZqTHlm?=
 =?utf-8?Q?f6a/BlABw+Ze/?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(35042699013)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 14:15:57.6825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7598b5fc-7265-4596-d41e-08dc6ea03709
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9714

SGkgTWljaGFsLA0KDQoNCj4+Pj4gDQo+Pj4+IGludCBfX2luaXQgcHJvY2Vzc19zaG0oc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9kZSkNCj4+Pj4gew0KPj4+
PiBAQCAtMjQ5LDMyICsyOTAsMTAgQEAgaW50IF9faW5pdCBwcm9jZXNzX3NobShzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPj4+PiAgICAgICAgaWYgKCBkdF9w
cm9wZXJ0eV9yZWFkX3N0cmluZyhzaG1fbm9kZSwgInJvbGUiLCAmcm9sZV9zdHIpID09IDAgKQ0K
Pj4+PiAgICAgICAgICAgIG93bmVyX2RvbV9pbyA9IGZhbHNlOw0KPj4+IExvb2tpbmcgYXQgb3du
ZXJfZG9tX2lvLCB3aHkgZG9uJ3QgeW91IG1vdmUgcGFyc2luZyByb2xlIGFuZCBzZXR0aW5nIG93
bmVyX2RvbV9pbyBhY2NvcmRpbmdseSB0byBoYW5kbGVfc2hhcmVkX21lbV9iYW5rKCk/DQo+PiAN
Cj4+IEkgdGhpbmsgSSB3YW50ZWQgdG8ga2VlcCBhbGwgZHRfKiBmdW5jdGlvbnMgb24gdGhlIHNh
bWUgbGV2ZWwgaW5zaWRlIHByb2Nlc3Nfc2htLCBvdGhlcndpc2UgeWVzLCBJIGNvdWxkDQo+PiBw
YXNzIGRvd24gc2htX25vZGUgYW5kIGRvIHRoZSByZWFkaW5nIG9mIHJvbGVfc3RyIGluIGhhbmRs
ZV9zaGFyZWRfbWVtX2JhbmssIG9yIEkgY291bGQgZGVyaXZlDQo+PiBvd25lcl9kb21faW8gZnJv
bSByb2xlX3N0ciBiZWluZyBwYXNzZWQgb3Igbm90LCBzb21ldGhpbmcgbGlrZToNCj4+IA0KPj4g
cm9sZV9zdHIgPSBOVUxMOw0KPj4gZHRfcHJvcGVydHlfcmVhZF9zdHJpbmcoc2htX25vZGUsICJy
b2xlIiwgJnJvbGVfc3RyKQ0KPj4gDQo+PiBbaW5zaWRlIGhhbmRsZV9zaGFyZWRfbWVtX2Jhbmtd
Og0KPj4gSWYgKCByb2xlX3N0ciApDQo+PiAgICBvd25lcl9kb21faW8gPSBmYWxzZTsNCj4+IA0K
Pj4gQW5kIHBhc3Mgb25seSByb2xlX3N0ciB0byBoYW5kbGVfc2hhcmVkX21lbV9iYW5rLg0KPj4g
DQo+PiBJcyB0aGlzIGNvbW1lbnQgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2YgcGFyYW1ldGVycyBw
YXNzZWQ/IEkgZ3Vlc3MgaXTigJlzIG5vdCBmb3Igd2hlcmUgd2UgY2FsbA0KPiBJbiB0aGlzIHNl
cmllcyBhcyB3ZWxsIGFzIHRoZSBwcmV2aW91cyBvbmUgeW91IGxpbWl0IHRoZSBudW1iZXIgb2Yg
YXJndW1lbnRzIHBhc3NlZCB0byBxdWl0ZSBhIGZldyBmdW5jdGlvbnMuDQo+IFNvIG5hdHVyYWxs
eSBJIHdvdWxkIGV4cGVjdCBpdCB0byBiZSBkb25lIGhlcmUgYXMgd2VsbC4gb3duZXJfZG9tX2lv
IGlzIHVzZWQgb25seSBieSBoYW5kbGVfc2hhcmVkX21lbV9iYW5rLCBzbyBpdCBtYWtlcyBtb3Jl
IHNlbnNlIHRvIG1vdmUgcGFyc2luZyB0byB0aGlzDQo+IGZ1bmN0aW9uIHNvIHRoYXQgaXQgaXMg
c2VsZi1jb250YWluZWQuDQoNCk9rIEkgd2lsbCwganVzdCB0byBiZSBvbiB0aGUgc2FtZSBwYWdl
IGhlcmUsIHlvdSBtZWFuIGhhdmluZyBkdF9wcm9wZXJ0eV9yZWFkX3N0cmluZyBpbnNpZGUgaGFu
ZGxlX3NoYXJlZF9tZW1fYmFuaz8NCk9yIHRoZSBhYm92ZSBleGFtcGxlIHdvdWxkIHdvcmsgZm9y
IHlvdSBhcyB3ZWxsPyBUaGF0IG9uZSB3b3VsZCBoYXZlIHJvbGVfc3RyIHBhc3NlZCBpbnN0ZWFk
IG9mIHNobV9ub2RlLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

