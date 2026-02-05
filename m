Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNQ8MOxOhGkE2gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:03:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A7FEFB25
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221555.1529748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuKk-0005L6-PA; Thu, 05 Feb 2026 08:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221555.1529748; Thu, 05 Feb 2026 08:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuKk-0005JX-Ll; Thu, 05 Feb 2026 08:03:26 +0000
Received: by outflank-mailman (input) for mailman id 1221555;
 Thu, 05 Feb 2026 08:03:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqXU=AJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnuKj-0005JR-3W
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:03:25 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21c3eaff-0269-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 09:03:19 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SA1PR03MB6418.namprd03.prod.outlook.com (2603:10b6:806:1c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 08:03:16 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%4]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 08:03:16 +0000
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
X-Inumbo-ID: 21c3eaff-0269-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjVdNoNjVC8bqlCil6V+NKIA6bgorbTNhtMDEqfghuH7HFvlkvmD9hiHUsP7DnlFZOL1ERTK78izdX2HeDhxtN8FCfUJ3xWqoXwG0YJHqgyG3sLajUrpL6J+0KtIKhjKBZzDUORWmr+LOle1S4EhDT8bEC0u4SRRPXDrL8LgBp4MD0c2vOqIDEEtLqHAdn6NVw5S7UDBfRTAOmILJxx7MvCmFShuLbpK+2ehy731U4VzUgV/xdXOLSVs4KzVN4OaKWgdJSjFvl0scjiK48l+/hZCvQg45Vnlu/pgBfDe8uOex3YXlF1uYN6K1Xeiunx9ftUcQC5xL1LHwB2QZzXuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu+dQd17RgtDvJogBKvj46VI6xNKQrXq46hIvVdkBCA=;
 b=TUru9tpd0ZJxkSzXMsTkPHQSwMth51y6yW4g5vMPCPc7J110mDbeylRPSOWRSt4sQB2f1hQOyfAY94tuhyr2Oil/9lRTvbZ3LD5423cRAd47TKmLEXC3HFJiXRQYPPBj4o1CIkgSO0dloaPQsXl1uG5BXbgLxLTfElD73cvlTnLi2cB34haMCG/v47HHzwQwyClR0zCMATYpl2s7Atw5LjLKp65e92hlYRDobL+wBXaHz+l95HP6WInABun2k9dgzfkPi1ETWdRz7lRWm2PLtsfRzyxSuS04J9qgB4I2PgXeggTBH/rRdJicTtJKyW7KSWmL26lJRSI3V3jp4Tp9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu+dQd17RgtDvJogBKvj46VI6xNKQrXq46hIvVdkBCA=;
 b=k5UGRPC02rmXmIvaJAylqOaNHSLV/UmrTDXPPfk6qrteaDiSL3zRXhAW/QzcV8UtxsUpU8ocB3Oapx0zt4IaKzb7/7e3SWV/ge7YsHiPhPlCkUh1ghUWxe/o/y58vNi63RCGIfHGA3dYgilJJgGWXJjU4KYVzW1xxz2FVVeBRsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] x86/domain: adjust limitation on shared_info allocation below 4G
