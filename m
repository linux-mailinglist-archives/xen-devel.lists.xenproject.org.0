Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEA75BA6C4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 08:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407809.650438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4n7-0005dp-VW; Fri, 16 Sep 2022 06:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407809.650438; Fri, 16 Sep 2022 06:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4n7-0005bj-SR; Fri, 16 Sep 2022 06:25:33 +0000
Received: by outflank-mailman (input) for mailman id 407809;
 Fri, 16 Sep 2022 06:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogj/=ZT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oZ4n5-0005bd-MP
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 06:25:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5be09d84-3588-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 08:25:29 +0200 (CEST)
Received: from AS9PR06CA0522.eurprd06.prod.outlook.com (2603:10a6:20b:49d::18)
 by PAWPR08MB9830.eurprd08.prod.outlook.com (2603:10a6:102:2e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 06:25:27 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49d:cafe::f9) by AS9PR06CA0522.outlook.office365.com
 (2603:10a6:20b:49d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16 via Frontend
 Transport; Fri, 16 Sep 2022 06:25:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 06:25:26 +0000
Received: ("Tessian outbound 8ec96648b960:v124");
 Fri, 16 Sep 2022 06:25:26 +0000
Received: from 5099fda9d754.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5969C74-BD07-4478-8ECA-3D00D3D863B0.1; 
 Fri, 16 Sep 2022 06:25:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5099fda9d754.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Sep 2022 06:25:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8719.eurprd08.prod.outlook.com (2603:10a6:20b:55f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 06:25:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::b46e:50dd:b6e2:5241]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::b46e:50dd:b6e2:5241%4]) with mapi id 15.20.5612.022; Fri, 16 Sep 2022
 06:25:19 +0000
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
X-Inumbo-ID: 5be09d84-3588-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EyoeosfIg5CpILnc2VwIYcgx1ftFZFQGeNLlkJz3Ac+wBzNPF7P2jrTfdDj3e+yId2Njdj0iDgvBOV1lOzgw2oTUfbkLLc2V7yr2rNbJ9wQk3QuoNCWQqPVLSKmoAk1BThtdozsg4aXbEDiZXt7Vz6OcgZkxgW/pm2UFf/DhMMBDmOLJhUetb08dw2GhY9cRWV3kV8HE2UcZav7XxlEDXDyIbiYxFEVogddNE6SMJWSw0hkSEIXvsjlmTsnq6agbhGp7sXrzgxmbag+W39qx/N1eeJWXGClFKej0zIglggpOyM0Eka/b5M6POERAYPgQyjDU0onE1TwP3oEc9+vfaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghEtXSDot+0Gco/sjcHbeEswmqJTiSTLEnigzNEwBqQ=;
 b=AH9cmxkYLrJEZkHiW9cBbxHZuZ/kMXsvxHt0kjIZ29N4+FWJNPb3c36+3L7N4xFtJ1dJV9W1XpYXfDt+l9lWcKmLmrru1P/3edu36FER9HDIW/A0gafhCNyOi70rP5Kx0svCzC3hlYlqHg7wfCsqO1v3KdYp4d6iawQw/5F/UaSabkJ7BtKdBirzwuYcAuJMHh2K1bWhUa1B3gNEF+1tKvTakD8rXd39rQBHNfdWKW39okKrglKGBqq8/x1VNt52HuToChF86YHghkMVfcBJG9Gd6rB/LG3/RSzDq6gRfPM3o47HP8lGE+WMh5whKqECtVRGiz4U1PawZM8jatEibA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghEtXSDot+0Gco/sjcHbeEswmqJTiSTLEnigzNEwBqQ=;
 b=XBfAfLkygR4xLxRDSeAZ27IocQIMyMXBfHrUg2/Jdw8oQMfRVonDDfs5DsrC+GgC6t/MYt+/BCVyT+HMu2XaAt3nVvYf+WkvRXUvgyKPRJlPYugRvsr4FTXc7QXajOapCgNQyrktwwi95Qw3SdMQzfU5JMLZMqMLcAw3+QVqs2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYNsh14KVjJKa12mTCy77bVoYmb2HlBMWdV/p4872ruquUewIfHC7DxjVSLUPNsiuXTiFohh+tyUCzJLy4AQx8Ya9nIJ/qRv40ypfmdO6YLjIyj7XFBffYfpge9gLA1Lom/Hhogia5j/sDs1BuY7IOGgSPfvwJq/PesLPCYPo/6ABjeF7I1xHMo6RqnBSc4FyjNtgyOR5xHFM02YqHIpM4pcboZryntlE23I3iCtWdcPDD8x2fbYW+wGyP8k6/yl5plVv/Uj0+PM+d6Dx/AUCpSAcyXdEVd+vTL19g9qMyfzYofJs8BB0aiuC+TxP6j33+30cwJhf6sFvvIW2hqjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghEtXSDot+0Gco/sjcHbeEswmqJTiSTLEnigzNEwBqQ=;
 b=kntMnRikMiIaSUpEoJhvPW0E6s5M6uurKGUqu7vfKEZNM0FgFf2a+BM937vqYj7FkQ7Wan8FJQwrnO9Lqg7BUvy1EJTBOqgCIXkkuYUqdabnOPQYodfCy/GkgV6IsQN5nJyemix89X8dk9xzU7bH665emoNdjQVsFGMBO2m9XCmojHJ00raBmiDKTlrNjqphGh5+TpdrTKOW0/8JC9FWks5ZfNpRv+E/KnxPLcRHSme8NGQbny9SvChLuWxct/8gpMyZkMktugLQqF0UOxj7yjWRSGRRZJMUtmbw1WWmEDfd8gTK0JZnVmUWdf4+xIlGLyCgx+MInG5heMm8N1B11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghEtXSDot+0Gco/sjcHbeEswmqJTiSTLEnigzNEwBqQ=;
 b=XBfAfLkygR4xLxRDSeAZ27IocQIMyMXBfHrUg2/Jdw8oQMfRVonDDfs5DsrC+GgC6t/MYt+/BCVyT+HMu2XaAt3nVvYf+WkvRXUvgyKPRJlPYugRvsr4FTXc7QXajOapCgNQyrktwwi95Qw3SdMQzfU5JMLZMqMLcAw3+QVqs2o=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jeff Kubascik
	<jeff.kubascik@dornerworks.com>, Nathan Studer
	<nathan.studer@dornerworks.com>, Robbie VanVossen
	<robert.vanvossen@dornerworks.com>, "xen-devel@dornerworks.com"
	<xen-devel@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] MAINTAINERS: change my email
Thread-Topic: [PATCH] MAINTAINERS: change my email
Thread-Index: AQHYyTnGoTPtdwiDy0Kyh6sCMW1eKa3hkyGAgAADTqA=
Date: Fri, 16 Sep 2022 06:25:19 +0000
Message-ID:
 <AS8PR08MB7991B0A3DE094881D7890A1892489@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
 <a83ac46b-3db8-7770-6f24-041de84a3392@suse.com>
In-Reply-To: <a83ac46b-3db8-7770-6f24-041de84a3392@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A730B994F02B1541BAC1D7C786FC6E9C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8719:EE_|VE1EUR03FT038:EE_|PAWPR08MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c17c22-f448-46a0-7703-08da97ac3ed4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bc0eBbtGtAtp5U7NJJXTIYSYAR9lAkduFwyjclhFBJrWDF9wztO9puHiNM46rFTKPO7NmiQS2hVASuhPnuwdJp1bBhIBKgXQukXZz86J85JkAWQ9kZ7dawF6MLVT66oEvaEcx+I6ObPU1lWp/YaS9N1eN5KVxHhjc92n2lWGSWF69KX7ZJ8DFNa3BVgRlK+VbKr9g5jbizYIEodYdEahuxbdm2sb+nYE14Nth7dyji0PkXfFi1dS9UaByhcUXMn0tLM3EmmMa+DFD/X2M8p6Bh63+FJVZjM28I+lDBHIZmoOkeBYXSTgIoOzLiXz5pq9TGOaJJt6xoCC59FwhsUfG3KoFmZDNrAq1HTT/XCdV49FfrlKqIVk8styVERYgLwYt+9Lju+Ho2qDN9KbeUJ3FLWx/aHu5ImqZcVq5wA1pvtOCKhxdG8U+DSKzqZAZEmWWC2i7z3X5Tn4DImzs5R10IweKoZyqYvMUfNbK0d/yFSJitTYxVKnBI3Lve396aYXKk5WX8rIUc4l1OGWaS7ublC6xgWlqWg/T0KlvCaVTag55+EceYpwEChn9/AzSEzG/ryMbLaDQXX+6cjUzUz0E/aEAif92JACF6X+44DtJloHwGym8qWl/8e5w6bLaneeBQ4jpBMThwBvNyBJyVUIqHzlSY9pbDINdvvXQX/2/SN7T0A3wWUCvZ4mOIr8eM9YPMY1pAR5H1EoVHiCemN8OD9ovad1pJBAwqQwhadRvEohsUzMgFlXCRxBeIbxcgJxs7cBdU/G94GwjGELNw60RA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199015)(316002)(8676002)(122000001)(38100700002)(54906003)(55016003)(5660300002)(38070700005)(7416002)(52536014)(76116006)(2906002)(33656002)(66446008)(86362001)(66476007)(66556008)(66946007)(8936002)(4326008)(64756008)(41300700001)(71200400001)(186003)(9686003)(478600001)(6506007)(53546011)(110136005)(26005)(7696005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8719
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2badfbb7-c3c5-4e34-c7b2-08da97ac3a69
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fB0jLXoT+7nle8dA2rZ0LQpzAxmuSgCirosWnW/I98rr30vz/9B/mhvFgCFG/T9YsIjqtCWdaW7Q0llq2ZnUWwkt3AtujP6eUQYwLRzlBmzl5k9S1QBJB4/CV1jrYV6bpn89DxVFpU8uGIbxVmcz1cyDknTXIGg7cHo5HNHWPOvsLUOJma70+/S2xr3CW7Vaxf6WGyk20lega8tblW7Xcyr5JaaOa9rc1d6y1bERi2PIb93Zy8b73LSSquRsGJCJgCA0ercDs19yZtKpVE/NDSejdtcUkmX7iWhzQiyDy8djEsJivWwKhGsP/fpn2I8lO38KNR6l10W5ze008dhsaLJT9W/XGkwLrUUH6D7PRpmrN3Wx42IHnwaph5iddOVpNb/M6fAH8g1br78D2kWJfCflcsmHXf8RjuhqBifKdo63vAqo6S9MXao1RtsFzcJO8rp2xlEAsAMK9b+WM7k+TZcHpsId98bHyBIb4p0ykP5gHMmHgzv51mrCGLFV4M06CVh4KS9wff3xCR/AFAdzJt6G7bKBLT5NowFWwyPtihujVp7hZitxXG7Mp+sgShWe2LFyTzU36ee88GwhEtgUvZWioWzDx71Q9ieGfEuqFI/cEVQ7KP6cs3HJobJe8cOJdNi6IitytPt/u+igyfni1g2dDwdb2JnUAOPplB8m8HXQRr16hd//F5nulMIOeNvZ1/jI2J4vH5QkdcktrRFdwxJRgSzL17M72iCQSm9hoOIqcsdhCzbTDB9jVVpDp3yd8vdTirqCqbkdsbjZA2xDrA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(336012)(186003)(83380400001)(478600001)(82310400005)(47076005)(110136005)(54906003)(26005)(316002)(33656002)(53546011)(9686003)(6506007)(7696005)(41300700001)(82740400003)(356005)(81166007)(40460700003)(36860700001)(86362001)(52536014)(8936002)(2906002)(5660300002)(4326008)(8676002)(40480700001)(55016003)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 06:25:26.9377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c17c22-f448-46a0-7703-08da97ac3ed4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9830

SGkgSmFuIGFuZCBTdGV3YXJ0LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gTUFJTlRBSU5FUlM6IGNoYW5nZSBteSBlbWFpbA0KPiANCj4gT24gMTUuMDkuMjAyMiAyMToz
MCwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0KPiA+IEkgYW0gZGVwYXJ0aW5nIERvcm5lcldv
cmtzLiBJIHdpbGwgc3RpbGwgYmUgd29ya2luZyB3aXRoIFhlbiBpbiBteSBuZXh0DQo+ID4gcm9s
ZSwgYW5kIEkgc3RpbGwgaGF2ZSBhbiBpbnRlcmVzdCBpbiBtYWludGFpbmluZyB0aGUgQVJJTkMg
NjUzDQo+ID4gc2NoZWR1bGVyLCBzbyBjaGFuZ2UgdG8gbXkgcGVyc29uYWwgZW1haWwgYWRkcmVz
cy4gQWxzbyBjaGFuZ2Ugc3RhdHVzIHRvDQo+ID4gTWFpbnRhaW5lZC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndv
cmtzLmNvbT4NCj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgfCA0ICsrLS0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+ID4gaW5kZXggZTEyYzQ5OWEyOC4u
ZjY3NGI1ZjdiYSAxMDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5U
QUlORVJTDQo+ID4gQEAgLTIyMSw4ICsyMjEsOCBAQCBGOgl4ZW4vaW5jbHVkZS94ZW4vYXJnby5o
DQo+ID4gIEY6CXhlbi9jb21tb24vYXJnby5jDQo+ID4NCj4gPiAgQVJJTkM2NTMgU0NIRURVTEVS
DQo+ID4gLU06CVN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndv
cmtzLmNvbT4NCj4gPiAtUzoJU3VwcG9ydGVkDQo+ID4gK006CVN0ZXdhcnQgSGlsZGVicmFuZCA8
c3Rld2FydEBzdGV3LmRrPg0KPiA+ICtTOglNYWludGFpbmVkDQo+ID4gIEw6CXhlbi1kZXZlbEBk
b3JuZXJ3b3Jrcy5jb20NCj4gPiAgRjoJeGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jDQo+ID4g
IEY6CXRvb2xzL2xpYnMvY3RybC94Y19hcmluYzY1My5jDQo+IA0KPiBJZiBpdCB3YXMganVzdCBm
b3IgdGhlIGVtYWlsIGNoYW5nZSwgSSB3b3VsZCBoYXZlIHNhaWQgaXQgY2FuIGdvIGluIHdpdGhv
dXQNCj4gcmVsZWFzZSBtYW5hZ2VyIGFwcHJvdmFsLiBCdXQgdGhlIHN1cHBvcnQgbGV2ZWwgY2hh
bmdlIEkgdGhpbmsgd2FudHMgYQ0KPiByZWxlYXNlIGFjayBhdCB0aGlzIHBvaW50Lg0KDQpJIGp1
c3QgY2hlY2tlZCB0aGUgc3VwcG9ydCBsZXZlbCBpbiB0aGUgZG9jLCB0aGUgZGlmZmVyZW5jZSBv
ZiB0aGVzZSB0d28NCnN1cHBvcnQgbGV2ZWwgaXM6DQoiU3VwcG9ydGVkOiAgIFNvbWVvbmUgaXMg
YWN0dWFsbHkgcGFpZCB0byBsb29rIGFmdGVyIHRoaXMuIg0KIk1haW50YWluZWQ6ICBTb21lb25l
IGFjdHVhbGx5IGxvb2tzIGFmdGVyIGl0LiINCg0KU28gdGhlIGNoYW5nZSBzZWVtcyBwbGF1c2li
bGUgdG8gbWUuIElmIGFueW9uZSBuZWVkIHRoZSByZWxlYXNlIGFjayB0YWc6DQpSZWxlYXNlLWFj
a2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywN
CkhlbnJ5DQoNCg==

