Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBa1FH283GliVwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:50:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55C3EA0B5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281000.1564071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCDvk-00015H-H9; Mon, 13 Apr 2026 09:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281000.1564071; Mon, 13 Apr 2026 09:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCDvk-00013D-EX; Mon, 13 Apr 2026 09:50:08 +0000
Received: by outflank-mailman (input) for mailman id 1281000;
 Mon, 13 Apr 2026 09:50:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCDvi-0000zE-Jt
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 09:50:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCDvh-00BtrV-Vt
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:50:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcbc4b-bab6-0a2a0a5309dd-0a2a4503806c-14
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:50:05 +0200
Received: from [52.101.66.19]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcbc4c-02b3-0a2a45030019-34654213dc1f-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:50:05 +0200
Received: from DU2PR04CA0299.eurprd04.prod.outlook.com (2603:10a6:10:28c::34)
 by DB3PR08MB8916.eurprd08.prod.outlook.com (2603:10a6:10:428::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 09:50:01 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::f7) by DU2PR04CA0299.outlook.office365.com
 (2603:10a6:10:28c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.47 via Frontend Transport; Mon,
 13 Apr 2026 09:50:01 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 09:50:01 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB7953.eurprd08.prod.outlook.com (2603:10a6:150:ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Mon, 13 Apr
 2026 09:48:49 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 09:48:49 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d/OSARfQxsy3w5M79bapGNmrKwiSX0CQVeFQjjVIJIWgvhMkLO8cO41qqtqw8F2KlQts/39lt4ztABCF9+Cxv9O/gixqslH5kjVLHIVhjxuadG6sJWjxfXwxDaoGlvslP9M6NbYXNZHQODFG8/9IG9HEZ7OodrytLR1nF/RFC2SEMUNCgi8h0Hip0ppXNmAQMDnfe4b6yIxd1fcUewh6oaLNbwh37beKsQSjRkEsmQUdmjUXY7VHnoRMjACbpzGwUPNxeLOtMwqGguVKYbjVrUYuEmuHR1jS4IaD1GTWkXgmlWEWcIBy+G666Sth0mfw69D+OdABBY4JIkJ2C8VRXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CWTLgNTmHxPBkyYZx5DYhNfQlDOAp+fLSlbsA60ZwM=;
 b=V7hu81z9WwR+C+VEIaon0NsRXBRjy7KKRk8qpZEJun/IOpKQzJmy6B08rGZklS0KVGOLMAHZgcQhOOvK/Cv6q7Y6i7sbggFTBphas+zfZ56rm/TQLW9+611voE3ENLyzy2KU1IVtb/of1u0fl7E77QeOXeAEwWb0k5+cLhoXJKdHiy7UWlSZadODf+Eok/lg9/xSUGf5S83B5rmMW68vUK/cu8SsjJVYYIjxWd84JluCP47eGSpcHD6XZ7IsYaVjfISQNa09SdrasDwF8Zfji47DOWX44btEorXwRQevnZ91DyRHXQ6KaGLT7EWJFRwsKvvfC7C9PAo8kdRa+y67nw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CWTLgNTmHxPBkyYZx5DYhNfQlDOAp+fLSlbsA60ZwM=;
 b=S5/g2k1cSG6B1oMTai6KvJ+lKpffExwiNDdn35K4n7FdS+N6jRs9tTwfWdSlTcagHIpinMGdm3yA3BLrbFWSi15ohS+Oi7XF5Cc1YadgVrhyr2mwD3IyY0byDBDDmjCpA/zUz6LZaA45y3rTnaLaPH1G2GGEvX7wTv/x6zHwzdg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDxuIHHSn7kVbPtIotvuYWm8LW7FgxlvUNIKi0OX9iCVYIiM4777cwYN+oP8aZ1DKp76g/hPZCOjHtKorJCqmqB47RJdl2aQHiFm6UW6uBZyReIjcLknWR4/Zkr3vuL8o5Zb8DhisgWlkV2cFyvHjzW12q6b9IMiHZZvH8co4cqc3WDuszDfC+ehXdy8kWAu7M70LzdKnd7V6hICMYKm9l7Oi5+Utx0huYXqWruESaXV3jrgkrW4U9i5al0H8bUlah7wZfJgQdRMZZ/ghqS5ltgpD3K5/YbUjfAvQcvHmPAsNBCE+AIPiA/0Iq/ON6YGHnaUW9PrtAxlDJB2oLFu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CWTLgNTmHxPBkyYZx5DYhNfQlDOAp+fLSlbsA60ZwM=;
 b=At5ZRwDxYURpfpBLUI91ypZmSJzFSyPKocrOHIGtAtBda7lGa2wvjVZ56ROLYQGIfJouppsLoDn0KfuHekte/KBvXOKcX4B7Emu3j7HFfzhVFk/2axbFoJpC7f/YXSicjMLHrfpNgafHuGrm599Xl2sAkHr7Yc7WkBCEAHKBIEuV0ftJAtOS9mBfdFqUSEH0i/uTlU8TtLZnnw9YFEyebF2KFrHGN4fXHdsjDZSrCQ2WzwlBvn15zmaDnZX5i6hvf6sCc8R34CqZMRhviQMdQOTSkWxyZtszKuhhahffsBGcuL/8/MGCm/d9R2a6Px49mcyO3n9prKy33mmgnIrsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CWTLgNTmHxPBkyYZx5DYhNfQlDOAp+fLSlbsA60ZwM=;
 b=S5/g2k1cSG6B1oMTai6KvJ+lKpffExwiNDdn35K4n7FdS+N6jRs9tTwfWdSlTcagHIpinMGdm3yA3BLrbFWSi15ohS+Oi7XF5Cc1YadgVrhyr2mwD3IyY0byDBDDmjCpA/zUz6LZaA45y3rTnaLaPH1G2GGEvX7wTv/x6zHwzdg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 10/23] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Topic: [PATCH v3 10/23] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Index: AQHcyyq6FXO6ijWppkGjD9BdYA/62A==
Date: Mon, 13 Apr 2026 09:48:49 +0000
Message-ID: <7A296EE6-042F-43B6-A6A8-9BC4408AE605@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <5342a5355191ae3b5b7bfcb86c6494334dda82e6.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <5342a5355191ae3b5b7bfcb86c6494334dda82e6.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB7953:EE_|DB1PEPF000509E8:EE_|DB3PR08MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 83633dbd-c22d-412d-7496-08de9942082f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 3RXi0L7fJFoNldNK5eXm+Pv1dW29rKmqxXnt0s9gVq5uhKcRwUgpvIB5VM38c+GWRE47rHJegv7bIUb7VqlshZCX1jQ7Hv/OMfz3vm2ka/DqPkZGbToT1UcoyOm86vooKuPRYUTIj4yDtIxjS+e7Ac4DPHvfQKe+KHr/0+ycXMQHIoJkP/rhK3muZ/waBaFEooRY0ayl66Oue8Ae8mgNq2Id0FEjuO+zxwBJ7vzAdqjqQ1rRnVa8Ng6G1nF2xyNR8uRZdR9wBmo0w6bLcEW7PWvK5egvbZaI2kL1sxRDjDymjS8bV+dO98e7AlfxSqv3OdzzVT/pyrNK7KIbFZdb3Q88Zl6rZbEifBa0yPXto9s0q6K493tOd91kONRUwEv8b99k3RUKYWqXlluhBWQWTqvTG3iJqIWySqwcFjbTXF0lX7Y/fOw9UBugrsqNCNEI9u6LIhUm3lPNhOffsmA25NFfUHRnlMgj6HeAdTjXb1ccQwH8X3vAxrLy/kHYoaCI02V1WdnqLIybv++Y+hCy6W8dUbtOjvF7demVQabbsfBdPMl+JfqtbIgr2+iZv6T+7DTDBZ0G8W3rzb2vIz+4PDnCalfVQ1suE3RtVNzUIfIEU1WVyjM+sVmU7h+g95HLzMdG/vlC9ZNc53wJmzA/xJVibZn/LWV8J9J5ftJCOwPtGPu3++Nv5OF4FA9DJRUt6EW5io4poSbtQeajUdX846qNGsHxWrNTZF51oV7G8Xe0nWEYCYne9YO6sD7XTNuK7FH/bMDMkV/2X7eyVIppbiSxDQ3US8vyq3nFoKniP8g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4BF5C6BA466BD842B70B9D9A5D7F0FB6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Dyud/Hk8u1grghSx1LJQHF23rmE9MXvoDXXWSZuq803nXsW1agbeLaFDZimMDtlfCYKaD+/+qbnN0eqWZeqYBgSwDQuqKoA+N2JgBykzO4wGFBwawBywvW2EqzXOHugvbJ+htJprgBIuxa5ZIX3C1enPRm33Lz3YUndAfDVFM6PIkO2SiKo+6lA7cVaVrvQ8S/qLDIN7+zPuhRkvNIOBrFvoRvXGpgMypI7fmBOwWTg2gHNBzE+gLIwLemdT10kPRCjWYT4bsbLa6KnikB8emvpd0cZ0KI/C/euf0bBKQ8s8UtxJMMvEFnLjSSpf/XPX0C2J/hkruX7NE5o1G89zPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7953
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5af6ece9-6c47-4aca-608f-08de9941dd4b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700016|14060799003|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UnIV3hhNCHQWDbXZmi6ahxehyK7m41TrVVZPIe0fCpQM/b/I9ZLDO+inS6cUTUBffxAXn2eE6PLwZyCFY/dd38dwI8o4/9xbfaFW168eFQoVbi3iw0vtzE81vCpHmTZT6hnCNRjIafSMysMI+kJ49lVaCUk0jsCkfq5MjF3GBYh/VZ6bFu+jWWA6to6xDp0CZBEGmMMCYIqN50lBkmtSRIqEUtAv8aW/NpVtH1wjD6xje3il036ICvehOfn/jY9sPDWT+KDvOvTv6LD6KBhCEafeOCpvJ0VkVshUU61vobGpniEJ4zyjwLK9Y1cODAGTJ5mpMYAGrKHiODqPCwkWuSyjgPLX0QNdcX2+Nvj0cQ6e8OUzhSElQuvOa0cIGSXnR5Y0QqYRGPwGpkWX7Z8v5lgjLS2Mg954NTmJrolpn01imXigyED5zzElAKifQjeT2ov49lPQM0Z1luBGPd+qM7NwVfPr+yxr3kurxRRWLNVj0eaP83avDN+Hc8VDA0z42dFvK9HMxFAM5mk4yvQYeQKln8+HUJU5BJQrZPaqgoccW7elTbkNRuR8RXMMvn9vIpTlEhbSbkCtkgkcsvcuIVor/pndn5sfq6TtfJI6/TyiUBldsAK43cYFA1LoyCM5ogYy2pQI8H+WLZ365xFXH06BCNA4yns5SWGQFeLcUJZFXvC0wH1MawtitfNjrXUgyK0OrNq9ZmV2i2SMAchONbGBXnXTWFKuRwE8JNvktY89e58izRDZJ3symNpOAbcWZYk/LWiQnKHF0Ytu8xA+rw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700016)(14060799003)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Tk6ExQUoVq38NSfqM0U0bfaA6OWwBMW2bssWice+chvLk18JcvmvxJbacIETpYX0xK+uXex6iU/jd8Iru+i/SdFm9l+teUjlcoxGyKhw43dQ6N1R77qoLRzntBHEWb2NK27CSSX5T3Nvd1tuV9CNdq5XLm32w5mALMNRMqBtzvIZT3tjIc+9lt/u6OK86O37Ox7cevlw8/LjAc5nQsG0h15fGAlx72frAKJcP5oBT1U6G0v+/ZQhr9WP/JBVcxZxJoqHRoTg7SsScVtrgTJ3RfKpiQF/2aFOuGVUol1Uo7Qpyctxwlz+tS/vzTaXf25cbsL3AdY7TUAF2e1rQUs/4uR/SDFNeGIP9MgZEA3f7ojbV3kvgQ+pVI6TM1yDIhkK+j/TWypLmFzruKkaMf1PhRHVcyneV4Ac6L7eAsSRZHY+BemPcJSK7JCBuE6pSivk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 09:50:01.6335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83633dbd-c22d-412d-7496-08de9942082f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8916
X-purgate-ID: tlsNG-33051d/1776073805-47B2BC9A-66E415BC/0/0
X-purgate-type: clean
X-purgate-size: 6329
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 4E55C3EA0B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