Date: Thu,  5 Feb 2026 09:03:08 +0100
Message-ID: <20260205080308.91057-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0006.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::7)
 To BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SA1PR03MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c15765-5aaf-4f3f-b6a0-08de648d0453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHJaZ1FkL3NQMklvMTBTYU54REY3dDhYc1pmaXkrZ3lVY0xOdnAzQThES0c1?=
 =?utf-8?B?S0xlTUdIRGJTSW40dXFqcDNRWGJlSjZxMEtYRitva1loMmJGUHJzczFzai83?=
 =?utf-8?B?VnhQWnZsRmUxSUhVbzdQclZ2c05TZ2lMZGpCaHJNeE9qOEc4eGRETUhqTzgy?=
 =?utf-8?B?SmE0QlRXUUtJbHRCMm5LYnBjMDh5Q1V2UzE3UUhDYzB3Z0lndHUwckZxaUZw?=
 =?utf-8?B?TEV4SkoyMmZiMlNUeUlVdGpxeTRoUW1YNzVNSmx4eGQrUmE1aDJ4YWZ6cjI3?=
 =?utf-8?B?Y2tlQUFLT2R5N3BUS0FGZll0eHZCc2EvS3Y4VngvSmpuc2xNZFM0ZC9DTTZl?=
 =?utf-8?B?YWJlaFZpWlo3dm1kRzVNS2xubGZ6M1ljdTRUam9ZZzd0c3JRZHRNSTY5MjNX?=
 =?utf-8?B?VlVVaXhGcTlFYmZ5d1k1WE5DWDhNWlBhblhRcVIyUnpqUjVmckprWG9kR2Z6?=
 =?utf-8?B?N2NFMElVdjJRRTNTVFBMck84RHp3eE53Rk0zZm1pQXllSlEwOEFUam5HeWM2?=
 =?utf-8?B?aEdpYmJJY28zSXVNV0MxTHZSWmtpWWw4K0RzcGVTZmJNeWUrV0ppSTZmb0RH?=
 =?utf-8?B?WXk3MHl2Sk1BT0tKRVhpUVNSVHNHY05tZE5oZE1jUGQwNGVSY2pTYmF3UXU5?=
 =?utf-8?B?eHNSRG9DTEhuVXd5UkQ1YzdHY3JWQU1xN2pPdkI2NjNHSGtWaWVJS2ZYcVJS?=
 =?utf-8?B?RVNxOTc0d0xqMHppdUtUVlk5VVJyNG5BaEtuajI0L3MrWXFlbVQ3ZjFESG9W?=
 =?utf-8?B?bjJhQ3RkR0Zvd2ZKU1JwRFgzNm1McTNQaGQ0MnltU2NVckczU0pCUmdhU1Y1?=
 =?utf-8?B?R1gzbGJ4dFdhZjZmV3hWQWZncCs1bW5BRFNIblhPSGdlSm9yNjQyT2pLT0ZE?=
 =?utf-8?B?VlVaVFlHaWk1aVdGeDlaRkcvRXJIRzkwdDdFT2ExTnA0RXc3ZDhwK1o1V29o?=
 =?utf-8?B?NGJSOXV1KzlpTi9ibGlkOTJRU0lGN0tsb3ptOUVrL2FhVlNQdktmTWlDc1lO?=
 =?utf-8?B?VURLelZMNXgwNTNFTXlHRnh5Y0FIc2RNVEczM0hPVmNSWnZyZ2FuRTc2M1Zw?=
 =?utf-8?B?UTRqL0xiWlo2VUttQWtISEdqUTlrNUJaVkpvbG1aOThzeU9JcWNnY2dEWG1M?=
 =?utf-8?B?SjQ1SG80VEs4dzRER3FhbkJmY2k4Wjdzd0NTOUcrYWltMlZnMjJQQ2FjWnV5?=
 =?utf-8?B?c2tTSElGRStiOTNMaFhjRGd6S2RTdkVha0tCMlVxRVdmbWJMc1o2UE55eStD?=
 =?utf-8?B?eEl4M2tYNHNTS0JZWnhMR28vYTB1K2kzZVl5blRvN0V4YXNNeGNjSzZWTEsv?=
 =?utf-8?B?STBBK0xKM0ZsQVVFWGtmRGg4NU5vYmt3UnJmQ2RSNEJMa0xPNUZKME1lVjln?=
 =?utf-8?B?NXJQR1h3WXNKZ0JDdEhEYkdvUVJkQytQTmNmQUpqVFhxRmxKYTRyZmRDS0Zm?=
 =?utf-8?B?RUdCK3JWTk4xaXhNLzlnbUNuV0pZSFVESk53WHVkaU04YUE1Z0xPckRTNHF5?=
 =?utf-8?B?bEFVUlB4UE9qdGNIT2R1YXo3SlJnTHp2bkwyYW16T3A3S3pCcHVucTcrMWRx?=
 =?utf-8?B?N1ErTnNWbEpNemRTeW1iVGFaMGpNOHVtRy9PTmhtSWdjOVYxSXR6dHlSUG5S?=
 =?utf-8?B?OVhaUmhGZ3pnTVRDOUlFaGk3aXFuZVNCWkZjRUQzNVdlMXRCdnRtR01yZHBv?=
 =?utf-8?B?bEtYamxMbkxFT1VhUUNpT2lpazVndDRORFJBR09xQWxwSUVrSTIwYjc5U2p5?=
 =?utf-8?B?WHNpaTJEc2Fpcmk0ZXhtQ0ZBQzl5alkreUtydEpHdVp3L05rOTgxMExRenB0?=
 =?utf-8?B?UnlLQ1FKd1p5V1dPL0lPcU1sRjZJbXVCWmNlWklwWXpzeUpUUjg1NVduVWVw?=
 =?utf-8?B?NkhkbUdxeTY2OEU5MVA1eFRmZzhoM2RrZ3dqMTcwSDRTZ3JoeEFDU3lQUHA2?=
 =?utf-8?B?MVdPeElHNmVXQVU3NGJmb2FGWG9uN3ZiM2p4bERIZTREYWVoMm1Dby83Ky83?=
 =?utf-8?B?MWMybC9FeGdtb3d1cnp1Ly9vTHBLRkZuTDZRVGVJcDkxdFE0ZWd4TURkWDd5?=
 =?utf-8?B?djAvbEdmWHJDcXpNZndpZ3FTdU03QTdocDBVS0huYXhPa3R5R1pEbmFPaXpT?=
 =?utf-8?Q?21Q8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJWNjNFY0c2cDZOMjNuVUQ4Y0RLMVI2L29kWkZIblVRTGFBc1hTQzFTdzRs?=
 =?utf-8?B?ckJZaVlxWnAzLzR5MWpFc3ZpUEw5bVQvSDRqdXZFcXBNbU9pbUpQeW5GVmNL?=
 =?utf-8?B?c205alpkMlpZTHRmckdGb2hKWEJGY3FyczR5enBRajFJbi9tQk9PNzRNNVBW?=
 =?utf-8?B?T2RqTDYwVkgwTnZlOHBiWFZ3SGR5cFp1bWpJMFRPUUJzUDduYlh6QjFLVHA3?=
 =?utf-8?B?Ukd6aHM1TzB0Nk00QmlvU2M1a0sxcFhOY09rNkRqd3BhTElXWnFFZEtWa3Yy?=
 =?utf-8?B?dmlBeUFxVFpXZHUyZjA0VW5nYnd4SWV4NHVYOWpjNWhqeGZ4T3VXRmtkZXBD?=
 =?utf-8?B?bGVQaUZLWVNEOSt2Znd6cDdYSktBOW1sZVcyc1JOQXNPcWFiZk1PMUFOSjNk?=
 =?utf-8?B?VE51T1pyMC9WZTNnVyt4SmZQMmhjREphVzVsQ0xaVEYwbWl3bjMzRHNLQzBB?=
 =?utf-8?B?T25zRXByMVY2cktCem5hR3o3Z011ZDNSYUxySGluUjFzK0NCVm1ONk14TW45?=
 =?utf-8?B?S21abWRnTm4vZlpFS0gxeDJLNkZCOFZvQURCQUtUNHlhaVFKbEZkenJTRzRL?=
 =?utf-8?B?MWVnQVdha0FuR0Rlc0FiZDdQNXpkMWY5aTI4amRDU2tCMVdSYm1Najl5dFdQ?=
 =?utf-8?B?YXFRbU9DRnNNQ2dKTnY3MldhcnEzMU5EbVk3blJMTDIyRHFhZU9KVkhUQ3lD?=
 =?utf-8?B?TnVNVFlrVmtvK1hkckEzY2FVLzNjWXo4US9jOG05VGNUWFY3OE92MDVwYmFX?=
 =?utf-8?B?K0t5K0h5b0diN1BJdVRwN1JvYjlteWtiR3JrMjQ4bEkxZDlaK0JEYldXNzZy?=
 =?utf-8?B?cmhnNVI3dFA1U0ppeC9Ed0gvY0dZL280ZTU4RlpKeU9hMkJveEpJTzhiUlFr?=
 =?utf-8?B?S2dCT2xPY2w0Q1pvR2hSUTVDR1VHTFZLZUtiWkljTDI1NlVmdE12anNKYVFO?=
 =?utf-8?B?NlorL3Y4eUw5U0luU2FNMENBd1V5dEd2UWFWNDE0QzVXWG9oTGgyVThSblY1?=
 =?utf-8?B?STZZMk8xMnRtZGZKVHQxU3pDZldEeHdLbTZyOXFTUzI3d2lGQUxEQVVYUnVn?=
 =?utf-8?B?ckdqUTcraUYzQ01QUXo0Zi9jcUxCWHhlVVkzamtpVjUyZ0JZV3ROM05aNVps?=
 =?utf-8?B?RjBqTzJDNENjSG00ZHd6dzNOcFIxOHdZaHpxWnI1TXdKOERFTjhkWXdaaUJN?=
 =?utf-8?B?NVhYbVRqTUV4aG5KOVlwRzdaYmpudkphK1lLaXVqVHpXZDNJQnp1dlV2eUNT?=
 =?utf-8?B?WC95dkNLc0srenlXVnQ2T2VkZmNYYnVXNDBmaUMzRDc3aFYwK3plWE85TzBo?=
 =?utf-8?B?Rm9XR2VRU1lQSm5QWEZZd0VlYkFjTHdYNi9sSEh5TzJwUnpnNDhNVElFZUVs?=
 =?utf-8?B?dGtEM3VxUGx1SG1mVUF1eWIxbXdIQjJ1VXBpMXpnLzFPVEFxR0NKZlBVVmpG?=
 =?utf-8?B?WTdhNjlaRzVFQWU2SUovTVozZ0ZCMUhXRTNtcHBldE4wWlhGeEcrbGhTb3lx?=
 =?utf-8?B?NVRxYUVUT2xYT1BNZlZVcysrM3g5RTdveXdlc2pzUGNCVncrbkhGYTNUZHV1?=
 =?utf-8?B?d3FwUWZtRGwyZis3TzdmcTJyVjVja0lveXQycGs2NmpseG1KZy9OMjRtTmo0?=
 =?utf-8?B?R0tDUjZvTUlUUzJCNGk2bWxkNGRkRmRyQVkvZXlRWnF5aTJSK09GOGVHNmZj?=
 =?utf-8?B?NXM1TlNnb0hIQWM0QzRHMmxKNS9aVGZtQjBKeHJ1djh0UDdVbmp1Q3RRT0pk?=
 =?utf-8?B?QUliandxTEJiUEhOU0ExQm1Hb21VOVlmZmZwc01IT2JhNGxmNjU5NndCWmlW?=
 =?utf-8?B?VWdjT0JzVHZPWHlaWG45cVBpR0RHN0NCM3h0UnZYZUtDTW43NzB3b0s5YUNq?=
 =?utf-8?B?THZ6OVc4azZlZU1oQnZsMlpLSmZlRmlYZ0hrWkhKUloxUEpaNWhRb3pVWUdU?=
 =?utf-8?B?eWhXcmswbXRrbmlOUDFqcWVXTXRKeGFra2ZVajAxRFFraXJFMmVEYU5zZnRi?=
 =?utf-8?B?eS9aRzZRUTNYdURRRHdzVm1teGxyMWhEU2pGQzRFT09TZlJuZkhRNUZlUHZZ?=
 =?utf-8?B?TEs3L2I3NHVqdU5hQWxtOGZDWFZYUlJOUEhSUlFwT3N1VnpXaWVWTlFvL0wv?=
 =?utf-8?B?bW5yQk9wd3hXYU5aN3hjdWo2SnFRR2pDQy91enJlbXZrbEdJRUx6KzgxTDY4?=
 =?utf-8?B?anRaVS9wYnlqVGxTaWtSQ0ZuVWxYNkJrZU04dlc1ZkxkbDVxdzB1cklCVlho?=
 =?utf-8?B?NVphYkg3RW9jRUdjYVRFSFQ1ZFdXdnNuRFkxTHVBU05kcUdQR3FDNXVsRWlB?=
 =?utf-8?B?MWhxQXQ4bVh1OU83Nko2cTZsTDhwZFNsdSs4UmI3VGFYL2g4YlVjdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c15765-5aaf-4f3f-b6a0-08de648d0453
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:03:16.1544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXFUNWu6b1cabfcEBBbNSnMJ2P6mBpfR+WKs9nkj5NBWupyBqCmRaahX23wb4k4hEjRBTYarqqCrQQkUx0iWNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6418
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 27A7FEFB25
X-Rspamd-Action: no action

