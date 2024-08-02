Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E36D945829
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 08:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770197.1181134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZm4q-0003sm-4U; Fri, 02 Aug 2024 06:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770197.1181134; Fri, 02 Aug 2024 06:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZm4q-0003pc-0z; Fri, 02 Aug 2024 06:47:48 +0000
Received: by outflank-mailman (input) for mailman id 770197;
 Fri, 02 Aug 2024 06:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0M7b=PB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sZm4o-0003pW-Cc
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 06:47:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e855b2d-509b-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 08:47:43 +0200 (CEST)
Received: from DU2PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:10:234::14)
 by GVXPR08MB10988.eurprd08.prod.outlook.com (2603:10a6:150:1fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 06:47:40 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::37) by DU2PR04CA0039.outlook.office365.com
 (2603:10a6:10:234::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Fri, 2 Aug 2024 06:47:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19 via
 Frontend Transport; Fri, 2 Aug 2024 06:47:38 +0000
Received: ("Tessian outbound de9676d3a70f:v365");
 Fri, 02 Aug 2024 06:47:38 +0000
Received: from L481dc2ce6fad.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22D877DF-4CFE-43F7-B415-A5CB21DE47A9.1; 
 Fri, 02 Aug 2024 06:47:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L481dc2ce6fad.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Aug 2024 06:47:32 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU4PR08MB11150.eurprd08.prod.outlook.com (2603:10a6:10:577::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 06:47:29 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 06:47:29 +0000
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
X-Inumbo-ID: 1e855b2d-509b-11ef-8776-851b0ebba9a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XZV904lRY2afThric93gF4TVRxD2/Vf2dJTdzACXZkXCsNmJYwDuVo+WpzeoncK9ubtxqKdaH6giTksPVE/1ZlFcsl7VRctgSWLRHPKrTw4fHBYzoJm4q5AD1VkQ+PSHVEsyb0aYgLPVrdoGy6XF4ZunG1JNCu1smqq9BvZkT55eodvZFwoKt3t0ufNAjukz5O+poKISVXXA1cctUgOSwycxCJuEtg+GrnX+xDJ8PdSqsR5pJatNTwie0cLNfui1U0hYClyqvXJWCHRbPagSKGlJx/DapJ0KT+OJZwgqSF6Qi4wrbndN0Mnjkhtvy8WyWs4jD1HgGuQmwnxrntTIoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBjOL499370Q3laRLvdGLAYxWnUBhC68FAW97vUgoF0=;
 b=tLzmceOA5ewZi0mbcL3t2lWdliUFh4s7nvYKXpLLL0Ls+CErRqQMJb0BHewafWzgfH9LIF9zT8BVz2jrPQqHY++zXe2H9E1z9f6E1v93hKJmO4pxrvpEjAPC/izYupviKyka2tbxR5Ni23a//cRqWFX8bBRzuDBSrAb6V+8ZoN8FN5VJ9iCruVgL5q31RoTLM/PwUFMmDLPEuK7jHuLXWGEl0bFhWSK2vqT4EVkoquH4dU+7h8Lr77lv2faJPI27Dp+RX8f75OrWXxtYLaELQTI1m0k0/7nEyeU9wnoS+zViRRseWyMvhcZicBxoYqenX2/ZBcMWuO9ySm+DBHhGww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBjOL499370Q3laRLvdGLAYxWnUBhC68FAW97vUgoF0=;
 b=U8O9zWeBOkTyXcjUmncR6B4fmEb35VzbFmeOV2kVScQGLumkWbz/MVtyBEoqn3/zxCKGMqCo6eoOIAvjOo44zDEI5eQnhLIFeezex92yz5QzeOrmiOn+dHlmcfE6ECNAaDd7mFtYPIpDfPPqmyDCv4P7/1hGk8P1P1A5aSaDD/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c78e87f6e9df32d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsUpiziTFr8R+Jf1qwLs030ZK54Dys12Ax1AYiRhOdwM5q1MaSdzfbLtKMxM9pBcKf2F8+hNqED79tv4sob50JxbjF/0MYV9llLFWKtmU3TC9WnXhlzOaQXpHrdpWjhSVUnrW1AyrJxJjoNx7DYtPdE/nv62+uxNl5WoVTn0Q7Tc5ZeY8cq0JmhAfjimDNWqMZEWgaZLyxfSb1CECmxcrC9tRazwsJoRZhMjU6TvYCmWuMJNmcpB0bruFDXYI2hmNvq/nsrc3szWAO+RVWsZcJkM16pP4oP79QIAyZ9BfxZPt0sbGEMBaADNUxu/UaDKnmHU72UeYN1htB46uwHbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBjOL499370Q3laRLvdGLAYxWnUBhC68FAW97vUgoF0=;
 b=lROzZNcULHTqVVtcstW7V7N9aTuwFXHxqh07GlP0dtSuetWpOYtJjdhj4p8A/Lk4szDQ1w5zKPIf5bNS5gk5Q4IPmZVMwGFgD04tvKnjLCSA2Tczmnq0b8I6vIv0SWG7YKV9EabFxCD1hOOwJUm7juT2vuWbmPMXOdGOkheiddRsvml4/cA8Y5ehJESNZMFvejdvPfWON4atICW08NwqISOua7yKw/pomgFFxAvSIdmrWs4ZuNWVeL3zCpdixtGjJDZfIEr1zokQr88qF5X2y47wlW//m2eWllfq9eaiezlUmNTePfZ1KeFGtE8lfJXnIU/zQs+E8DmupifjhawVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBjOL499370Q3laRLvdGLAYxWnUBhC68FAW97vUgoF0=;
 b=U8O9zWeBOkTyXcjUmncR6B4fmEb35VzbFmeOV2kVScQGLumkWbz/MVtyBEoqn3/zxCKGMqCo6eoOIAvjOo44zDEI5eQnhLIFeezex92yz5QzeOrmiOn+dHlmcfE6ECNAaDd7mFtYPIpDfPPqmyDCv4P7/1hGk8P1P1A5aSaDD/s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH v3] docs/misra: add R13.2 and R18.2 to rules.rst
Thread-Topic: [PATCH v3] docs/misra: add R13.2 and R18.2 to rules.rst
Thread-Index: AQHa5EfVsHAUXHnoukyrQTWk1ek7dbIThxOA
Date: Fri, 2 Aug 2024 06:47:29 +0000
Message-ID: <00459643-095B-40C8-8AD1-48D8DA35962D@arm.com>
References:
 <alpine.DEB.2.22.394.2408011218250.114241@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2408011218250.114241@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU4PR08MB11150:EE_|DU2PEPF0001E9C0:EE_|GVXPR08MB10988:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f16f0a0-77e6-45da-9391-08dcb2bf0013
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?PDpGGbNtbF1lvtN8cowRiyNUAWxiqKZR/fzZQlzehiyb1CYpYvjgbt5dKs?=
 =?iso-8859-1?Q?dliRHlWjLz3rPG+/G8m8j02jJ5rAH51WxsID7BswGwrDZtV1RzRkfOAkcZ?=
 =?iso-8859-1?Q?Npm0XE5r7eZ3yenaqrOOEX72IBL8lVZZgdjFzMh/1422NqEWvnmQ1SvmXj?=
 =?iso-8859-1?Q?WzgbstfKdADGu+J+jGvzFGZXe01fIucQ+Ab1XwTFURW5VnjvnjT2NTRAxg?=
 =?iso-8859-1?Q?98LOWULvPl1Oo416EKXsV5xZ1mkwIuQDIW1XG2jNtW7Q0ZRxUGmqtruoOA?=
 =?iso-8859-1?Q?Rz3Z7SSBHjI/dUCd2zkzrGWeGZ8jIUuK8jdULuXD9lguCcWxA2/baHHsqq?=
 =?iso-8859-1?Q?fhMqmJFMd6GYhGK7ltMC7OHUBB3BmBb2WnINTgB3qh+Otaq7iulop7lZZx?=
 =?iso-8859-1?Q?AnfQf/4dVuu5LTA//Et1cR22ViaUC1fuSwVZa8/WAkc5Y3oIAizie3PFwF?=
 =?iso-8859-1?Q?pXODu3yhlztRchaHSz+jfUMpCse/UYPvjScBZFMISKVW9zpHfBNNJu9wdu?=
 =?iso-8859-1?Q?A6zgefhGfsucV/Jk//SyTBE+2dhGwPJejVzuqBKJR7TrdJBMFTW3jXcDqB?=
 =?iso-8859-1?Q?bWSpKHefNxJB18Stk9cUM29Q6HUwgATBRXGi++QckkTlHgWjdlH6WBNhWB?=
 =?iso-8859-1?Q?URZUsL7e6g0MWzA7KZfqzr/SwZ3lc+RSNosFvFMDo8DP4k6W9rzrXreY5S?=
 =?iso-8859-1?Q?TrM/xMZTxXOkN6sPnbcmRxKy8u0/KQsfn7QAZVi8brdF+LK8aF7EIkp684?=
 =?iso-8859-1?Q?FdkRS4WOxF5LqNEgjiV3RCgseCKwAyzrJW6gD/9MW24GAQ6/H6O+aA2Rfy?=
 =?iso-8859-1?Q?cYyvMgvbNrO6gpb/dBuQpctGVQA45Muc0wK9qvtOQYD2JleMv+oQO6F712?=
 =?iso-8859-1?Q?ipWZM2uXHxP+NAv67reWm4gPvLZ/RQCgG192gFEg5RFJl76XMrb8MYTPfp?=
 =?iso-8859-1?Q?vDe4qOsWqk4F1XeYj7zVHe9F4JkyNTd4lpTJ0fDC//2sCnoZqcwOZE7O+q?=
 =?iso-8859-1?Q?TqqeH27qe5GKvIRnmwXaBgmIdOjPq3JxnAWTHv6P5u3RFi2o1HjJvIN0rK?=
 =?iso-8859-1?Q?coo3/Ft8roBfHry9D0AKcdwAyjXhAQZ+WOmQkyj8+YqXjQ0ocOP9BrMPvh?=
 =?iso-8859-1?Q?QrewTqB125JDEPj7MYTO8d9G0N5wmpCs5rwpWc361yYKwSfz+Bxjg3ncSw?=
 =?iso-8859-1?Q?2/SfFkdyWvvCy/Cwkah+VUCcuWiu7iVPEvZZ9a6k24PGLTrfRL2UaBLM51?=
 =?iso-8859-1?Q?H6UJba/GAH1b1KHAA9AVzpjvg+4kPE3Us/37+S60e8GpkbGlWuiNsq3cdm?=
 =?iso-8859-1?Q?x32mmJAtsVVjEx+TfYPZ1x9iR1qtbcVlXxRA2rkuvv9HA8nrLsfO25Zm7J?=
 =?iso-8859-1?Q?6nsVobUG/Xdir8+pvhjbSkfZvFczpWzRu8lwtoArKswF8xaSWC9TM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A7525115D3DC3D4F9B61BD52405CCA6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11150
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	992630af-7059-47bf-7461-08dcb2befa83
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?VTW0t7YOp312SRDuIUdeJUWhGCdNRRGJi/eRhsKENTBhFrmRNbzKn8Kzxd?=
 =?iso-8859-1?Q?a/KBvEuBU4Ovg3NZvn0cRY5W9107CFx3LUhR83D/xa/5jlYsKsFPxofMZ0?=
 =?iso-8859-1?Q?sd9cXRDtm6WSMQ3T+XoHlEE8waEF/fl863lbF1+xFHLpYww0iUJKt2+j5+?=
 =?iso-8859-1?Q?B4UDAhtnpBG72X4BT9/CO/UwiLy/SP3ExvG90X775EyNpMQ7NkywRMw0gh?=
 =?iso-8859-1?Q?Z9fxoNXoAGQGFuw6QlJLyoBRbYecY0NBddvFJOtIVsCibdEncUFeGlbLvc?=
 =?iso-8859-1?Q?N/MbsWqFy07OmCAbFn0a4lHfWVtGWqjFD4HGkWuoxZ1TaCllcm7rLFDR0i?=
 =?iso-8859-1?Q?GfsEi1kdZllSf4eujsjrwIQa5cIvCKHwixiP/sKNV+tOSafkDyX5GyvAyA?=
 =?iso-8859-1?Q?AeN9usNXjQQMhbzjzUtVEd3F07lC9H3QrTKwdH8iemDhShbNXo7J1/Rfgk?=
 =?iso-8859-1?Q?Xlbq7adw5MIOo1LgpvNBzmuzHsGeBjcF9xdnyBC/Rcb4w9qoSClW/wHuRl?=
 =?iso-8859-1?Q?KTL4i5CZEJ9N5d87tZQ74LQg8dikB/ZXEtW+92VTzVB/B/aPP+vGNTjrTh?=
 =?iso-8859-1?Q?tgu/l17rmJwI8BDPuVqJ5O8BuvzjP5q44IxOEwVnQCObpJ3CiStv+T3yts?=
 =?iso-8859-1?Q?51WKCFD3dSsekaKY0/GSUpzg3n5t7sUj15qr8DJy736KlL7/AMbtQlcz/b?=
 =?iso-8859-1?Q?/+RWMSkIAZYalXQWJDmZ2RC5R8Y5GQ05lhzEEDvlUm2JqQJFUSP7kFOa59?=
 =?iso-8859-1?Q?w/Q+3wqi3Z94U0eendOTU8SPTg0WsvADY5MhKF1NMGgljkSeiaIQWorwvA?=
 =?iso-8859-1?Q?4wXr7Q/DuwRDceu6xs0zK8DJs7xW+9brcaJNHRcLFBv1YT/+OlGqhiGtCX?=
 =?iso-8859-1?Q?uOlk8FLbTOwkE8AiYAcRnBgC/5r+b+m9xhIoQsPIt+MMl+f57V+fLGzGEe?=
 =?iso-8859-1?Q?Wlu2znLOIiboBllyaCNR5ku1idvub8AE27Ej5TZKOu9w1zPEHkfOR8Zm+3?=
 =?iso-8859-1?Q?HKoahewY3EZWdeHe4tDzai5tEnJmrdcU+oX4hPTZL3Nn3A9vaWrTAMEQCP?=
 =?iso-8859-1?Q?d3Bygrmq0AM9SJpZx+awwZHWhjyTaZuppH1XI7L1+0SuIYBM1iAUo56MC3?=
 =?iso-8859-1?Q?+StDPV6cplNnpuVCr+qLT9HfZ5XfPrf86feIIZsjyWbS0ek/0DK2m3S8Az?=
 =?iso-8859-1?Q?k2Ebz1dR4IVhKWWnyjAQwGDqqEsaHk2/mv206e+CEpmgJqA8n4uw/tJFsU?=
 =?iso-8859-1?Q?Alx7ZEZvLcWEJudxDCAAykl8cIo5fg9QoYOcOK6tWvVMpm6EHalr9uiT39?=
 =?iso-8859-1?Q?RZG0YaIHQbvc1ZdpenHy+QH/apK+P/xZQ47bnO/jsUC7f80J5le4/CPOxe?=
 =?iso-8859-1?Q?Zm/kYCu+YZ+7KQKDn+E2KHhth6DkF0G+cYXhXHPhSiUwDUxsSXm2SyB3BK?=
 =?iso-8859-1?Q?IGDt2u6XmFOwxmWOwp0isQQEa35YRE0vMOyX8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 06:47:38.9548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f16f0a0-77e6-45da-9391-08dcb2bf0013
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10988

Hi Stefano,

> On 1 Aug 2024, at 21:19, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> Add MISRA C rules 13.2 and 18.2 to rules.rst. Both rules have zero
> violations reported by Eclair but they have some cautions. We accept
> both rules and for now we'll enable scanning for them in Eclair but only
> violations will cause the Gitlab CI job to fail (cautions will not.)
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> Changes in v3:
> - improve notes
> Changes in v2:
> - clarify that new code is expected to follow the rule
> ---
> docs/misra/rules.rst | 20 ++++++++++++++++++++
> 1 file changed, 20 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 7b366edb07..e99cb81089 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -462,6 +462,16 @@ maintainers if you want to suggest a change.
>      - Initializer lists shall not contain persistent side effects
>      -
>=20
> +   * - `Rule 13.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_13_02.c>`_
> +     - Required
> +     - The value of an expression and its persistent side-effects shall
> +       be the same under all permitted evaluation orders
> +     - Be aware that the static analysis tool Eclair might report
> +       several findings for Rule 13.2 of type "caution". These are
> +       instances where Eclair is unable to verify that the code is valid
> +       in regard to Rule 13.2. Caution reports might not be violations.
> +       The rule should be followed in any case in new code submitted.
> +
>    * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_13_06.c>`_
>      - Required
>      - The operand of the sizeof operator shall not contain any
> @@ -583,6 +593,16 @@ maintainers if you want to suggest a change.
>        submitting new patches please try to decrease the number of
>        violations when possible.
>=20
> +   * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_18_02.c>`_
> +     - Required
> +     - Subtraction between pointers shall only be applied to pointers
> +       that address elements of the same array
> +     - Be aware that the static analysis tool Eclair might report
> +       several findings for Rule 18.2 of type "caution". These are
> +       instances where Eclair is unable to verify that the code is valid
> +       in regard to Rule 18.2. Caution reports might not be violations.
> +       The rule should be followed in any case in new code submitted.
> +
>    * - `Rule 18.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_18_03.c>`_
>      - Required
>      - The relational operators > >=3D < and <=3D shall not be applied to=
 objects of pointer type except where they point into the same object
> --=20
> 2.25.1
>=20


