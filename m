Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMhECvIMj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96700135C3C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230654.1536091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU1-0001mW-BK; Fri, 13 Feb 2026 11:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230654.1536091; Fri, 13 Feb 2026 11:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU1-0001kK-2p; Fri, 13 Feb 2026 11:37:13 +0000
Received: by outflank-mailman (input) for mailman id 1230654;
 Fri, 13 Feb 2026 11:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfN9=AR=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vqrTz-0001fQ-Ae
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:37:11 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 554375af-08d0-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:37:10 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB9PR03MB7615.eurprd03.prod.outlook.com (2603:10a6:10:2ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 11:37:04 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 11:37:04 +0000
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
X-Inumbo-ID: 554375af-08d0-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtoAtA6AVijymU+WF001OO3yF/SDoc1A66RYels80qeBwMIh0x1cocukhGymbcvjt0RVsHIH2+ZaJtD6Mh/b4eZEZXbrWWYMSKxGUSxmNlblzLzQzDVMfeOLz8+LuhY8HKP6bn/14y6JDrYO51NhwD3LtOHoJx6CbE3K4evg4QnYtJU9t3nLpS72gNN1sFAYKaI44J5h4T/SWondG8pCGiL1z4qW7anXt9l8fsp3IU8jlGdhsIMb/W0wDlBvS8l7vaqTUC/cXThXXp24f/s8pEI1uEKGJz7EJxLRTDmCsfrhpSv1KcQVQKt1+J31OC8CyLJxCom4Um+Z4ARuo3wYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHHC4jhvIy6Y9whlTxyWjCSp6TQ9f9eO1zm1Hl0A3OI=;
 b=JzIYEUKhCGwaCSUPpoot1PmupqUxOMHl7DIc4aYWrapQJG2xowVTtiAOw01hzxbZfI5s4mHCI7h7QHi2jlcwB3JnyGb/MsyIShZHbqXtBcYlWPiI62too5JE8M68aFxsPTeebPw6e8u0nHaYh+JdntP89Y5a/D1feS2VyQ6FTlJEBcaR3GxKzcWIV6qKNxnIIK5mLVr8uhK0KxvKB/w3IyB7CCfduMp1tQj8KUbFpWjsrzzsLvVGyLD/tvfMQa76bce4CN7JzV+Pc4ckChF1dIf5YKjJkQTY6YcNryPyCUZUk2VTCZ/fHBGDHyWAKTSCrj1LKYF/UrJhBp2FH+p8vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHHC4jhvIy6Y9whlTxyWjCSp6TQ9f9eO1zm1Hl0A3OI=;
 b=tDpECrjQNTg2UCYnO3PeV9s0To1CRL9MFZyGLke+u82trKUZUMetPr9I9aY5dt9ckxK0Zt1i1Xl9BKPsz24yKOnOev9Rdz9BBj14BWXy7VfF7dk0nL35TkczuHSxLwUSWbYWZ2/dNiXhFRizhzLHi9KOWRXrvDzDxm5jvmiiXxwge8yRsG2YDZkuadOpmRRR78c4/1gi0loV4qSuKvo9ISCnRMSno+wGBw4AZwO3aSI9T0t6ftt9VHKPTrnYoLCTRxtSHaCZqcjvtmN2D2GrPNLkpraKZ66E3K3fRUZUoLNmnZK7eEJ5mv0E41kFk8XP1DlV9WsBcNyJSDIpAuX+tw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v10 1/6] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Topic: [PATCH v10 1/6] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Index: AQHcnN0TIpWAusmvHEWrF5RBUFLqUw==
Date: Fri, 13 Feb 2026 11:37:04 +0000
Message-ID:
 <53251361b05028f4875d4fccec7270749786c54b.1770982468.git.oleksii_moisieiev@epam.com>