The limitation of shared_info being allocated below 4G to fit in the
start_info field only applies to 32bit PV guests.  On 64bit PV guests the
start_info field is 64bits wide.  HVM guests don't use start_info at all.

Drop the restriction in arch_domain_create() and instead free and
re-allocate the page from memory below 4G if needed in switch_compat(),
when the guest is set to run in 32bit PV mode.

Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Move/reword some comments.
 - Add spaces in for_each_vcpu call.
---
 xen/arch/x86/domain.c    |  6 +-----
 xen/arch/x86/pv/domain.c | 28 ++++++++++++++++++++++++++++
 xen/common/domain.c      |  2 +-
 xen/include/xen/domain.h |  2 ++
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index edb76366b596..8b2f33f1a06c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -881,11 +881,7 @@ int arch_domain_create(struct domain *d,
     if ( d->arch.ioport_caps == NULL )
         goto fail;
 
-    /*
-     * The shared_info machine address must fit in a 32-bit field within a
-     * 32-bit guest's start_info structure. Hence we specify MEMF_bits(32).
-     */
-    if ( (d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32))) == NULL )
+    if ( (d->shared_info = alloc_xenheap_page()) == NULL )
         goto fail;
 
     clear_page(d->shared_info);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 01499582d2d6..e3273b49269d 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -247,6 +247,34 @@ int switch_compat(struct domain *d)
     d->arch.has_32bit_shinfo = 1;
     d->arch.pv.is_32bit = true;
 