> On 31 Mar 2026, at 02:52, Milan Djokic <milan_djokic@epam.com> wrote:
>=20
> From: Rahul Singh <rahul.singh@arm.com>
>=20
> CMD_CFGI_STE is used to invalidate/validate the STE. Emulated vSMMUv3
> driver in XEN will read the STE from the guest memory space and capture
> the Stage-1 configuration required to support nested translation.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
> xen/drivers/passthrough/arm/vsmmu-v3.c | 148 +++++++++++++++++++++++++
> 1 file changed, 148 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthr=
ough/arm/vsmmu-v3.c
> index 02fe6a4422..39ed4dc577 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -45,6 +45,21 @@ extern const struct viommu_desc __read_mostly *cur_vio=
mmu;
> /* Helper Macros */
> #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
> #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
> +#define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)

Was CMDQ_CFGI_0_SID intended here? we use it in arm_vsmmu_handle_cfgi_ste()

> +#define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
> +#define smmu_get_ste_s1fmt(x)       FIELD_GET(STRTAB_STE_0_S1FMT, x)
> +#define smmu_get_ste_s1stalld(x)    FIELD_GET(STRTAB_STE_1_S1STALLD, x)
> +#define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MAS=
K, \
> +                                    FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK=
, x))
> +
> +/* stage-1 translation configuration */
> +struct arm_vsmmu_s1_trans_cfg {
> +    paddr_t s1ctxptr;
> +    uint8_t s1fmt;
> +    uint8_t s1cdmax;
> +    bool    bypassed;             /* translation is bypassed */
> +    bool    aborted;              /* translation is aborted */
> +};
>=20
> /* virtual smmu queue */
> struct arm_vsmmu_queue {
> @@ -91,6 +106,138 @@ static void dump_smmu_command(uint64_t *command)
>     gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
>              smmu_cmd_get_command(command[0]), command[0], command[1]);
> }
> +static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
> +                              uint64_t *ste)
> +{
> +    paddr_t addr, strtab_base;
> +    struct domain *d =3D smmu->d;
> +    uint32_t log2size;
> +    int strtab_size_shift;
> +    int ret;
> +
> +    log2size =3D FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_c=
fg);
> +
> +    if ( sid >=3D (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
> +        return -EINVAL;
> +
> +    if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
> +    {
> +        int idx, max_l2_ste, span;
> +        paddr_t l1ptr, l2ptr;
> +        uint64_t l1std;
> +
> +        strtab_size_shift =3D MAX(5, (int)log2size - smmu->sid_split - 1=
 + 3);
> +        strtab_base =3D smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
> +                        ~GENMASK_ULL(strtab_size_shift, 0);
> +        idx =3D (sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS;

I think here we should shift by smmu->sid_split instead of STRTAB_SPLIT?

> +        l1ptr =3D (paddr_t)(strtab_base + idx * sizeof(l1std));
> +
> +        ret =3D access_guest_memory_by_gpa(d, l1ptr, &l1std,
> +                                         sizeof(l1std), false);
> +        if ( ret )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
> +            return ret;
> +        }
> +
> +        span =3D FIELD_GET(STRTAB_L1_DESC_SPAN, l1std);
> +        if ( !span )
> +        {
> +            gdprintk(XENLOG_ERR, "Bad StreamID span\n");
> +            return -EINVAL;
> +        }
> +
> +        max_l2_ste =3D (1 << span) - 1;
> +        l2ptr =3D FIELD_PREP(STRTAB_L1_DESC_L2PTR_MASK,
> +                    FIELD_GET(STRTAB_L1_DESC_L2PTR_MASK, l1std));
> +        idx =3D sid & ((1 << smmu->sid_split) - 1);
> +        if ( idx > max_l2_ste )
> +        {
> +            gdprintk(XENLOG_ERR, "idx=3D%d > max_l2_ste=3D%d\n",
> +                     idx, max_l2_ste);
> +            return -EINVAL;
> +        }
> +        addr =3D l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
> +    }
> +    else
> +    {
> +        strtab_size_shift =3D log2size + 5;
> +        strtab_base =3D smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
> +                      ~GENMASK_ULL(strtab_size_shift, 0);
> +        addr =3D strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
> +    }
> +    ret =3D access_guest_memory_by_gpa(d, addr, ste, sizeof(*ste), false=
);
> +    if ( ret )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                "Cannot fetch pte at address=3D0x%"PRIx64"\n", addr);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
> +                                struct arm_vsmmu_s1_trans_cfg *cfg,
> +                                uint64_t *ste)
> +{
> +    uint64_t val =3D ste[0];
> +
> +    if ( !(val & STRTAB_STE_0_V) )
> +        return -EAGAIN;
> +
> +    switch ( FIELD_GET(STRTAB_STE_0_CFG, val) )
> +    {
> +    case STRTAB_STE_0_CFG_BYPASS:
> +        cfg->bypassed =3D true;
> +        return 0;
> +    case STRTAB_STE_0_CFG_ABORT:
> +        cfg->aborted =3D true;
> +        return 0;
> +    case STRTAB_STE_0_CFG_S1_TRANS:
> +        break;
> +    case STRTAB_STE_0_CFG_S2_TRANS:
> +        gdprintk(XENLOG_ERR, "vSMMUv3 does not support stage 2 yet\n");
> +        goto bad_ste;
> +    default:
> +        BUG(); /* STE corruption */

This will crash Xen based on the input of the guest, we should print someth=
ing and
jump to bad_ste instead, in my opinion.

> +    }
> +
> +    cfg->s1ctxptr =3D smmu_get_ste_s1ctxptr(val);
> +    cfg->s1fmt =3D smmu_get_ste_s1fmt(val);
> +    cfg->s1cdmax =3D smmu_get_ste_s1cdmax(val);
> +    if ( cfg->s1cdmax !=3D 0 )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                 "vSMMUv3 does not support multiple context descriptors\=
n");
> +        goto bad_ste;
> +    }
> +
> +    return 0;
> +
> +bad_ste:

NIT: code style, one space before labels

Cheers,
Luca


