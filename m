Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BF25749B9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 11:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367197.598260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvZ7-0002T5-Ma; Thu, 14 Jul 2022 09:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367197.598260; Thu, 14 Jul 2022 09:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvZ7-0002Q3-J3; Thu, 14 Jul 2022 09:55:25 +0000
Received: by outflank-mailman (input) for mailman id 367197;
 Thu, 14 Jul 2022 09:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZjPX=XT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBvZ6-0002Px-Oo
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 09:55:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13c8e303-035b-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 11:55:23 +0200 (CEST)
Received: from FR3P281CA0126.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::16)
 by DBBPR08MB4491.eurprd08.prod.outlook.com (2603:10a6:10:d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 09:55:20 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::9d) by FR3P281CA0126.outlook.office365.com
 (2603:10a6:d10:94::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.5 via Frontend
 Transport; Thu, 14 Jul 2022 09:55:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 09:55:19 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Thu, 14 Jul 2022 09:55:19 +0000
Received: from c09948a20837.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C7ECF1EB-692B-4A89-8B91-5787F25BD70E.1; 
 Thu, 14 Jul 2022 09:55:13 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c09948a20837.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 09:55:13 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU2PR08MB7328.eurprd08.prod.outlook.com (2603:10a6:10:2e7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Thu, 14 Jul
 2022 09:55:11 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 09:55:11 +0000
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
X-Inumbo-ID: 13c8e303-035b-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Wr54NL1bo/QQrDKtS+0QZnGWTYb/4Oc96SqXJpXupY0uw2vZKlFlBwFTTULzKSc5Pas17k6/LrW+hFKKXB0lZuc5Q7Ls/SdQeQn073FmJP4qQ678fDcWF+cWz+yY7BjNb5CFi7KsoHZAQxOBp1UvxSvOOVMautY+2qASX7STk60btQOfgpayKvR4YH7Fa1QqumORTqIjm0vTZzY+gl0dE4sak67pn8TcBpAIZD6ih64BYECPGOopnx0md5UcWmXTLRlOif12+v4N+AUDkQBT81SlNYrje6jFuAujM5yD1pkAlr9OEewjJowi5Stfq+ePsPVKxv1nwOJxH/jvebYK1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhelHElerS/PLSCl+hS++8jQdHm5dviKAPMHRkrLOVA=;
 b=GIuQNzkbt9w2jH5SRL8qQdr5OcbIqbIiuih8PffehIys7eYGDZeHIbOXJv5tofvKDq/xFDjMkDCxABUn+lv3McYAcFLLWYKCdzhqduYlg6pXCNF0PbDwoZmwDk8REObJ4GBK7M73fPI0ANyrXxkrGB3UUOM35FfNC6IyIPGaQtvFlxgfdLgGWVawWGj2/CpSf473036Ck+YBjbNbcDwolQB5aiBnphYMYKQUpLUUT/Smh6mkXr+dXeUTpHWcjN2QFv8GUdwQ9D7ocl2FnVmQjXlhv4RdoZC/V8JgVzkGx6tG77Tcq9EZyLjxb1JSUupl5nDnrlRcU2SOcaFOnhPI2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhelHElerS/PLSCl+hS++8jQdHm5dviKAPMHRkrLOVA=;
 b=u764LojPr7BeYreyb6z9DsXv8MUaAJ+QwoieRA/ov0cYkc9sYM4e4lsTrQBEFqsfVJfw1v6MPgVMoZwOgc4TirBZ1A+1k5RS5D92/HUWJolVDZZk1EyNXR6sZFRw92buANr5f8x4Pjjv8WlNhbIbWqY1x9Uh8FLtpZU07wNLh+g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJWe6Xv0ZuRBE21P78pwHaP4pEq7EZYXB6lFUpFrztLSuBXlkWSr4xKLKQ6NXVCQXibsOKd19d4THyp6rjc65xpXXkjhKtI8Cphvv9GOYZHtZOt9i9RDzpiDUFPM27Uvg44LCxL6uBdBWtI+h4duaCXDU9Je7W1i1PL5B9/Qpwbp4Wgf3/adUw5Ao8a/EYtq44kaM0NZwefjzWIVh5jkotC4Qvfi86FPGVjhiHhkawiwawEV+RpClhXwwPuccaPwjLwGRaYmsgWuCo0imafr6wQuMTjtFwePAsADlMfDBPJww6kqZTlfB8vpgnCb41F7JIN9kao6Op7fEeyjkZF/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhelHElerS/PLSCl+hS++8jQdHm5dviKAPMHRkrLOVA=;
 b=YKolNt4AkNRCLY7oEmzKBnPvKw3fkGat2EIyWrzhk/I7WHeEBP8nAZSh1fFk9j6LMUNfwu74QPNVVtXihGLH9GqV6q04stKbA59q0ec21/0kqsI5xHjLTvgieLziXqY1rfvSli5BY1RyRowaX+KO/oM9UjxLhOhQmVDN/fcbfLxQN9wk0C958qYQI3xyMX7fOrys7MVEifi4HyWZhkghejbE2l+vy3hMgIXnD2ZJbREHrWWqN1cyL4y3m9q5SERfDvOaLcMOIFLCTDnP4sEryU6VqvoqJF9HRzWnftr9blKTlRYZStXT2yqoBfeuxYrJntsB51uUNVVCBETKPeAA+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhelHElerS/PLSCl+hS++8jQdHm5dviKAPMHRkrLOVA=;
 b=u764LojPr7BeYreyb6z9DsXv8MUaAJ+QwoieRA/ov0cYkc9sYM4e4lsTrQBEFqsfVJfw1v6MPgVMoZwOgc4TirBZ1A+1k5RS5D92/HUWJolVDZZk1EyNXR6sZFRw92buANr5f8x4Pjjv8WlNhbIbWqY1x9Uh8FLtpZU07wNLh+g=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Topic: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Index: AQHYktrASbKlS5xyGUK27wSgSLVuo616tdwAgALfc0CAAA5jAIAABItg
Date: Thu, 14 Jul 2022 09:55:11 +0000
Message-ID:
 <PAXPR08MB7420F531ECCE4106BE8227D49E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
 <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
 <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
In-Reply-To: <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 69964E85206DE04689CD23529DDE7A60.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 77c9262e-538e-4cb6-6ad8-08da657ef665
x-ms-traffictypediagnostic:
	DU2PR08MB7328:EE_|VE1EUR03FT022:EE_|DBBPR08MB4491:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 REagUPrtZ/0Q6+hHBF4bORLyInrZQZ9+q1alF2vO7QyOgklhgwa+0MVBvxmJkenrzmWkKr/f2fCLfewIK5OXnD4QQzhZRIcqg3kcPwSaX6czx7AZyqr3SBs+gZpu/SLVhZhu1U2rK1gssGJBfRH3P+Oxxkkio1ddiW6lSgVETjrz+M+unOUTmDU0LbYGF5L770whMCc+557aME2/Y1oonilb4bCE2uBW74nVKFoWA3LVVFkrrGBEB+M6PsG80RYJC+ATW3H0X5svZ9RvyZXBU3+6S0BYvZMvUYGAL4c/DuNyr/6aG0qTJBQyru3zRaFhT3qU9RyCNEHftRM5dTh/DCCbGjvAguQr/pVysXbqEDOCwah41vtGKxBwFQEffv6P0edKRhHUDbJcPdL6JXLwSYUv4uWvC1ZJV/lLaCCsFMqjp48SYGxr1ntxYiDddWTzEL47nP/K3nHbXf+HHDRaXePyK2rCztEhc5/yy3BaDViBELoAargWeBzDD/AZs9M+BNR+vV/Jy+BD+q1WnvnzAvEpZjSFT8H5nfR6nek+Tetg2M78YGVgdxPEyOdchnhot2zOM7dt39f2FQkR5poR5TFq5wk6kCRhhgEWIM5oJ6uptQKFSMznQY5HiXR92iLuakJTCgbvxCWNdpphGf0MJ3Y7+82Knfiditx6AR8xdwc7IqCaW3yUO3YGG6OttZuo1gxxXvTed3w4lEWwZVLhBInavKOauLK7Qgc1uL6T6eaxcOZ0JrKOI+v5rldTsRFTf5cJA/hYQkTgLaW/wG25bIXa/+gdFBPCh3qvYr+um8Xm8LwQBrN8KqwEuE+yrgvf
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(5660300002)(316002)(6916009)(52536014)(2906002)(9686003)(54906003)(38070700005)(122000001)(6506007)(478600001)(41300700001)(33656002)(26005)(186003)(66556008)(76116006)(4326008)(71200400001)(64756008)(66446008)(66946007)(8676002)(55016003)(83380400001)(38100700002)(7696005)(8936002)(86362001)(66476007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b4fd5db9-0433-4717-341a-08da657ef13a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5tOI6LzRi7eoMP/rVCut9cHV2bxdsbxkxol07RNL5ZOZi8ldXnOUxNv6GVHCpEoNCOAAPLcwzv2ReuJpkO6SsTP6LlGprD1EVja7CPilDwfqfLPY4j6/jtlfy+ksvYFhAZQexNgqibHGaGJXciTEQfno4bKEPoNqchoxaXOQ6HiC5wHuv5HRTsXRpNfgfWwkHGZzIsksX6G/mvnpZQjmL8otWr7d7Btb9UlZmde5qwTgdmUBIkFdz7A7kuoHgtu+scXaHH+Fj6hTJwtvHarRcjoQyKKPh3TBx0kQGep/5+XHZrTnh3rrRnlPVlSQhbA9u4y1CMf2ajIW9MLmva5I1YMprOBNG+BTF1ou3+hK6yjA1IxGg+eRNmlU0MlBotkB6dTLtO2h2OAFXDVrBO0TTcyLvEPdabQqlqI1t8IM7os+vsIS+VEkEsJ/GH1k3+MiMSn+He3MrvByJfpnhJivBTAcXydZQc87qnJvPsSFSKOhIrEZbZFfycWpuPLO3yjD6lwIU8c71/GKqRtnX6tOAv2a0YooNe0qQzaEvfSe5BQrVaWUDa6tOTm4Y9NzS3CZmorivOlhhYVZlZUIYYze1Xfj+M3mRUp+sLxqqwEYAIW5Xj1cE2LDEBZ2u6mzBRdaG6CbQ4Mv2ksPedIuIUOkAHsF14jveKZHIdbJfufU9UzR/ESEvQ0id2bzkl3YPJRZ5xy4xGlzUS/W7GQjgtYBs0sVLck7iFt2IN7PQ6Sltf3r+BH/15NKWQc5T1/91ndOEa+HsuFmMU8mcvH/NeIf2BNF3MVnsMjV2wgNT8rFe5QMo6jCQPOVtMXPkeQFrJBj
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(40470700004)(36840700001)(82740400003)(41300700001)(9686003)(5660300002)(26005)(70206006)(70586007)(356005)(2906002)(7696005)(478600001)(8936002)(82310400005)(86362001)(6506007)(52536014)(40460700003)(47076005)(336012)(83380400001)(36860700001)(186003)(6862004)(54906003)(55016003)(316002)(40480700001)(4326008)(8676002)(33656002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:55:19.9379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c9262e-538e-4cb6-6ad8-08da657ef665
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4491

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+DQo+ID4NCj4gPiBT
b3JyeSBmb3IgcmVwbHlpbmcgbGF0ZXIsIEkgcGFpZCBzb21ldGltZSB0byBjaGVjayB0aGUgY29k
ZSBhZ2FpbiwNCj4gPiBhbmQgZHJldyBhIHRhYmxlIGxpa2UgYmVsb3csIEkgaWdub3JlIHR3byBj
b2x1bW5zIHdoZW4gbnVtYV9vZmY9dHJ1ZQ0KPiA+IGFuZCBhY3BpX251bWE9MS8tMS4gQmVjYXVz
ZSB3aGVuIG51bWFfb2ZmID0gdHJ1ZSwgQUNQSSBzcmF0IHRhYmxlDQo+ID4gd2lsbCBub3QgYmUg
cGFyc2VkOg0KPiANCj4gV2hpbGUgSSBhZ3JlZSB3aXRoIHRoaXMgZmFjdCwgdGhlIHByb2JsZW0g
aXMgdGhhdCB0aGVyZSBhcmUgdHdvDQo+IGluZGVwZW5kZW50IGNvbW1hbmQgbGluZSBvcHRpb25z
IGRyaXZpbmcgdGhlIHRoZW4gc2luZ2xlIHZhcmlhYmxlLg0KPiBJT1cgbnVtYV9vZmYgYW5kIGFj
cGlfbnVtYSBib3RoIHR1cm5lZCBvbiBtYXkgc3RpbGwgbmVlZCBhDQo+IHJlcHJlc2VudGF0aW9u
LiBJbiBmYWN0IEknbSBub3QgY29udmluY2VkIHdlIGNhbiBlbGltaW5hdGUgdGhlDQo+IG9yaWdp
bmFsIHZhcmlhYmxlcy4gV2hhdCB3ZSBvdWdodCB0byBiZSBhYmxlIHRvIGRvIGlzIGNvbnNvbGlk
YXRlDQo+IHRoZWlyIHZhbHVlcyBpbnRvIHRoZSBvbmUgc2luZ2xlIG5ldyB2YXJpYWJsZSB5b3Ug
YWRkLCBiZWZvcmUNCj4gZXZlciBldmFsdWF0aW5nIGFueXRoaW5nLiBfVGhlbl8gSSB0aGluayBJ
IGFncmVlIHdpdGggdGhlIHRhYmxlLg0KPiANCj4gSmFuDQo+IA0KPiA+ICstLS0tLS0tLS0tLSst
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0t
LQ0KPiAtLSsNCj4gPiB8IG9yaWdpbmFsICB8ICBjb2wxICAgfCAgY29sMiAgICAgICAgIHwgIGNv
bDMgICAgIHwgIGNvbDQgICAgICB8ICBjb2w1DQo+IHwNCj4gPiArLS0tLS0tLS0tLS0rLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0NCj4g
LS0rDQo+ID4gfG51bWFfb2ZmICAgfHRydWUgICAgIHxmYWxzZSAgICAgICAgICB8ZmFsc2UgICAg
ICB8ZmFsc2UgICAgICAgfGZhbHNlDQo+IHwNCj4gPiB8YWNwaV9udW1hICB8MCAgICAgICAgfDAg
ICAgICAgICAgICAgIHwxICAgICAgICAgIHwtMSAgICAgICAgICB8eA0KPiB8DQo+ID4gfG51bWFf
ZmFrZSAgfHggICAgICAgIHx4ICAgICAgICAgICAgICB8eCAgICAgICAgICB8eA0KPiB8ZmFrZV9u
b2Rlc3wNCj4gPiB8ZW51bSBzdGF0ZSB8bnVtYV9vZmYgfG51bWFfZndfbm9kYXRhIHxudW1hX2Z3
X29rIHxudW1hX2Z3X2JhZCB8bnVtYV9lbXUNCj4gfA0KPiA+ICstLS0tLS0tLS0tLSstLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLQ0KPiAt
LSsNCj4gPg0KDQpIb3cgYWJvdXQgdXBkYXRlIHRoZSB0YWJsZSBsaWtlIHRoaXM6DQorLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLSsNCnwgIG9yaWdpbmFsICB8ICAgICAgICAgIHwgICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgfA0KKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rDQp8IG51bWFfb2ZmICAg
fCB0cnVlICAgICB8IHRydWUgICAgICAgICAgIHwgdHJ1ZSAgICAgICAgICAgfCB0cnVlICAgICAg
IHwNCnwgYWNwaV9udW1hICB8IDAgICAgICAgIHwgMSAgICAgICAgICAgICAgfCAtMSAgICAgICAg
ICAgICB8IHggICAgICAgICAgfA0KfCBudW1hX2Zha2UgIHwgeCAgICAgICAgfCB4ICAgICAgICAg
ICAgICB8IHggICAgICAgICAgICAgIHwgZmFrZV9ub2RlcyB8DQp8IGVudW0gc3RhdGUgfCBudW1h
X29mZiB8IG51bWFfb2ZmICAgICAgIHwgbnVtYV9vZmYgICAgICAgfCBudW1hX29mZiAgIHwNCist
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tKw0KDQorLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKw0KfCAgb3JpZ2luYWwgIHwgICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgIHwgICAgICAgICAgICAgfCAgICAgICAgICAgIHwNCistLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0rDQp8IG51bWFfb2ZmICAgfCBmYWxzZSAgICAgICAgICB8IGZhbHNlICAgICAgfCBmYWxz
ZSAgICAgICB8IGZhbHNlICAgICAgfA0KfCBhY3BpX251bWEgIHwgMCAgICAgICAgICAgICAgfCAx
ICAgICAgICAgIHwgLTEgICAgICAgICAgfCB4ICAgICAgICAgIHwNCnwgbnVtYV9mYWtlICB8IHgg
ICAgICAgICAgICAgIHwgeCAgICAgICAgICB8IHggICAgICAgICAgIHwgZmFrZV9ub2RlcyB8DQp8
IGVudW0gc3RhdGUgfCBudW1hX2Z3X25vZGF0YSB8IG51bWFfZndfb2sgfCBudW1hX2Z3X2JhZCB8
IG51bWFfZW11ICAgfA0KKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsNCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiA+
IE5vdGVzOg0KPiA+IFRoZSBmb2xsb3dpbmcgc2NlbmFyaW9zIHdpbGwgbWFrZSBhY3BpX251bWE9
MDoNCnNhbml0eSBjaGVjayBvciBoYXNoIGNvbXB1dGluZyBpbiBhY3BpX3NjYW5fbm9kZXMNCj4g
PiAgICBpcyBmYWlsZWQuDQoNCg==