+    /*
+     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
+     * field within the guest's start_info structure.  We might need to free
+     * the current page and allocate a new one that fulfills this requirement.
+     */
+    if ( virt_to_maddr(d->shared_info) >> 32 )
+    {
+        shared_info_t *prev = d->shared_info;
+
+        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
+        if ( !d->shared_info )
+        {
+            d->shared_info = prev;
+            rc = -ENOMEM;
+            goto undo_and_fail;
+        }
+        put_page(virt_to_page(prev));
+        clear_page(d->shared_info);
+        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
+        /*
+         * Ensure all pointers to the old shared_info page are replaced.  vCPUs
+         * below XEN_LEGACY_MAX_VCPUS will stash a pointer to
+         * shared_info->vcpu_info[id].
+         */
+        for_each_vcpu ( d, v )
+            vcpu_info_reset(v);
+    }
+
     for_each_vcpu( d, v )
     {
         if ( (rc = setup_compat_arg_xlat(v)) ||
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 163f7fc96658..4f6977c67aa7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -305,7 +305,7 @@ static void vcpu_check_shutdown(struct vcpu *v)
     spin_unlock(&d->shutdown_lock);
 }
 
-static void vcpu_info_reset(struct vcpu *v)
+void vcpu_info_reset(struct vcpu *v)
 {
     struct domain *d = v->domain;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 273717c31b3f..52cdf012c491 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -83,6 +83,8 @@ void cf_check free_pirq_struct(void *ptr);
 int  arch_vcpu_create(struct vcpu *v);
 void arch_vcpu_destroy(struct vcpu *v);
 
+void vcpu_info_reset(struct vcpu *v);
+
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v));
-- 
2.51.0


