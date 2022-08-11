Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DBA5902F7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384764.620216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMAsh-0007h4-Ce; Thu, 11 Aug 2022 16:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384764.620216; Thu, 11 Aug 2022 16:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMAsh-0007ef-9F; Thu, 11 Aug 2022 16:17:59 +0000
Received: by outflank-mailman (input) for mailman id 384764;
 Thu, 11 Aug 2022 16:17:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO9K=YP=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oMAsf-0007eT-GL
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:17:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28bcf0e3-1991-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:17:56 +0200 (CEST)
Received: from FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::14)
 by VI1PR08MB5487.eurprd08.prod.outlook.com (2603:10a6:803:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 16:17:46 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::d2) by FR3P281CA0141.outlook.office365.com
 (2603:10a6:d10:95::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.7 via Frontend
 Transport; Thu, 11 Aug 2022 16:17:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 16:17:45 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Thu, 11 Aug 2022 16:17:45 +0000
Received: from 6cfd2b1d78bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 767948FF-80A6-4929-967C-F04C6C17BC2C.1; 
 Thu, 11 Aug 2022 16:17:39 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6cfd2b1d78bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Aug 2022 16:17:39 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI1PR08MB4286.eurprd08.prod.outlook.com (2603:10a6:803:f6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 16:17:36 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%4]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 16:17:35 +0000
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
X-Inumbo-ID: 28bcf0e3-1991-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MSsLjl9COMfoVMMwoIIyB/kuRoahyZP2SXXnXY2eLeOVoK+c8ocSho6laXv1KVjjVhhR0ahjsGlL/x3SUtNLTzpv/DZznUZaOaEgekrsQT5YB9EIfZMlqYnjvXqsQPBbYJerAi57BdW0EiWx6B7X1k7G2K3iw/wYMz/EeANzghqyDCRe0pRVvPV3sde0c9je25Z6qeE1hPYv6G8P9pYKLpucN8eETr446Rrkxpp7KxzDg342Cf74mxibWapSZHawiwEY7DetM90tgkv8lSTVNe12irHNXBuiqkK0+RAoz4TVqVfY6WuDb9Q73HKBJq7/xHzbJd82fKn//X8R7M7ZYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBz8oskOKNg4uyTxzLL9dteX8kqrlFfIJsinpsinzI0=;
 b=GWNsJq00cePFJTlKjqEcPWoPJYAxjKuVN+0xiQVh6hn4pikev2eNqHZ+zJ5wTTdyT3z8j+qU1U3Ih67Je3sTCIbz0O3qIsyuuwQonBqiv3Vei6YIq/Nj1kfdftPuNW7b4bpevxB2VsvUAoTcge9QR7aOrsWkBf6szmGbp7yyU+QQkAKClYxgdn1W22w31DbckNlfJ7cnfwhEet1jYtETXAlqzn0Y2CblzjnMK+uYIZMxv15iKOGn9s8euVyTyDA6aZ/jRFv3p18lA0jLou8yZiCxxfsMFga34afNO/EAmO6OK2IESRy+9FUPfZuN465iH7DN1/F/9WBZKNy+Cmo5hw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBz8oskOKNg4uyTxzLL9dteX8kqrlFfIJsinpsinzI0=;
 b=8uyla0JGVUZgraSIUqF0uW5oYCKNdpfA3SHRWDMgARlIuM3K44Myl0kD3nai+1skveVlXblCF7zvpqMPqtKGPQ/hBHLOqGjJO0fLXNx3kWnZPTMJPqITaoyJRUwg85SwP06dZL5PLel0dz3iYJFLcjeOwkavhqxU6pi4uSrjGnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d3a35ec0b6f045a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxH7JE9wYb2Mx5q6sxz74FCrnGSN16VMeNV77FIJw6VjA3mwgiUDRAmJ6YNs371ThENRh+0POGwng7N/2/R/6m/yl9ucIDY2TwcmztKXIyZyZVU5m1KkfXbPBc68YjQ7B2I7Tv6xxYvX85G0muITZkiB+cDTtOoOGIurJgGYp1I9pVMaI/PGmFZxrv80I1U+Pp5aarKRg9vbzE38nuwUgxik1NJyG/Ekp8tqkg2nTuJUse85hs8D7KjOn3AXGa7awrj9T8tbqIRhZu9bya8ahEGcgMV2XxHi8SspdrNDUrBOA3iDCXiwdsmiseLyAwL2HWkrvODeDmw+L9KGZWking==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBz8oskOKNg4uyTxzLL9dteX8kqrlFfIJsinpsinzI0=;
 b=WGiiCeNa2Gtu3qQl0c5Tp34oKVLegKyDrQmqQjDnBLXzPDa8A5QrS9x5qDz6HIIDa0LYlmyUO1XpNUO7Mr4GFEukps6MLFnxtH7PKmWwNga7KPAEQ3xsC0wzAlzNnSA9dQvfuOcqeh6Q0WrOWD4uyev31guubF+h+4Y5KSAru9C2sQZCxkN/jNYn6IDAvWdXzWPmnNVBcVDnTJ62O5x9SNqPY4+RUj+6j55+1kDlwWeuUOQUkW7KSABuCtP4mWuplCqXeQmGx5w+XU+w4fpsx5PtR7OmbC9loeezoL9OTxSvanInhazD1KZViZlPTKi97+LOZaDsuKVPgkyht3A35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBz8oskOKNg4uyTxzLL9dteX8kqrlFfIJsinpsinzI0=;
 b=8uyla0JGVUZgraSIUqF0uW5oYCKNdpfA3SHRWDMgARlIuM3K44Myl0kD3nai+1skveVlXblCF7zvpqMPqtKGPQ/hBHLOqGjJO0fLXNx3kWnZPTMJPqITaoyJRUwg85SwP06dZL5PLel0dz3iYJFLcjeOwkavhqxU6pi4uSrjGnE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Thread-Topic: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Thread-Index: AQHYrXBoGW5nDLcLl06N/ag9xMtlQK2p4NqA
Date: Thu, 11 Aug 2022 16:17:35 +0000
Message-ID: <8EBCC4EC-9886-4F67-B21A-2DAB23F2C480@arm.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <0bdd4f3f-965a-fe39-f7af-d8a40b7a68c6@suse.com>
In-Reply-To: <0bdd4f3f-965a-fe39-f7af-d8a40b7a68c6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5f192aa9-8be4-4368-022b-08da7bb506d7
x-ms-traffictypediagnostic:
	VI1PR08MB4286:EE_|VE1EUR03FT054:EE_|VI1PR08MB5487:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HLyMiE7FV89E4+ZnMr4eD0rmqJtIAxt66LnMJwE9CLx3AzGgRI6oILxHdOj3TKDuPvFP/5O2wWYuFgVHkKI6p4psWtbF7tD+yERJs3k7/u+AtmbJjglm1CDPRbt1tR/mAYd4lDAJo5uEij9QA3f8YPOG+ygFTGAF6CrDa5aZplyHVaQcF3OPFWWVbOqHidNYdGzjW5uHQ4hSKUibzJwkHO+18pETE2+yGVqzhP6rMcogMlQD47k8a0bhKG8UNYUhxTjB8SBk1JDqN07tA4z3D9Ylg/4rcz0jrN+ZkXFS+OhQQ+WzZ96Jk+vIpC7oNuEMBsUMTq+eX4ECNYMoXYc/0b9cEOyg7UsZvFzsA5bAXsMTmoWI0lvVuzuwDytQ6p0+ZGsnq0iqX0tZcKsTevqANncnD5vICZ3zYokJbufF/AaL7Nn9C3HD0XUoCKZj3htYIsqskm9aTinQ1cqVeZac0F8VceAAYKiThzNQKB8MEOOpoJ3+syRtqnpbCwRL+rsJ4p3IEdqCZCICbDWOMXMIugs0yX3kzuprQzwIlhTLxEfiQgvj7T3uIOKBaIQazpEVnFf2jChrzCm7sHe1V9sIgNbpBK/6XLuI4ut+vTpDtKnu05DAN0Cw9gP8qKhKsbp6q7O9ewr1LggAoArklPD5QsZ7JAGAn23CZTiDpldt5yCrhxT+Xvfji1jxtYE89vX9nSqLBCpcHyc+qHWECUW/rHtWSE7I4lkHkBMNofe/csSjmgieKdzEO76Pj1tbcIO5O8WsjVkUQowkNBpLsrY6XUa+b9yR7woEMiDp1fP/oR4tjhdZih6zqofPoS64hnTiFKnCiNTmJ+t+3nP8hP63cA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(66556008)(4326008)(8676002)(66476007)(66446008)(64756008)(5660300002)(6916009)(91956017)(316002)(76116006)(66946007)(54906003)(2906002)(8936002)(4744005)(33656002)(38100700002)(122000001)(86362001)(41300700001)(38070700005)(478600001)(6506007)(6512007)(26005)(71200400001)(53546011)(6486002)(36756003)(83380400001)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0544992140CF7B41B91C447D32F0285F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 =?iso-8859-1?Q?pAeRuHR4NKt0lgb1kxn2Uf8sLBgjMvW/K75FF0UqEUDtr+LgcZrjNZca3s?=
 =?iso-8859-1?Q?BVmqqkNyzRIzE+ApcFyQGXl3anC7kWEMwIaWhl5iqNhrSm2pUT6+q+Znnl?=
 =?iso-8859-1?Q?CUhvEtKbUQIASmdCzcSE3oCGKPMPw4D/GmTKb6AU9xKX82SfyVVy+zCORS?=
 =?iso-8859-1?Q?Pw12vL6dwt+lzrSreCl7WXsNwIdSVLjhr4G5XzWdk2eHldJFHpiedR0dsm?=
 =?iso-8859-1?Q?6WLW6g6dnLTZ3c6ovCpvDfEG9SKcWQqSUvRT4v/68UqKjrlPUv3MAYyn2h?=
 =?iso-8859-1?Q?65+0qs4RnuoOfkc6XzkRujs4TvVmjoKGMizElhP2YFiqG7U1Rl3dzMLsTU?=
 =?iso-8859-1?Q?b1YfXOEioHVutbKahWcqbSpd28A+7utWqJg3xhm6hrRzA5lnJbo3CpFCQ2?=
 =?iso-8859-1?Q?v/IpIJerQPwi+Zn1mp37yvVEAqWPXMUBaYRprrhmPzGe4s6t3pb+mK/I1C?=
 =?iso-8859-1?Q?1AKUerhy5p5EslEF3O5ySG74jMqbHDaGbkMy1ipVD0E6Nh72euIkKBy0Fa?=
 =?iso-8859-1?Q?PLuUXOKcc8IXkakD5uYpxvXsW977bRcunXypIsB/JtI76VKbT56orrabdm?=
 =?iso-8859-1?Q?ns9QrWhWxRNG8nyN1/dFxx3bLO6uZZ3ESTzyiZG1cfs5IkWJ/uFdnC2YUr?=
 =?iso-8859-1?Q?tbpbdp+M/XSc7zdI/RF1W0L4LEuhJB3YL6k9Hv7k9lFR+na03hiWr+YwKl?=
 =?iso-8859-1?Q?wJ4cD53cUT4DNy2YebE9lgXlYa92nztVOYKPS6b8yyRthlzCSnEI/tbWgp?=
 =?iso-8859-1?Q?10KEGHtqgrgutkkSe7NxIaajjKvma+ZNgvstb/6VJvjOXT3/eO4jdSxxuW?=
 =?iso-8859-1?Q?apJmsZLYMOB8AfKregN3Nl1oyHW89LpYWZjLObr8DH/bwltytxnswtnz8V?=
 =?iso-8859-1?Q?iQ+vblvBPpaDjgunFdpqQ5DvdBK+9M1vWCTl+7l/Z3x6zeT4Zb+FllxpYN?=
 =?iso-8859-1?Q?bfjQdzZXQoSXDUtdf47dLiNuVS9/XwlUIPEWzCw8D5EeHrcaIj9uwiPzz1?=
 =?iso-8859-1?Q?k+fOmt6eQVnhK4XcGfASii1l2P/lGYnpKwOMVhu0GR8txteJC+7Ym4LhUV?=
 =?iso-8859-1?Q?0aiec9JxCDvBYEzHETZjwcwcV20FuRT0ia5+wUl2W0ZQlhQZiaNhv+DMh/?=
 =?iso-8859-1?Q?OkTvydYJCcMAUM/puqQpu5EKfLu1cIG2PWmSI2suc9XX15S3FD?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4286
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	186f175e-24dd-48b6-9f50-08da7bb500cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OidfSSV/ZxpQan5wpHP9nw4JKv1kW3JFbnp9UPlAnvNZUuSREzkj/+prx+TMfBEaIPFtpsL2z1wyrvWIlpGkzkMYG4Qxd8VpaLp9Pq8TEv0nJTNA1yPnYISFXXYEFttzNz29F/Gr2vdBhpt3OEMol27ifBHMdB+tbreqk1288A+EW5eObO5CwIi8Y8cDrOHbpbo2ooCPSXuT18euE6s8wdNrRoFTBBN3teGx8LkbDVL1Te8Q/xGXfSBkLDypTM82HZfrPYlgOadO63MNBV5L/KU1zB2B45Jv+PrbGnikiFxg6QfLUaoABCPKe1io0PSWp4dp1Iwpe375IR33HrNP7FJX4Kke2WILd0Jcic859veUuYk1Y3adE0aisJZUA0q+I+ih9YdIWFe+SGX6cqDHeYIroTj4MUIM+Jvx/Z2qM26W2S8XuKaSHXpsr5QldbqrD8EIeMm1ns0VQxbmhhESUxdmIWeWev8Yo/XfYhsP+WWRtKVYjiKdDrb5WocaM8M1cXOk42/WBirggntbfuE+lfmnDDv9MsC6Ivb1c8Q2SdcFi5yEhFbRK5TDlTQo9H4B3cInHBN4YtqgwUzZeYhSjfPUtdfGWUESj6nGqmdUKRaw0hZXXPL7lSjJ9aRLZeXnmBC19HLRssE0G8fEMx3YxyEJG7dg0juxyDIZooOx3F8yYNJ9xHUyLI9GCdDbPTtCP99ck9RPwdrcwYXxYGbCBVKIIB0wwEr4OKMSbppySxFF6mSnyHKO9HyzEgl0kGoKhysIX3uDL73OSTNmE36kpF4E5RW1L6LTRyQ+cdYNuAQSePz9jgP0rVuZPPMa8GvK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(36840700001)(46966006)(40470700004)(83380400001)(6506007)(336012)(53546011)(186003)(26005)(6512007)(2616005)(82740400003)(47076005)(81166007)(356005)(36860700001)(5660300002)(70206006)(4326008)(8936002)(8676002)(4744005)(70586007)(6862004)(41300700001)(40480700001)(2906002)(6486002)(478600001)(54906003)(316002)(86362001)(40460700003)(82310400005)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 16:17:45.9303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f192aa9-8be4-4368-022b-08da7bb506d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5487

Hi Jan,

> On 11 Aug 2022, at 11:52 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Rename the latter, subsuming the functionality of the former when passed
> NULL as first argument.
>=20
> Since this requires touching all call sites anyway, take the opportunity
> and fold the remaining three parameters into a single pci_sbdf_t one.
>=20
> No functional change intended. In particular the locking related
> assertion needs to continue to be kept silent when a non-NULL domain
> pointer is passed - both vpci_read() and vpci_write() call the function
> without holding the lock (adding respective locking to vPCI [or finding
> an alternative to doing so] is the topic of a separate series).
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>=20

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul


