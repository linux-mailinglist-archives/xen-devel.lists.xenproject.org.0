Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKJdERtF5mkfuAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:24:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3FB42E1FE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286211.1567323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqTV-00036u-5t; Mon, 20 Apr 2026 15:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286211.1567323; Mon, 20 Apr 2026 15:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqTV-00034z-2Q; Mon, 20 Apr 2026 15:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1286211;
 Mon, 20 Apr 2026 15:23:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wEqTT-00034F-AW
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:23:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqTS-000dZD-NF
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:23:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e644f3-5cb7-0a2a0a5109dd-0a2a4504cb72-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:23:46 +0200
Received: from [40.107.162.21]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e64501-1dec-0a2a45040019-286ba215b3ba-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:23:45 +0200
Received: from AS4P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::7)
 by AS2PR08MB9548.eurprd08.prod.outlook.com (2603:10a6:20b:60b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 15:23:41 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::68) by AS4P190CA0036.outlook.office365.com
 (2603:10a6:20b:5d1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 15:23:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 15:23:41 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS4PR08MB7855.eurprd08.prod.outlook.com (2603:10a6:20b:51e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 15:22:38 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 15:22:38 +0000
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
 b=nl0Wp89vzEFJkBYYGwZl4LGqa82g8tILUWv4gra5qwzW/Jv6zwBAwcPpWuuGCbzdaSUyQWJPY7ovor5vfCkaSxXNTorvd/rHnqvprrqitjHcBpMjAIy/KpKtSgURH39D1u72svZZAs1awkJ38WWHkO1vLCM79pIGJNiYXRlOtQksqei4/v69tzQb9UvN98c+tJphNsstYF3nXMx0ygr72lPU2dHg4n2bZ0fyxq0WNLUSuoV7GiA/03amIMAlg/XGbZSeSMpIU2oxhXd7tgvgK9zrkuCdzJo7RsT/IdTuKOi29zRWLDw9WNfZeq/rejLNwgbsoYqSFVOjamH13EYksQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7X01osOk7vgacygI5pbFYogajfSTTELKFBntgHZvOA=;
 b=XiGzHPaMVVEqfmeMv3snAQBTS0U6A5j62xPsDgJLLxjoQztuEGQ3qb8KTt2vNy9uLsPgP7r8PohwOD6LC3hL/W323K5Pz4Drzt35hmKsDrFSeB63eLFVk2D2XsyT85O9By86oE/WxfaX71jkQOwRi0y0iETxdOm7iQISBNuzMO4OUPGc8ore7d6HlyY8VHkRdItBeLuJFR5DeItkrT9ZRGKk2PhJTJLWoCWg5Ds/6sEwD+JvyLX1gXPNlZ4Uw7x0V0zj6b9ROdLJ6m4FS2tJN1rVE/V3laAZd/p1jrw1EME+uPaEKUeEalUW0kNMFXuM5xBmJWc9eecPA8ubtdP9cg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7X01osOk7vgacygI5pbFYogajfSTTELKFBntgHZvOA=;
 b=U7zYKaBZJZBTGwXwtgbbI7TyyGKdAHVNPZYkhlgsBwbRWOzZKKkxtzK/I9E43w3As7LHZRnw5qBKlduNDuCDa4Og0hg84C2Zd9/2ttNO6Nmp1Ox7zsfoDNRdW7pz6YjMeZjlhnvc5cF5Y6ilG6xosRjf0rgUN1GJ+WW5LTG8XyY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeRmUS9TbOlGyVR9eE0YuCnW2zbEV/ADZsSpTKNOpmXQqO5pA8wFSWBal+uFSYG/vJiD4y9RWsJitLQ1s//5A3Ud2iXrgRjc76EkTlQBzYSJGy+KrBox67W+f3gNpbFUJ5ofpBo1R8I2TGKTFgYyeNlkGiX5mh3mqI0ybmLG2xDpWhK7hlySRSzDThxaESchTR4d5FtfzgmUdnE8xdQYkzEfOmQU0O4jCgYOpaRjMBUS7d9PQZTShBxlKkZ5Had8cN2aV6AN1/Qk9Ew7OBXiOmH/a0ZCTgBV6yutIVA6wkPi1hYAUNzxPP/m7z5FD9Ej1D39qNMvX1ksOyfFCpCLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7X01osOk7vgacygI5pbFYogajfSTTELKFBntgHZvOA=;
 b=ZDiyCYZ4v7yOjqIFXn96fmKd0AvJ/VA0j9xV+v2WxexJ+smn2xk9ffvfiKeEnTiH0c1G08xQ2g8IBViQpdS5u0CEcDw/fTXaRzxv7/QwxK6kZf7CzB5FvLX6EgcBTi9nPklzCQ0wf4SNw9dyNd1MbZRq1OEZbaSGHHyHJOfrbVeNEmXY9vN3pljWX5wQti+1NqAlTkvp/tP5mC3MzL6jYbDe59kUZefYwhKrE5QTPvTx4QZ9td4jMLfwFQL8Q7afe/UoV7cxxJc5+Swn9FY/xws2bGh8vDvhwvO4drMVjUREeExw1+OXnlFUIgfMR1xXE/1gq2DO+B1EHlvMHKzfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7X01osOk7vgacygI5pbFYogajfSTTELKFBntgHZvOA=;
 b=U7zYKaBZJZBTGwXwtgbbI7TyyGKdAHVNPZYkhlgsBwbRWOzZKKkxtzK/I9E43w3As7LHZRnw5qBKlduNDuCDa4Og0hg84C2Zd9/2ttNO6Nmp1Ox7zsfoDNRdW7pz6YjMeZjlhnvc5cF5Y6ilG6xosRjf0rgUN1GJ+WW5LTG8XyY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v8 01/13] xen/arm: Add suspend and resume timer helpers
Thread-Topic: [PATCH v8 01/13] xen/arm: Add suspend and resume timer helpers
Thread-Index: AQHc0NmFet8mB9OE3kGEFwtr0PnQig==
Date: Mon, 20 Apr 2026 15:22:38 +0000
Message-ID: <88040551-4952-41DF-8F34-13C9D15C368E@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <9b5e454f55d20d3e81771da53ae06fb511bd198e.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <9b5e454f55d20d3e81771da53ae06fb511bd198e.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS4PR08MB7855:EE_|AMS1EPF00000094:EE_|AS2PR08MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: a7951f75-516c-48c1-3896-08de9ef0cda9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 7Z253nrP9FKVdg5zYp7eQX6BP0JCE0fN/1t1R9uIY+sUUGPTgfoj7TC1stbVTEDyaMeQa/02l1YZQPp50vLf9rouKul74Cy5usXxHczoLignRSbz3x8qGBRvBxdt+pZClVJJqFd8DXnqhB9sqrS+9OMUFBQturyfHQrwUs9dOeLRD0mbrWdsCwCPpVTJgi+GA/iJM4F5izvt6e+sMPfQOeZ/thYnFBo8HDKMGHnBI44PNKaPPde26E+WwhYcI2EvZ6ZE9wyMhF3n+4bDUuhXhqPdbNqVooRA4oBIfjGE8JjW13oLRs7d3gEwqojK9hf1cBRjKT7FK2wGswKiqivOZod3ARZ5Fag9liiNA6z+K//h41VjJbNwXt+vPb//hWC/KiY7sgX/glBXk98uwEdQooUfy0nJkXftOo9CnkbN8FB6tVW426rTWajk4niI/vbQuWCOBq6cR3PEnjgEQ1pzdvWc1JKrTp97c8WPVQS6zIY2yma1g0YUCZk/h28/BmaAAdFGTk8DJmYFpbeNin/JBMo7hBsEhhm+pwP41/LGStC1zNbxjh7H8LfCfNNc/0irv8Q8DINiqfYrNl3eRX3GzMwQ8pcghojbYgrykMRxaUOdsmCiVKotHMTM0VW4KjvLFVSFNPlioK3mM+ic7rEHUnahWvKT/ynkgICMqxIKmjZekoIO/OtdAIUe09Q+WsGcUj+IF8q0M60NO86bjuZGdO7gE+sP1zrcfhtJxBwaiMMP1ecAU1eUqbn7wJgqmc0oYkus9u0pjHU0YAyzIrQtdTpLWe/wA+4Gnp8BRDBMxA0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4BA5FE54FB71684983E4FC9E9FEF1E30@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 jwLi+iTRIrcoCxuCkiUx4+pMlW+TSYFwal1cWI5TReqTzPN8ZcPBG0eLDE+wF0iBC4YWA8tTObdOhehJbasA4vb6DN6+V4SkQdTJfLNgAsnnIWhBuM2gRMKy7hl9Vie1HLJ1q2sElcJKOncbjkbBfrKZVsRjrPFZWiL3Ag63sVLfQY0l0KWz1X2DLeIG3nZgBSoBHXds8nPWWQqJRBUQFU6qb1Xx/ToNNa3tmrbNmrWscSwNS/X70cnxUygtgGMJ8k/VbNkUO3zGDcSiOwEEfvnOOTe7s2O07dzw4IY3CZfj6Fn2/iouAz81jTgjJksy2z5GFvnK2rGBv3nmIwdo8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7855
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc8908fc-65b8-4f10-79d8-08de9ef0a80e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|35042699022|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OqQzPHe0EU/I525PhwvRkwnPfP3pvJ9DSLFsXr5oNMAJJlHi67UMIBIx8KiEXqksZpySGsiDZnlFOge+eoZ8fSHqUeE3JmPTgI9BA+2KbzQ1NGc0mq8PU+aEzfvGQTxGqA4/ANwHrjuJty8tmIP2GR/lUsyXZSrjP6PFi7m/BJvKaqG2Z3x7Lx30lqz7dmK5CU+wYw5ElmRtyTqTt6ZUGbZnZDIjAAylSSSMKTH5P88MS9ZZJbX+wtp8T12ItFr2C6IgjzF+EpAvTiKjYx5pBPkb+b5K+hJDSnIP9n1wkuHe5cm3IXkNc8qyKbeL2JVxFe6rCKf8/+72ibgbFHlWzKWYafPMdgK8N8kY7nXoTu6Hwlra6SSsdaQvq+c3pm05/0Om0tWdiUA3thEd7qXMAo9cuaGrsrmo9lCXMyh2JjgAX+AZhJ0oumk7SRMyv8GHEc+AIgceBiqEj9Gq2IcJ95JU+NJ1gnA/nG8DHpfZhI1dOsEmxHzlJ6c6i5z6UFa9YNDlYxuT9voU9XmeymhHaFab75dHM2i2JI4c9c5oaAlyrqUGKn+RNRNYaecwHgVfuDi6xGM0Ir4/yd0BkSf0gftjpzZpawjYYpY6r93DGq0QX5TG2+9qOG/43H37D9DG7rb4uI/IipE+s3Xlyi0UX1bYTBONWvtpaBLioG69ltlYaa+2YzCy69yyFbWntWREs3ubtteJus30WTzzLPtXrY3yLj/p/k43XeKxYEuXgCtOcnRfQ/AbbVshawyq3P7lv/cmpUc2oj9X6yniv/3IZQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	viS8hH7JOx8kQG6k67LkzxPK5J3QVzDw7sCOt7FULkez3z1/ygcpn4iV/Evozct7fvWU8BxlTmROkRq5jufnxOBw3mzuOyoxJEK8DWCrFQLW6nbfE+VFnDfu5Jy5RHH7sERbO+RmaEA7Vj3/OgtVgRT3V+TOkHwSkYFezkjoUmBp6HeDizcr+RMXHVEv0Qkvp+EZk3x16pYhaDIjIOJ2RA2MuvEJk004DvUmBEMWRjs2ZLOl/P4qmkGqe0nG/wfVQiAVbGtIfywrF6BCLhSePQyHQWu9daJruWJRzp1EGePxypaKLBnWXVr57Wj9tLrEYs60AKzKOc2w6Q+q6u0NTusRZfKmgTW/u2D6J5rcrCZgmaAS3uj/X2ohsHxvZLXTxmbLgFwxbY7rvJuAhUhXFTDy/cgMk07KtL7caP8AfLCS7eI0e8mKqeV0gg4v91b1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 15:23:41.2021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7951f75-516c-48c1-3896-08de9ef0cda9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9548
X-purgate-ID: tlsNG-ebf023/1776698625-4BB6B3FF-45C80D12/0/0
X-purgate-type: clean
X-purgate-size: 1286
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jgrall@amazon.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 7B3FB42E1FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 2 Apr 2026, at 11:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> Timer interrupts must be disabled while the system is suspended to preven=
t
> spurious wake-ups. Suspending timers in Xen consists of disabling the
> physical timer and the hypervisor timer on the current CPU. The virtual
> timer does not need explicit handling here, as it is already disabled on
> vCPU context switch and its state is restored per-vCPU on the next contex=
t
> restore.
>=20
> Resuming consists of raising TIMER_SOFTIRQ, which prompts the generic
> timer code to reprogram the hypervisor timer with the correct timeout.
>=20
> Xen does not use or expose the physical timer, so it remains disabled
> across suspend/resume.
>=20
> Introduce a new helper, disable_phys_hyp_timers(), to encapsulate disabli=
ng
> of the physical and hypervisor timers.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
>=20

Changes looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


