Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK6FIfjqAmpKygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 10:55:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE5051D19D
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 10:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306626.1578469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMise-00064D-5s; Tue, 12 May 2026 08:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306626.1578469; Tue, 12 May 2026 08:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMise-00062f-36; Tue, 12 May 2026 08:54:20 +0000
Received: by outflank-mailman (input) for mailman id 1306626;
 Tue, 12 May 2026 08:54:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wMisb-00062X-Sh
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 08:54:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMisa-00DfSy-QR
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 10:54:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a02eab5-2eae-0a2a0a5409dd-0a2a4503c76c-4
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:54:15 +0200
Received: from [52.101.72.7]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a02eab7-672d-0a2a45030019-346548071e12-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:54:15 +0200
Received: from DB9PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:1d9::31)
 by AM9PR08MB6289.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 08:54:07 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::1) by DB9PR02CA0026.outlook.office365.com
 (2603:10a6:10:1d9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 08:54:07 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Tue, 12 May 2026 08:54:07 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB11184.eurprd08.prod.outlook.com (2603:10a6:150:1fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 08:53:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 08:53:00 +0000
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
 b=pBj5FEHuO/xXKcFRZ3w7q85U8tNHmqzp+a9QSdToxUfm6VulGwfX93NlgXozuC3I3tzerTKvemUTqaVsGXv1+/q/ylakFiGzrQUjRCoFz2HZpm9+s82s+OCxZmFv/uyCKL4sTnPUoCe+RJyS3S/n0o5TAhV8yJKdV3GKAJ/1MrgVWgFSuOCSUfBx9TOE//PHWKwEljA6eQmUcsxE1BFEwfi3V9KarlWnx+zUFSnyBBSSfRx6zADb2eT7QHkinumYM0iFftdpk+Cy3RYYKNAfzZ6ESjU7ny6kBEa6N6Egbo/Bip3gNkfhByrrXaZwGg+eYNrTV3JRIPhAOr0LaeiI9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSvijUsJe/UOwM67snX7fIDYWf5TwmyPin4/myZJ2io=;
 b=c2XmONMhirWN6118UC/Xhfyb3cOg4MYfAvnOhHb3GBM1Dg4WRw22tNGexvoQmgCScjgivv4U3gLvTxHbyQt5NQNBON83It17gpVp4dJ9xEg8W1L+INy4b1dWcjvVFmnERsHH1BFN/vY7DZiIZROI7i29eMzr3UWfXckWTiZ81CicaQwHUwSoZqJ00RrHf343KQQQzm4h7rPBMKPO8AYaZgaI0BfN1jL3ePk5ezqtpWwsAn9xUoR37Iyl1J+eIP0IK4/StY2GqLXG+wHt0+FOX21qU34mRYduKFcmdofqbt2IYyPeUbVOtn0p9GmEW9sdAhS8GH2GgOzI56S/MJJK/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSvijUsJe/UOwM67snX7fIDYWf5TwmyPin4/myZJ2io=;
 b=Lm1dNpWG+TfMAREk8ymXTzShfQuVm30nyd5frfphUFqrFgJpzwkNlBjebdGU/Yn5VwW2Pj84VOFjJHybOwLBmOGlLiL/Ab1wSnSW5xbzF7ngYRbLagOUgWnhALXOvNc2wCrMlMFgheuqSpe0Akbv9FeInSPRP1OMNaSTJoLY+48=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2P4olRIsemva2iDEN9/jKFRKwp4mbGX55ptazMRHCWBVgfAG4SUZHcnhX6yHZOPotml4FuoccYUx4SSngzhkAZ7PN/H+NsA4Jwpyu2pNDRKnRH+RFLguiOcM5+OfcIXg8ETNYFQeEaJYploJlfPLRbKmeEB/zyqSCj4EFGX96YikEr511cIgLlsJThtSSa26gLGtexAK7Cx7IafcPxWHbedQYUeGyM1KTCj2CJGSKBPQQVIU4SzaQzQgjsnoIbxoDYFhm5UBHVFAorXsjaoOVMf22v6YzGjeXrFeZyy6bxRKsNpT5oI2WuLlkz59M68SVrruDw9n91GxS1flXWh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSvijUsJe/UOwM67snX7fIDYWf5TwmyPin4/myZJ2io=;
 b=H85SI1+HQdC2h0lf6SlcxL1JOjf+mv+AI12fA9O0ll6c82+iDCELn8x974uECWgYA8kH4qdcJY7ydk6/o2UuCPi/7jkL/n2gWzmgF8tdRo25a9sH4ySiRVt+Nnsxw6KFWTk6rZmtNKvEx6gsCPVXmPMcGFZOmmoa+aCcPV+rPWN0k6PL1YAc/mhIAmPhlNfj5bD6dfb3qzMrHv7T8ijuxk0JYl0HEFIt4obuDZKw/Z0laBCL+v9qsGfXLpulVgBnDyjZ0zRtGlViMcZhuPQlRjsv25w93hYgffTcWHxXgEFyH2mAilaiPgYxaJXhhBfwWTXjBcFOG1nCWffw8zZ8tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSvijUsJe/UOwM67snX7fIDYWf5TwmyPin4/myZJ2io=;
 b=Lm1dNpWG+TfMAREk8ymXTzShfQuVm30nyd5frfphUFqrFgJpzwkNlBjebdGU/Yn5VwW2Pj84VOFjJHybOwLBmOGlLiL/Ab1wSnSW5xbzF7ngYRbLagOUgWnhALXOvNc2wCrMlMFgheuqSpe0Akbv9FeInSPRP1OMNaSTJoLY+48=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Subject: Re: [PATCH] xen/arm: sci: Don't create a domain with unsatisfied user
 requests
Thread-Topic: [PATCH] xen/arm: sci: Don't create a domain with unsatisfied
 user requests
Thread-Index: AQHc4eeP1O8mBXB1rk+o//qB93qmFLYKFYUA
Date: Tue, 12 May 2026 08:53:00 +0000
Message-ID: <DDA5C908-6C05-4196-AD53-1B40A3E72C1A@arm.com>
References: <20260512081442.48149-1-michal.orzel@amd.com>
In-Reply-To: <20260512081442.48149-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB11184:EE_|DU2PEPF00028D0D:EE_|AM9PR08MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9faf35-6823-48d1-7412-08deb00406e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|11063799003|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 oBH5gPyAvKAP6ZNTscxxwOPsGw1nXsIZbRbEAV0tiX3FFfZNCwCeBoamfHxTq1iFqDYJMkL9ScbbguMbZ8nHle8+4mYHqezaIQ1y50otqCC+f5ZCY+Kb9oVVnPZrx15S+Al3P5BhjIxoaFmK/GguOzT7gFlits0cxb+/q/VBLvBLJQ/v6PvToBCfU4Xx18B11NBlVKHKaPVfKEVAP6JM495R9c9kZf6FVbTt8lRrN/6u3zp/Cz5TjIBi9zcDWMKH6J/R+YPcGWEud2xNDqWXXCX+ZNqIteLmCpdOoEAji5VcwBRSp8cytA0gYlTu0g3LSE5SlOQQfbBEgVyBoj22Bmb5GM11ACPejD5oaKYIp+4tqsk4kc+JhCsKY9hGGA9jMTtWoHMAIUBvHGUcHU0kbHKjlgrbBnIxdWxOamp2aoV9r6QKdMo31zVnV0NsvBWEgSjULR/6I4anyRA/H1xBEp+SbgdmRJoyQclD8tJ0FasQJfD0eRjmi8qv4tkAWfg7oMBQyidSBzhIRs/0BWUrB2/ovNu4cCFk9nSAmlhO1q1VJCWS+XCLMMvAAMqu+cycJgCdHt17S7GAVTQ99kj7dTqmAv8zCCvqM/ZlX859pRHo71BqikSmosTZvwQ7DL1IhD0+UZcAD8UBzb8coXXiHJmcasYAW18kKUVlxkZ2xk1/64byYtpL7aEuS5zfeSjeuGLN+e4jDt3SolqQjHAM3QSbMNOcxpreuQ1hLeqjZdmWef7FAYWGQkH9xhXnU4Ug
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DE39E31374419449B3BD03847B5E555D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 DoF6pKaATShF51MiFrc4CNwZuSRmbHrI8J+O+4aHGwLKK/01UJLN9OsldZISVSu4eVQ238wzrv5Q3J3S674XdBIHK8kxladLxJKPrawxf/1VaH83m3fTFD2rZ3EVl5Z7nXlpbXK5+bSy7bqG2cu5bMPBgAKh2CVfjhOSc5QJ2bNlGdLlL2KB1jJFMfu8OZToVv5zFUUUE2/gd5svdxKeXl7qVeFvqtdkbEZ6LeoxKXJrofTtW3Xqdkk27+XPy56A9Lggm4IgdAgRoOXOYaJjt0F1fjtTNn3zahduvORP6dB9Oh6i5Xg40HpCTmRfwTSnn87/nkJmspXCrsc+f9EQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11184
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76b2988b-30ee-42e2-aac1-08deb003df29
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|82310400026|35042699022|1800799024|376014|22082099003|56012099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0MBkyZxRscBoIzSx5g6pTErrbvEQk5oVRTvpVUOpOsG50llx1kfV93l0P3JLjnv4+n1rgYnLaJ4e4szEHQNM8sEVHfwbLAxZgp+zo0fCnjjj9h596JgrtGJDGgtriHXM82DdYK8jmAEJDsoZb9v7Apsh6KJnVrOQLXs6nDYbCk6qEj1RJMgfqPch9bOduOq4B1RReN7j40I4lgvLHBnJGVp5n/mLPWC8eIXjP4z/3c2MVGMSFi382G+75Lwz1Y81WuzPD239K8OJxEvApfa+Qky9yk2/EzLhTD25nyCIeySvzQqxy60i51oaJ68aMTaokff2TGBOpN57EE95v6B+ZxMkJYvWZUbEhWzffxyD+yBu3I+e0ZsaNFCqlcTyITZasaFMS6In9RW1mbC19NkYTwzPmXKHV0KhpEHHIyQY/OlNC8oQnDzccTd+pLgVis7PTFH9FtNYWYzwO/4HVp0k/oHl7vEv50ScmmRZs2JMklMkljzny1YD3fsyNgLcEBRdRvoYXilvdOFY94C6a68tGFHb5to89LWaZdYxwVOWNlx4Hos5D/fFSsDHuphzrPIMicZ+zo6dOApLHkO9NwUW1gemfVfJuUg6Nk9nBt93mu3O3I4naGmuYBW6EaeKdrKoruS7LtIhcHNx/ZnyT/VXWOvRndF8p5mrRlfwLw2xkNjKF96YpTl2hoQE4Hlz56tulfE0flrz7lhy0HnJmdGpS7rohR/A4Lgd3UD0SafuTno=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(82310400026)(35042699022)(1800799024)(376014)(22082099003)(56012099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y8RvMewNYyqngI48n0lc96h0Uz5Nd9nmvSW5LchAbL824ZJK4Ecm3N21LLUfR3C5u7vpRk/1rO6PlZh1eck7qeJTMjbnXJdmjN1XomCcbiedqo6CxwpaDbXXx6L47oOP3jgIr7VtVG2/acjAtUSkhx/mMB0mgU1H9i1JzFivAn/Ukj4m6yAJMW91CxKqMPnSfXK9F9L/7EAGSmGbtwp5fOlmtEeudn0gAiU/zGO9Q5umgLlQ8JACoyMgM9aBWjdqwyKYdrj+HH4SskxkaY2lC/v/oARD4pQi7JRGtqOiMcM4NIWpEwGlGsHmsbscxlzd6nerideZfZNjkGZNSJtq4QyelErf82t9giQ+Qb14fx9CPtJKAF8Gp03AKCr/aOHEzMkGv07qiF4O8P7ad/yO/8TkTn2EACQJED4H/Zm/HgjNXdnfDhffAm5OcU37cMgd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:54:07.4100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9faf35-6823-48d1-7412-08deb00406e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6289
X-purgate-ID: tlsNG-33051d/1778576055-4006F938-3D8BB1D4/0/0
X-purgate-type: clean
X-purgate-size: 984
X-Rspamd-Queue-Id: BEE5051D19D
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Michal,

> On 12 May 2026, at 09:14, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> On Arm we stay on the safe side and refuse to create a domain on user
> requests (e.g. via xl.cfg, DT options) that cannot be satisfied due to
> the feature not being compiled in. SCI fall through the crack and does no=
t
> adhere to that i.e. a user request for SCI type other than NONE when
> CONFIG_SCMI_SMC (and thus CONFIG_ARM_SCI) is not set would be silently
> ignored. Fix it by not allowing anything else other than NONE if the
> feature is not enabled.
>=20
> Fixes: 10e7473d6024 ("xen/arm: scmi-smc: passthrough SCMI SMC to domain, =
single agent")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> xen/arch/arm/dom0less-build.c           | 11 +++++++++--
> xen/arch/arm/include/asm/firmware/sci.h |  5 +++++
> 2 files changed, 14 insertions(+), 2 deletions(-)

Looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