References: <cover.1770982468.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1770982468.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB9PR03MB7615:EE_
x-ms-office365-filtering-correlation-id: f9287d71-ecb5-4f7b-f0f5-08de6af4360b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzZuSzdqQUdHMk5NNDlLU2NNYjZpVEV2SlF5ckExdlJEczF3RGI0WVM5Wko4?=
 =?utf-8?B?YVdJMzJrL2lBSkhnVWJsY0tCZU1RamEwM3pOYlBsekhiYkhiOG9aaStPUkRV?=
 =?utf-8?B?TkNnWjZIYXg1b2hYeG1UMkxyekt6UTNwaXYrVFhtaFQxeUx6SFJjcCtHdWJ1?=
 =?utf-8?B?YkNUbGdrL0NqaUFJWXNsSllYbVlIcmJtbUpwWEVoTHRSUnZESjZQZ3pmVWt1?=
 =?utf-8?B?bzEvaHcvdDFBM0lXeGVIc1FHQjVpcWErQmJ2Q1dwTmhucUVoS0tlZUJhMS9Z?=
 =?utf-8?B?ZU1SUk15cjNFWWtxb0diOVpsZVNsOFQ0bWovekFZQ28rUndZbHNFYzZ2L1hB?=
 =?utf-8?B?R3cvSnEzODdudFZoaUk4NEVXZzBISldxS1h1Y1hnZkpjandDYjRycHpOL081?=
 =?utf-8?B?bVZzbUZ1T1psZExYdHh4ZmhuK0NTWjREQjVsbU5BNVljdmpuM1Q2K1RHeW9T?=
 =?utf-8?B?cDNvNUZXU01zemNxYzJISFdsMHRmWXVkTHRHUTlCRG5ReC9LMDI5aExpSHB1?=
 =?utf-8?B?VVBZR3NYY08xVytnNlRUQ05sQy9oMGYzeUlTR1ZxOEN3eHRmSUxDVnBuWnUz?=
 =?utf-8?B?SnpSTmwvR1FnbDNNTlFPVUtxdzZ5K2tyc3c2SXdIV0NjSmkybUN5eEZhVXNp?=
 =?utf-8?B?L0ZZL1pMTS9LVnRwS0NJelExMlU4T2xxYy9nK0lSWVl5L3VVV0tUUDVHTTNv?=
 =?utf-8?B?T3lqdURSZUdkQjRySDRkYUl6cElFdHRNSHpnUEloV2xWU1NXRGhJSTQ1RDdG?=
 =?utf-8?B?OGgzOG5TSjkvQlJzS2lna0xTbDVvQmxkd2xZSHZnZVd4Zit1RHJTQ2tHbXd0?=
 =?utf-8?B?OGhqdXZRWlF4V3llQ291VC9Od2lxUWJuUkovaURFa3RySW9KVzVqRnlNOUgz?=
 =?utf-8?B?WHU3STVuZzhIZE1JeE5PTlpPLytBSFZFYzliZ3lWL3JDOG1QMlVkWlVQTGtI?=
 =?utf-8?B?NURmVG1jY2lPV1BNWXVjVlFDaVVPZ1lJNUJTSnJETTUveE9rOEJRN0F0bEpE?=
 =?utf-8?B?d1pLd1VUdWRMR0lOcHFJZ2R4ekJtcXIvNUVuZGV5SFBZRlNkWWpKT3dRQkZx?=
 =?utf-8?B?MlNkaDEzR0F5ZjRvVFQwbFY2aHB4RzM1YUV3b1Zrdy9WWXJLSHBZanBCbnI3?=
 =?utf-8?B?b0ZWNTJoakxibHg5UW5OazBtYm56cDd4TzVMQlJqbWVEaUFDd1J3a3N0cUxp?=
 =?utf-8?B?bFVWcmFFMTROTDB3WTdhTStvdHpMYS9Lejl1RVN6a0dUVFdIelB1ZE5QRlRH?=
 =?utf-8?B?Y045TmRZS1dWck1QTTZQd3MydnpEOEFjWGJzdUpCemhxZGJaVlMvdFpTdVZh?=
 =?utf-8?B?eTJQSlVMVTlXR0pBYXFuZ3FoTHZYUG54dzNPcTV3dmtSQXJMRnhHMTd5YWh3?=
 =?utf-8?B?ZGk3L1Y5ckxlaHBiZ05RZXBBRVJSNFhtVG5IMnByb0Nsck12Nm1uR3lUZDNX?=
 =?utf-8?B?dDE2Sms3aFAxN0hRWGRPNG0zUm9DbmZRQm9sMTVyR0JkeHJyMExidllsbzhz?=
 =?utf-8?B?VWdESGVYcXphTFlOOGJHMEdCczNVaG13ZXdJS05jVzNnSldwRWIrY1RSRTE5?=
 =?utf-8?B?N3FBc05QNzcyUWxtcnBmajJVTWgwUHVEMkthSG9jeDFudTNQRmhOVExFajl2?=
 =?utf-8?B?dHQwa0pWOG1SaXo5dURmRVdRbUhsVU4xV29Wc0NBZ1VKZWt5WG5oVGpSVjJT?=
 =?utf-8?B?ZWU5bEpScVNwUk01WEZWazJpNlNYK2RaZU1XaG1iYUl5TlVSL3A1OG5jMVVr?=
 =?utf-8?B?V1NUN0hVK3VsUlhMeWYzZ1NnRzVBWFFQbEM0dHdaWlZSYkdWSlkrTVRCVE95?=
 =?utf-8?B?MzA1c1R0aEwwY1RRSXNhR3FhQklacU01ZUw4NDIvNEl0cUpkdVAyNmExOERV?=
 =?utf-8?B?U3ZvbVNJUUIxOU9DUy9BU0lRbjlqcU1IMWhRQjU2djNnc1hKNk9aakZaQnhI?=
 =?utf-8?B?NkNrcU5XQUxxRmV6anBYTmRuckdjM3c1OTl6ZFpCUXF0am1Pbm5ERWUwRVBH?=
 =?utf-8?B?bWVYQjJ1UG5xTGY2U3FaSnNVREtRa3hEZFN3amhWWDNsUWtYeDhZWG5JdTZ6?=
 =?utf-8?B?Nmp4TXd3QlRsME9UbmxLNGczYVQreW9ucTc2bzkxYWUzUzdFbnQ3UmRmSWJu?=
 =?utf-8?B?SzhaM0ZrV1U4Ylg0bzRMMGlsWGU2K3ZXeTdWc05oR1pHb09uekVYVERzcmZk?=
 =?utf-8?Q?LMuAw2jhlB6Nx5fs6gqii/E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjBHVlU0ZzE1dFFBSURlNlVoVGd1a09pMkVjZ1pDdFVRcGwwZWE5bVU2Q3FV?=
 =?utf-8?B?YjA3TnU1bGtHRWRUa1pNMi96RFB4d3BFMkFKeG1qOWo4R00xQy9mY25zMnVI?=
 =?utf-8?B?SUJ4SHVSYlBlK1VPdFR2S1dML2dRQnZwelduajFCcVUzNE15Y0hMVWk3REFR?=
 =?utf-8?B?OXRucnE1OE5BN1hrdU1Ba3plNEQrZXB0aER4cmZFc0xSQnRyT2QzdkN1dnNz?=
 =?utf-8?B?d3REbE1yOGRkMmM1eGxRdkJyTW9KQnVaVE5uejJ5TWhRTGhuaEpETWhIRmIz?=
 =?utf-8?B?Rlg1RURHMkx3SWxmd3FjZFdPUTFFNStwQzN0Y2haYlNNRnVJVmQ3eW5KbWk5?=
 =?utf-8?B?TG5Hc0dRT2g4SVJOSURKdEpTQ3k4WjVxL1grd1UrR0RjOFBhaDBBNE9CWGdy?=
 =?utf-8?B?VmQzMjZvck8yb2t6SWpiN1VQRis5L1R1cW92c2tpYUdHL3BxZVp1a3M1OFJX?=
 =?utf-8?B?M1VuKzlEcmt5NzM4c3VzaEhUWGI0VTI1U0FuQWNKdVZ2eVp0UzlPSFJYVi9W?=
 =?utf-8?B?T1hISzJQWWo0VFY1eFoyakpscGRhejFOcDNJL3VNNC9LUDFqeEFEc2M3c0NZ?=
 =?utf-8?B?N3ZnODZoTC9MTmswd3I1Yjd1OWJJKzZ2WHVSVGhwSmlES1dwTUZXcEpIZGN6?=
 =?utf-8?B?RFZNd3JFTkZuTEJYOGxDZVpicW1BeW14NFBLT0VZNTVnNjJKSERPbjdmenVp?=
 =?utf-8?B?bHcrZzZxTmt4ZjNWemtnY2t2aytTdDN4K1p2SVQxUkE3NGRwU0U4ZHJ1UTk3?=
 =?utf-8?B?Q1JIUEJwaWt3eTk3YlEwVk40V3o1ckRGMlBPU2YzdldsQVJvcFhJQWZpalRn?=
 =?utf-8?B?NUEyV3NMckRKZG1yTEd0ZFVYQ2g4NDZQWWMweUJxb3hJSzRkQ2lRK1RYS2RH?=
 =?utf-8?B?eWEvcGVXZDRvc2FLcFVlSzNJVTJmbmFNVzlSTjkzNFFHbEt1UmdSc0JQQ2pk?=
 =?utf-8?B?WTFnN2hiRWRsVVhrZEwvTk1pNTI4ODJFaHRWemNmQU8wbkVzcERPbTQvZTIx?=
 =?utf-8?B?YWxYZGRSd3Iydm9XcVE0NDhrRzlKNHhDR3ZiencwL2lVcllVRWo2NUNHamx5?=
 =?utf-8?B?djE4MTZkMG9qNXZlakVkZXYvb1NldjJyTDJsNzdpT042OVZDcWo4MklhUHhp?=
 =?utf-8?B?eGwrcTVCNXErdHV3WGFPNEQ5ZE01eTFNcFdlRTlOQTM5UnhwTUxaTVV4c2Y4?=
 =?utf-8?B?RjA1VWtIbytvaVNvSWhaRnJCNUhkcStzZWZyK0pLQlF2N0pmaTFUdlBXWHJz?=
 =?utf-8?B?bHVjeENGUnZVVHlCUldva2VCQWsyTTB3REZVYk91UHBnaERUdDRrOGxacmxq?=
 =?utf-8?B?YS9jQjFhME4xOEsvMGxPZHZTeVBLRG9kc0JnR0JEdVFkK013bTJPOENTc1I0?=
 =?utf-8?B?clRSdkRTOEEwTksxVDRwME9Nc1RYSjYzUVJHOVliUzlWT0lHdkJIemRWM3FZ?=
 =?utf-8?B?aDJFOXBJTDAvTHc3Yy9tQjNVbXhidFBadmM1bVczNFZ6YVpoSUE0MzdnL1M2?=
 =?utf-8?B?SXJuVHgvNFJ6SUFVTGNseWtURlhycldCUGF4ak1ONXZxSlZ3b2M5VFpwR05n?=
 =?utf-8?B?dVkza0lpbUt3ZlJhU0dPaXlHaEJKR1BiUzJXMjg4cVIyR2FQR3NTTVhqSy9i?=
 =?utf-8?B?MWI5V1F6Rmd0L3dlQ3FaYTVGaVltZlFvdWN6bTNqdkMxVkVCbmVZRHZFSEFK?=
 =?utf-8?B?R1dEMUVaempFUjJmZ3JTYnQwbmx4QlVrSWFsdGlVRXM1eEliakpLVmVTSWZ3?=
 =?utf-8?B?ODNLMzRpaCtIREwzanMzS2NSM3lidEJ6RnVOU3MxOTZrK0Y1cWdLSkRYTndG?=
 =?utf-8?B?cVl1bk1KTTBTWUVQa1hGR0cyUWYyUWhVZk1DQTljZzllREJmS3NBRlE3RmdV?=
 =?utf-8?B?cEIxelRiN3FoMDhDV0hyTmZiWkVhNm9VejdLTndORkNhTWRIelBrM2NSZVVJ?=
 =?utf-8?B?UE1YdUZGdkRqYjFNMExEbkxQbnpvQ2wvUmpGekJmam5XVjlwejVEVHJMNVls?=
 =?utf-8?B?TEM3UGJ6SWEzSXY4Wk02WitnZGV0VDVnL2s4MnhzWDB1V2UrdFRZUXpkc1k0?=
 =?utf-8?B?VUJtVmZPckdXbXhaZnJaU2VmTkEzanJSK2NmRCsveU9hRmFwQk9lZnJmZFNO?=
 =?utf-8?B?dzlsRUc3dVRtdUcvdks1SVhYdlVjVWRPN2tNcjhjWGlhMStkMjlXWks3QUhP?=
 =?utf-8?B?VThtdGZyVERLNjNNSndvQXc0bldDbTRMa0c2L01BSDRhRTB1Z2lhY0pvbC93?=
 =?utf-8?B?dUpjOU5KZ3lVUXF4WG1JcThHVnpaNEtWdUlGWnRrRjdPejhyRW5OenVMN1lE?=
 =?utf-8?B?b2FBRnc0Nm96UnlZNmpTNUhyOFpYZWF2RGZRK0dKUGJIRms5NTRZbjQ5b2g0?=
 =?utf-8?Q?agqoOl7bYoiKrBBw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9BBD3384404AA43AE1FD3AB161F0FA7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9287d71-ecb5-4f7b-f0f5-08de6af4360b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 11:37:04.3351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8r7uuW8qp30Of2Fv9GluYbFasGv0J06NTG35LZ2lfJZ836JWCBHmdj4hwTEE6UsETj9WvEX1Hd1Td6U9oJpQuneoFho9pU7gkF9+XdOIEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7615
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.08 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 96700135C3C
X-Rspamd-Action: no action

RnJvbTogR3J5Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPg0KDQpB
ZGQgY2hhaW5lZCBoYW5kbGluZyBvZiBhc3NpZ25lZCBEVCBkZXZpY2VzIHRvIHN1cHBvcnQgYWNj
ZXNzLWNvbnRyb2xsZXINCmZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBTQ0kgZnJhbWV3b3JrLCBzbyBh
IERUIGRldmljZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUNCnBhc3NlZCB0byBmaXJtd2FyZSBmb3Ig
cHJvY2Vzc2luZyBhbmQgZW5hYmxpbmcgVk0gYWNjZXNzIHRvIHRoZSByZXF1ZXN0ZWQNCmRldmlj
ZSAoZm9yIGV4YW1wbGUsIGRldmljZSBwb3dlciBtYW5hZ2VtZW50IHRocm91Z2ggU0NNSSkuDQoN
ClRoZSBTQ0kgYWNjZXNzLWNvbnRyb2xsZXIgRFQgZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2FsbGVk
IGJlZm9yZSB0aGUgSU9NTVUNCnBhdGguIEl0IHJ1bnMgZm9yIGFueSBEVC1kZXNjcmliZWQgZGV2
aWNlIChwcm90ZWN0ZWQgb3Igbm90LCBhbmQgZXZlbiB3aGVuDQp0aGUgSU9NTVUgaXMgZGlzYWJs
ZWQpLiBUaGUgSU9NTVUgcGF0aCByZW1haW5zIHVuY2hhbmdlZCBmb3IgUENJIGRldmljZXM7DQpv
bmx5IHRoZSBEVCBwYXRoIGlzIHJlbGF4ZWQgdG8gcGVybWl0IG5vbi1JT01NVSBkZXZpY2VzLg0K
DQpUaGlzIGxldHMgeGwuY2ZnOiJkdGRldiIgbGlzdCBib3RoIElPTU1VLXByb3RlY3RlZCBhbmQg
bm9uLXByb3RlY3RlZCBEVA0KZGV2aWNlczoNCg0KZHRkZXYgPSBbDQogICAgIi9zb2MvdmlkZW9A
ZTZlZjAwMDAiLCA8LSBJT01NVSBwcm90ZWN0ZWQgZGV2aWNlDQogICAgIi9zb2MvaTJjQGU2NTA4
MDAwIiwgPC0gbm90IElPTU1VIHByb3RlY3RlZCBkZXZpY2UNCl0NCg0KVGhlIGNoYW5nZSBpcyBk
b25lIGluIHR3byBwYXJ0czoNCjEpIGNhbGwgc2NpX2RvX2RvbWN0bCgpIGluIGRvX2RvbWN0bCgp
IGJlZm9yZSBJT01NVSBwcm9jZXNzaW5nLiBJZg0Kc2NpX2RvX2RvbWN0bCgpIHJlcG9ydHMgYW4g
ZXJyb3Igb3RoZXIgdGhhbiAtRU5YSU8sIHRyZWF0IGl0IGFzDQphdXRob3JpdGF0aXZlIGFuZCBz
a2lwIHRoZSBJT01NVSBwYXRoLiBBIHJldHVybiBvZiAtRU5YSU8gaW5kaWNhdGVzDQp0aGF0IFND
SSBkaWQgbm90IGhhbmRsZSB0aGUgcmVxdWVzdCBhbmQgaXMgaWdub3JlZCwgYWxsb3dpbmcgdGhl
DQpleGlzdGluZyBJT01NVSBoYW5kbGluZyB0byBydW4gdW5jaGFuZ2VkOw0KMikgdXBkYXRlIGlv
bW11X2RvX2R0X2RvbWN0bCgpIHRvIGNoZWNrIGZvciBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKCkg
YW5kDQpub3QgZmFpbCBpZiBEVCBkZXZpY2UgaXMgbm90IHByb3RlY3RlZCBieSBJT01NVS4gaW9t
bXVfZG9fcGNpX2RvbWN0bA0KZG9lc24ndCBuZWVkIHRvIGJlIHVwZGF0ZWQgYmVjYXVzZSBpb21t
dV9kb19kb21jdGwgZmlyc3QgdHJpZXMNCmlvbW11X2RvX3BjaV9kb21jdGwgKHdoZW4gQ09ORklH
X0hBU19QQ0kpIGFuZCBmYWxscyBiYWNrIHRvDQppb21tdV9kb19kdF9kb21jdGwgb25seSBpZiBQ
Q0kgcmV0dXJucyAtRU5PREVWLg0KDQpUaGUgbmV3IGR0X2RldmljZV9pc19wcm90ZWN0ZWQoKSBi
eXBhc3MgaW4gaW9tbXVfZG9fZHRfZG9tY3RsIG9ubHkNCmFwcGxpZXMgdG8gRFQtZGVzY3JpYmVk
IGRldmljZXM7IFNDSSBwYXJhbWV0ZXJzIGFyZSBjYXJyaWVkIHZpYSBEVA0Kbm9kZXMuIFBDSSBk
ZXZpY2VzIGhhbmRsZWQgYnkgaW9tbXVfZG9fcGNpX2RvbWN0bCBkbyBub3QgY2FycnkgRFQvU0NJ
DQptZXRhZGF0YSBpbiB0aGlzIHBhdGgsIHNvIHRoZXJlIGlzIG5vIG5vdGlvbiBvZiDigJxTQ0kg
cGFyYW1ldGVycyBvbiBhDQpub24tSU9NTVUtcHJvdGVjdGVkIFBDSSBkZXZpY2XigJ0gZm9yIGl0
IHRvIGludGVycHJldCBvciB0byBza2lwLiBUaGUgUENJDQpwYXRoIHNob3VsZCBjb250aW51ZSB0
byByZXBvcnQgZXJyb3JzIGlmIGFzc2lnbm1lbnQgY2Fubm90IGJlIHBlcmZvcm1lZA0KYnkgdGhl
IElPTU1VIGxheWVyLiBTbyB3ZSBzaG91bGQgbGVhdmUgaW9tbXVfZG9fcGNpX2RvbWN0bCB1bmNo
YW5nZWQ7IHRoZQ0KU0NJL0RULXNwZWNpZmljIHJlbGF4YXRpb25zIGJlbG9uZyBvbmx5IGluIHRo
ZSBEVCBwYXRoLiBBbHNvIFNDSSBoYW5kbGluZw0Kb25seSBleGlzdHMgd2hlbiBEVCBpcyBwcmVz
ZW50Lg0KDQpTaWduZWQtb2ZmLWJ5OiBHcnlnb3JpaSBTdHJhc2hrbyA8Z3J5Z29yaWlfc3RyYXNo
a29AZXBhbS5jb20+DQpTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xla3NpaV9t
b2lzaWVpZXZAZXBhbS5jb20+DQotLS0NCg0KQ2hhbmdlcyBpbiB2MTA6DQotIHJlbW92ZSB1bnVz
ZWQgc2NpX2RvX2RvbWN0bCBzdHViIGZyb20gc2NpLmgNCg0KQ2hhbmdlcyBpbiB2OToNCi0gdHJl
YXQgU0NJIGFzIGEgZ2F0ZSBmb3IgWEVOX0RPTUNUTF8qYXNzaWduX2RldmljZTogYWJvcnQgYmVm
b3JlDQpJT01NVSBpZiBzY2lfZG9fZG9tY3RsKCkgcmV0dXJucyBhbiBlcnJvciBvdGhlciB0aGFu
IC1FTlhJTywgaW5zdGVhZA0Kb2YgdHJ5aW5nIHRvIHByb3BhZ2F0ZSBTQ0kgZXJyb3JzIGFmdGVy
IGEgc3VjY2Vzc2Z1bCBJT01NVQ0Kb3BlcmF0aW9uLiBUaGlzIGF2b2lkcyBwYXJ0aWFsIHN1Y2Nl
c3MgYW5kIHRoZSBuZWVkIGZvciBJT01NVSByb2xsYmFjay4NCi0gcmVtb3ZlIGVhcmx5IHJldHVy
biBmcm9tIGRvX2RvbWN0bCgpIGluIHRoZSBhc3NpZ25fZGV2aWNlDQpwYXRoIHRvIGtlZXAgUkNV
IGhhbmRsaW5nIGludGFjdC4NCi0gY2hhbmdlIElTX0VOQUJMRUQoKikgdG8gI2lmZGVmIGluIHNj
aV9kb19kb21jdGwgcXVhcmQNCg0KQ2hhbmdlcyBpbiB2ODoNCi0gY2hlY2sgZm9yIENPTkZJR19B
Uk1fU0NJIHRvIGJlIGViYWJsZWQgaW5zdGVhZCBvZiBDT01GSUdfQVJNIGJlZm9yZQ0KY2FsbGlu
ZyBzY2lfZG9fZG9tY3RsDQotIHJld29yayBzY2lfZG9fZG9tY3RsIGNhbGwgdG8gYXZvaWQgZXh0
cmEgY2hlY2tzLCBpbXByb3ZlZCBlcnJvcg0KaGFuZGxpbmcuDQotIGRvIG5vdCBwcm9wYWdhdGUg
cmV0MSBpZiBzY2lfZG9fZG9tY3RsIHJldHVybmVkIHBvc2l0aXZlIHJldA0KLSB1cGRhdGVkIGNv
bW1lbnQgaW4gZG9tY3RsLmMgY29kZQ0KDQpDaGFuZ2VzIGluIHY3Og0KLSB1cGRhdGUgZG9tY3Rs
IHRvIGJ1aWxkIG9uIGJvdGggQXJtIGFuZCB4ODYgcGxhdGZvcm1zDQotIG1vdmUgcmV0MSBkZWNs
YXJhdGlvbiB0byB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiBhcyByZXF1aXJlZCBieSBjb2RlDQpz
dHlsZQ0KDQpDaGFuZ2VzIGluIHY2Og0KLSBjaGFuZ2UgaW9tbXVfZG9fZG9tY3RsIGFuZCBzY2lf
ZG9fZG9tY3RsIGNvbW1hbmQgb3JkZXIgYW5kDQpjYWxsIHNjaV9kb19kb21jdGwgZmlyc3Qgd2hp
Y2ggd2lsbCBwcm9kdWNlIGNsZWFuZXIgY29kZSBwYXRoLg0KQWxzbyBkcm9wcGVkIGNoYW5naW5n
IHJldHVybiBjb2RlIHdoZW4gaW9tbXUgd2FzIGRpc2FibGVkIGluDQppb21tdV9kb19kb21jdGwu
DQoNCkNoYW5nZXMgaW4gdjU6DQotIHJldHVybiAtRUlOVkFMIGlmIG1lZGlhdG9yIHdpdGhvdXQg
YXNzaWduX2R0X2RldmljZSB3YXMgcHJvdmlkZWQNCi0gaW52ZXJ0IHJldHVybiBjb2RlIGNoZWNr
IGZvciBpb21tdV9kb19kb21jdGwgaW4NClhFTl9ET01DVExfYXNzaWduX2RldmljZSBkb21jdGwg
cHJvY2Vzc2luZyB0byBtYWtlIGNsZWFuZXIgY29kZQ0KLSBjaGFuZ2UgLUVOT1RTVVBQIGVycm9y
IGNvZGUgdG8gLUVOWElPIGluIHNjaV9kb19kb21jdGwNCi0gaGFuZGxlIC1FTlhJTyByZXR1cm4g
Y29tZGUgb2YgaW9tbXVfZG9fZG9tY3RsDQotIGxlYXZlICFkdF9kZXZpY2VfaXNfcHJvdGVjdGVk
IGNoZWNrIGluIGlvbW11X2RvX2R0X2RvbWN0bCB0byBtYWtlDQpjb2RlIHdvcmsgdGhlIHNhbWUg
d2F5IGl0J3MgZG9uZSBpbiAiaGFuZGxlX2RldmljZSIgY2FsbCB3aGlsZQ0KY3JlYXRpbmcgaHdk
b20oZG9tMCkgYW5kICJoYW5kbGVfcGFzc3Rocm91Z2hfcHJvcCIgY2FsbCBmb3IgZG9tMGxlc3MN
CmNyZWF0aW9uDQotIGRyb3AgcmV0dXJuIGNoZWNrIGZyb20gc2NpX2Fzc2lnbl9kdF9kZXZpY2Ug
Y2FsbCBhcyBub3QgbmVlZGVkDQotIGRvIG5vdCByZXR1cm4gRUlOVkFMIHdoZW4gYWRkaWduX2R0
X2RldmljZSBpcyBub3Qgc2V0LiBUaGF0IGlzDQpiZWNhdXNlIHRoaXMgY2FsbGJhY2sgaXMgb3B0
aW9uYWwgYW5kIG5vdCBpbXBsZW1lbnRlZCBpbiBzaW5nbGUtYWdlbnQgZHJpdmVyDQoNCiB4ZW4v
YXJjaC9hcm0vZmlybXdhcmUvc2NpLmMgICAgICAgICAgICAgfCAzNiArKysrKysrKysrKysrKysr
KysrKysrKysrDQogeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Zpcm13YXJlL3NjaS5oIHwgIDgg
KysrKysrDQogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgIHwgMTUgKysr
KysrKysrKysNCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jICAgfCAgNiAr
KysrKw0KIDQgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5j
DQppbmRleCBhYTkzY2RhN2YwLi5hNmM2NDdhMDlkIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJt
L2Zpcm13YXJlL3NjaS5jDQorKysgYi94ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMNCkBAIC0x
MjYsNiArMTI2LDQyIEBAIGludCBzY2lfYXNzaWduX2R0X2RldmljZShzdHJ1Y3QgZG9tYWluICpk
LCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldikNCiAgICAgcmV0dXJuIDA7DQogfQ0KIA0KK2lu
dCBzY2lfZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4g
KmQsDQorICAgICAgICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3Rs
X3QpIHVfZG9tY3RsKQ0KK3sNCisgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXY7DQorICAg
IGludCByZXQgPSAwOw0KKw0KKyAgICBzd2l0Y2ggKCBkb21jdGwtPmNtZCApDQorICAgIHsNCisg
ICAgY2FzZSBYRU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2U6DQorICAgICAgICByZXQgPSAtRU5YSU87
DQorICAgICAgICBpZiAoIGRvbWN0bC0+dS5hc3NpZ25fZGV2aWNlLmRldiAhPSBYRU5fRE9NQ1RM
X0RFVl9EVCApDQorICAgICAgICAgICAgYnJlYWs7DQorDQorICAgICAgICBpZiAoICFjdXJfbWVk
aWF0b3IgKQ0KKyAgICAgICAgICAgIGJyZWFrOw0KKw0KKyAgICAgICAgaWYgKCAhY3VyX21lZGlh
dG9yLT5hc3NpZ25fZHRfZGV2aWNlICkNCisgICAgICAgICAgICBicmVhazsNCisNCisgICAgICAg
IHJldCA9IGR0X2ZpbmRfbm9kZV9ieV9ncGF0aChkb21jdGwtPnUuYXNzaWduX2RldmljZS51LmR0
LnBhdGgsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG9tY3RsLT51LmFz
c2lnbl9kZXZpY2UudS5kdC5zaXplLCAmZGV2KTsNCisgICAgICAgIGlmICggcmV0ICkNCisgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KKw0KKyAgICAgICAgcmV0ID0gc2NpX2Fzc2lnbl9kdF9kZXZp
Y2UoZCwgZGV2KTsNCisNCisgICAgICAgIGJyZWFrOw0KKw0KKyAgICBkZWZhdWx0Og0KKyAgICAg
ICAgLyogZG8gbm90IGZhaWwgaGVyZSBhcyBjYWxsIGlzIGNoYWluZWQgd2l0aCBpb21tdSBoYW5k
bGluZyAqLw0KKyAgICAgICAgYnJlYWs7DQorICAgIH0NCisNCisgICAgcmV0dXJuIHJldDsNCit9
DQorDQogc3RhdGljIGludCBfX2luaXQgc2NpX2luaXQodm9pZCkNCiB7DQogICAgIHN0cnVjdCBk
dF9kZXZpY2Vfbm9kZSAqbnA7DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2Zpcm13YXJlL3NjaS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Zpcm13YXJlL3NjaS5o
DQppbmRleCAzNTAwMjE2YmMyLi41ZWU1YTE2Njc0IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2Zpcm13YXJlL3NjaS5oDQorKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vZmlybXdhcmUvc2NpLmgNCkBAIC0xNDYsNiArMTQ2LDE0IEBAIGludCBzY2lfZHRfZmluYWxp
emUoc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KTsNCiAgKiBjb250cm9sIiBmdW5jdGlvbmFs
aXR5Lg0KICAqLw0KIGludCBzY2lfYXNzaWduX2R0X2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBz
dHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldik7DQorDQorLyoNCisgKiBTQ0kgZG9tY3RsIGhhbmRs
ZXINCisgKg0KKyAqIE9ubHkgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIGlzIGhhbmRsZWQgZm9y
IG5vdy4NCisgKi8NCitpbnQgc2NpX2RvX2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3Rs
LCBzdHJ1Y3QgZG9tYWluICpkLA0KKyAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVf
UEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCk7DQogI2Vsc2UNCiANCiBzdGF0aWMgaW5saW5l
IGJvb2wgc2NpX2RvbWFpbl9pc19lbmFibGVkKHN0cnVjdCBkb21haW4gKmQpDQpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hlbi9jb21tb24vZG9tY3RsLmMNCmluZGV4IDI5YTc3
MjZkMzIuLmIzZDEzODExODIgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jDQorKysg
Yi94ZW4vY29tbW9uL2RvbWN0bC5jDQpAQCAtMjksNiArMjksOSBAQA0KICNpbmNsdWRlIDx4ZW4v
eHZtYWxsb2MuaD4NCiANCiAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4NCisjaWZkZWYgQ09ORklH
X0FSTQ0KKyNpbmNsdWRlIDxhc20vZmlybXdhcmUvc2NpLmg+DQorI2VuZGlmDQogI2luY2x1ZGUg
PGFzbS9pcnEuaD4NCiAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4NCiAjaW5jbHVkZSA8YXNtL3AybS5o
Pg0KQEAgLTgzMyw2ICs4MzYsMTggQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQ0KICAgICBjYXNlIFhFTl9ET01DVExfdGVzdF9h
c3NpZ25fZGV2aWNlOg0KICAgICBjYXNlIFhFTl9ET01DVExfZGVhc3NpZ25fZGV2aWNlOg0KICAg
ICBjYXNlIFhFTl9ET01DVExfZ2V0X2RldmljZV9ncm91cDoNCisgICAgICAgIC8qDQorICAgICAg
ICAgKiBDaGFpbiBTQ0kgRFQgaGFuZGxpbmcgYWhlYWQgb2YgdGhlIElPTU1VIHBhdGggc28gYW4g
U0NJIG1lZGlhdG9yDQorICAgICAgICAgKiBjYW4gYXV0aG9yaXNlIGFjY2Vzcy1jb250cm9sbGVk
IERUIGRldmljZXMuIFVuaGFuZGxlZCBjYXNlcyByZXBvcnQNCisgICAgICAgICAqIC1FTlhJTywg
d2hpY2ggaXMgaWdub3JlZC4gQW55IG90aGVyIFNDSSBlcnJvciBhYm9ydHMgYmVmb3JlIHRoZQ0K
KyAgICAgICAgICogSU9NTVUgcGF0aCBydW5zLg0KKyAgICAgICAgICovDQorI2lmZGVmIENPTkZJ
R19BUk1fU0NJDQorICAgICAgICByZXQgPSBzY2lfZG9fZG9tY3RsKG9wLCBkLCB1X2RvbWN0bCk7
DQorICAgICAgICBpZiAoIHJldCA8IDAgJiYgcmV0ICE9IC1FTlhJTyApDQorICAgICAgICAgICAg
YnJlYWs7DQorI2VuZGlmDQorDQogICAgICAgICByZXQgPSBpb21tdV9kb19kb21jdGwob3AsIGQs
IHVfZG9tY3RsKTsNCiAgICAgICAgIGJyZWFrOw0KIA0KZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZp
Y2VfdHJlZS5jDQppbmRleCBmNTg1MGEyNjA3Li4yOWE0NGRjNzczIDEwMDY0NA0KLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvZGV2aWNlX3RyZWUuYw0KQEAgLTM3OSw2ICszNzksMTIgQEAgaW50IGlvbW11X2Rv
X2R0X2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLA0K
ICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgfQ0KIA0KKyAgICAgICAgaWYgKCAhZHRfZGV2
aWNlX2lzX3Byb3RlY3RlZChkZXYpICkNCisgICAgICAgIHsNCisgICAgICAgICAgICByZXQgPSAw
Ow0KKyAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgfQ0KKw0KICAgICAgICAgcmV0ID0gaW9t
bXVfYXNzaWduX2R0X2RldmljZShkLCBkZXYpOw0KIA0KICAgICAgICAgaWYgKCByZXQgKQ0KLS0g
DQoyLjM0LjENCg==

