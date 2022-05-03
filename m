Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F147E518187
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 11:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319368.539606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlp4X-0000I6-PW; Tue, 03 May 2022 09:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319368.539606; Tue, 03 May 2022 09:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlp4X-0000FR-MH; Tue, 03 May 2022 09:43:57 +0000
Received: by outflank-mailman (input) for mailman id 319368;
 Tue, 03 May 2022 09:43:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlp4W-0000FL-Q3
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 09:43:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c63bdd2-cac5-11ec-a406-831a346695d4;
 Tue, 03 May 2022 11:43:55 +0200 (CEST)
Received: from AM5PR1001CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::18)
 by AS8PR08MB6456.eurprd08.prod.outlook.com (2603:10a6:20b:336::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Tue, 3 May
 2022 09:43:46 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::58) by AM5PR1001CA0005.outlook.office365.com
 (2603:10a6:206:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Tue, 3 May 2022 09:43:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 09:43:45 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Tue, 03 May 2022 09:43:45 +0000
Received: from cf8908aa108f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11505F69-3D3F-44A3-B80C-5B54BE42DBF5.1; 
 Tue, 03 May 2022 09:43:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf8908aa108f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 09:43:33 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DU0PR08MB8068.eurprd08.prod.outlook.com (2603:10a6:10:3eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 3 May
 2022 09:43:32 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 09:43:32 +0000
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
X-Inumbo-ID: 8c63bdd2-cac5-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nggAKUkkq/JO5/BRWLwQiFus3nSsBz2+QtjAZW3weO4Aa2bpepSn9dOUNOVFvvSeBSmWzVKzJmx63xhmz0ukf6/okd924kyfw56BCHAVXDuxJKHt+lMhF5D3Vfjn1zcouSq9cof+s5fflnVPH6lupt/wlSRB1zU60ANpbO58aVDVND5RZLEFJuea3AZSK1CN0dLB7ASVoZ+rGsU5EwPnmqBZ6mf62fgfZt37mpWvh9Jhd/ZBq7LCk8St3xhoS6o84WoT05JyeRClu4CIhjHF2FC4oPoHAYgN5coifl9qRMfnSYtqCFLLyJpIBXbx2ggLJ2F8eE7KNN04wtdPYW7kew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avYjy66VERgxoquFyw2Y647TrKpcYR/oVyJIR7tJSMM=;
 b=XvvE7D70i/wOo1uQSQ64vOYkPv3S4nV1gQRa+sE0hatAj0bNMHFiOKwBfV6Sv6oiTkH/mYXIMLEFd6660WqDsQqTu1OOdBWjJLVQmZhSV/1/CX3zPNd3zXmorx/4jKC0vMrl+3qRXdL/lI6OPbB4TEk1zC1cmHXq60VnKXPZMYyRgY9YIdgIlpYGdnfONT9BDnkyPTQL0IkcuP7wVPOgswtm62a/0zsWVSfgrtNCRRS9hN/k28dujcb5Ubl0FsIeKxnMp0rq56ChaOJMjRjTDlKWjKEshf0hRxxYNAj1e5XKqLTKRUnTNBwIKZnzp7AO05tH+pL3HvBUi5EMAAWIcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avYjy66VERgxoquFyw2Y647TrKpcYR/oVyJIR7tJSMM=;
 b=kvIYYOKba4Ca+81iwubtK0JFxfyV9OW0k/BZ83bv9tFGQnD7xDG6AImxZgHwqNLUFYNLsduWXRpx41LXgmDnhsldEvvrLkFAN4Ti8/tzC3wAKAgON3dzakSR2XFOuohV6e1KaHUO5gFTbTHJvQNnlq8u1l0AWYF1HtTN2lYm4kc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7781d181c44c001
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHTzNU+sr9mLOTsqGIXNc/I6doycfgXT5CyMnjxL5+LA0FTQ56DcFfiUHC7gvWqqQT8QCdyJkexKoG3Rt7zTGi34N8DxPyG7z56dob3czOXLsZSScKSMzFh+bA4Hs/cvM7ExveJTICB+mtRMCU5yzQ0XrFiVA9oJzSP/3mX9YQlI7Sx1tCTPLytqaaWdI2RjS513Uu575zG175xM3UDzS4HPO5UqYj/1B77dy+iWekVSCvh32UFHruN96xUmTWcISnchIE7IjLGVr8MIshHHt2kQ5XVgwWHjtmr2tnXzmY11xWQ9ChJNtJbboTlosSiC2xxRgF5dzqqQIhvLKYlnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avYjy66VERgxoquFyw2Y647TrKpcYR/oVyJIR7tJSMM=;
 b=YsXyo13sHtcwsR2QsyEVtPve4E5/ivAcvPtQw5myr0ICzG7VAedRK0MhVjAWj0iLiD4x6o03tz26O9rPe0Wh/rmnuqF8cinlA/kHeQ9J9hWnSGJFJdcPZ3kNxPiufeDWdouWUmxtzHSHzeTrpg32Mz3b/1vt21cI9h8Xn+dE9e4J6ZfF3XNF7hAGziloaNlbL/d64bwLi+mzwaQLYXjIciQfG4BWZpzh3Lv1SqJvRNsAdKQ08Y08DYVpWAEvXttfE8Th6d+I6zEBYhfQTeEK/HkToeQWtOoOnEkJ//B8mPJ+/UHOiYnWSgwcja84Driu3kHKJZUrS61rrEYxwX3rIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avYjy66VERgxoquFyw2Y647TrKpcYR/oVyJIR7tJSMM=;
 b=kvIYYOKba4Ca+81iwubtK0JFxfyV9OW0k/BZ83bv9tFGQnD7xDG6AImxZgHwqNLUFYNLsduWXRpx41LXgmDnhsldEvvrLkFAN4Ti8/tzC3wAKAgON3dzakSR2XFOuohV6e1KaHUO5gFTbTHJvQNnlq8u1l0AWYF1HtTN2lYm4kc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Jason Andryuk <jandryuk@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, Scott Davis
	<scott.davis@starlab.io>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v5 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Topic: [PATCH v5 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Index: AQHYXijv9StER8938kifKUVqRlYIt60LmLoAgAABtwCAAAEnAIABTJWA
Date: Tue, 3 May 2022 09:43:31 +0000
Message-ID: <D7CF00DB-F6E1-4B81-9597-13CFAB6102B0@arm.com>
References: <20220502133027.920-1-dpsmith@apertussolutions.com>
 <20220502133027.920-2-dpsmith@apertussolutions.com>
 <CAKf6xptU7VxGzaHe=jVc0O2fbZfQi1Rmf0hDsJzOB-9k7=4W-Q@mail.gmail.com>
 <7db6b050-7ace-406f-550b-d407c57cfa59@apertussolutions.com>
 <15634549-bde3-873b-862c-37ebb891ba0e@apertussolutions.com>
In-Reply-To: <15634549-bde3-873b-862c-37ebb891ba0e@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1fea1d51-17dc-4323-b790-08da2ce96ad5
x-ms-traffictypediagnostic:
	DU0PR08MB8068:EE_|VE1EUR03FT059:EE_|AS8PR08MB6456:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6456F1290E85CBB6698B2C66E4C09@AS8PR08MB6456.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IEJNjgUxcPRxCPDJbrCAaN45yrOJwBIHeAoWereQjk+aTduIJxqwHnwo+ywyA61c5AVpKYzJkGvcJiWKaLcARE1zHOTool5AXgss1G5Q8XoTa0bAOK3Y3hv+GGolcKdqEP1ZgjV3nFqhiKiLY8IXJdm/2ubYa0F3knyZMZSrFU9GFq7EcInBwVJqH3u+VGFtVI2DvnDryfrIEb51+ALg2Xy0Fyb7ZEW+YL4apnKa4cD4c8yi3fHT1y0x8lKx3ssi0UX/4oVen+2Nl/SGDCC6pROFXRHjCPNdqyfbZ2USKVDPwpoSunLn47fsKBp+QM07zCOqp8gTxjkETu+6wsMj27U84/KFEO7T6JNMK7bGyekEjBkJlcSEdRlifWNGPZWwTDZPRMgggL0C9rrZPvCWnLASmW3TdCUE/RfIB3j1GWz77f/PWpXWpON4YXpeLvpMnVYvc3U8X8R9nkpUcPMAHqovUqjjbTxkvl1CRrH7f0csWX7Yme1TGpT5f3h+GWj3Us4M8wEothXKAJ/encJ7Qla8j3gksf4TKSM+R29WBtoG1OrHsTT2LTpuN42IGplcEkPjEWtWU+DKQYITEkVF7DbEbWTCvi0uXLALMXdo7Rk9ZEdfJxtn5GR7+W6xv8U5i8w1aDf8hWYDAJ1UiqBTj7r8CXe+w/iXZ8q4/i+Hp/hG0jOt+3T6nbzrRbtF9QLaOxh1WrDFliLYnj52QZPjXLyx2Dv61EUaKIcG4gpfVtc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(26005)(6512007)(316002)(122000001)(36756003)(6916009)(54906003)(38100700002)(186003)(4744005)(38070700005)(66476007)(66556008)(66946007)(66446008)(64756008)(83380400001)(71200400001)(76116006)(4326008)(8676002)(86362001)(7416002)(6486002)(2616005)(33656002)(508600001)(5660300002)(8936002)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92A22686A659943AE480A4926CC32E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8068
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05ad662b-3b5f-40fb-36e1-08da2ce962a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BFhwEXfG1DKIybSzXS1GIrGk0AKXrFM5sDhO9OgXGy5myt6UuxR6oGS9rw5v7j54vZEo9445rgjXc1npvf6A1Y0VhARJMZZeHxoNXTpu4aMsNy4e0Dg+RMaq6V+ks1e6DfL73MtfMOGcwFAHMg4iVPwt1n9wPuHSbaWNPd8Np6MUCCO6CLjIdQqJN7Buastk+bO8OpS/LjP3mid9BxYpNnUrIQJ/Q/6wG6NbtHFEiB07YFKuwlRHseNyOaJ87t/7LJPIZZshU1ffZf25hnkHOwzwc3ZAQBnpJnWzWumAO/7VorZXV9lj4SujT5FvY8cXUkbGyKwECDCDaMo5NE7aojBZFaqpOFdufhu/QYJGDDxv6jyyF5pcI0QDBxuIiDWfHcVVsVArTC9SG1K8ZWOD3YxKJeSoU2Q2qdhbdgFQ8Vz+0LP7q4N0CYGqWvPTeK/zz7jinopushoPSawQt49RhZUdRc7J30qSurzQUW8vZzcQvsBwsZ8FEs89k0Lkg5nVuayO8DE+7pe0lWGcxI00FdMmNsX9jVL6YHlZL7GDaqbdCFKsrZlA7I3fcEOoGjzXh9N6cjUEikURiDu2IRtWz9JkGdhm7wRSBR2GebqMbJqAHdzWmmp7OXbHLzFHPBD1WC4PF21N7P3vfuXmLZZK6i3ztkXgPvH+IXimsvCTtXmdYT0TA7zhO8PZbjcONCGS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(2616005)(6512007)(186003)(81166007)(26005)(6506007)(336012)(40460700003)(36860700001)(356005)(83380400001)(316002)(2906002)(86362001)(54906003)(82310400005)(33656002)(53546011)(8676002)(4326008)(6862004)(70206006)(5660300002)(8936002)(508600001)(70586007)(36756003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:43:45.6631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fea1d51-17dc-4323-b790-08da2ce96ad5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6456

DQoNCj4gT24gMiBNYXkgMjAyMiwgYXQgMTQ6NTMsIERhbmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBh
cGVydHVzc29sdXRpb25zLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiA1LzIvMjIgMDk6NDksIERhbmll
bCBQLiBTbWl0aCB3cm90ZToNCj4+IE9uIDUvMi8yMiAwOTo0MiwgSmFzb24gQW5kcnl1ayB3cm90
ZToNCj4+PiBPbiBNb24sIE1heSAyLCAyMDIyIGF0IDk6MzEgQU0gRGFuaWVsIFAuIFNtaXRoDQo+
Pj4gPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+IHdyb3RlOg0KPj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPj4+PiBpbmRl
eCBkNWQwNzkyZWQ0Li5iOTA1NzIyMmQ2IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
c2V0dXAuYw0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPj4+PiBAQCAtMTA0OCw2
ICsxMDQ4LDEwIEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5
c19vZmZzZXQsDQo+Pj4+ICAgICAvKiBIaWRlIFVBUlQgZnJvbSBET00wIGlmIHdlJ3JlIHVzaW5n
IGl0ICovDQo+Pj4+ICAgICBzZXJpYWxfZW5kYm9vdCgpOw0KPj4+PiANCj4+Pj4gKyAgICBpZiAo
IChyYyA9IHhzbV9zZXRfc3lzdGVtX2FjdGl2ZSgpKSAhPSAwICkNCj4+Pj4gKyAgICAgICAgcGFu
aWMoInhzbShlcnI9JWQpOiAiDQo+Pj4+ICsgICAgICAgICAgICAgICJ1bmFibGUgdG8gc2V0IGh5
cGVydmlzb3IgdG8gU1lTVEVNX0FDVElWRSBwcml2aWxlZ2VcbiIsIGVycik7DQo+Pj4gDQo+Pj4g
WW91IHdhbnQgdG8gcHJpbnQgcmMgaW4gdGhpcyBtZXNzYWdlLg0KPj4gDQo+PiBUaGFua3MsIGJ1
dCBub3cgSSB3YW50IHRvIGZpZ3VyZSBvdXQgaG93IHRoYXQgY29tcGlsZQ0KPiANCj4gQWgsIGFy
bSB3aGljaCBJIGRvIG5vdCBoYXZlIGEgYnVpbGQgZW52IHRvIGRvIGJ1aWxkIHRlc3RzLg0KDQpJ
4oCZdmUgYnVpbHQgdGhpcyBwYXRjaCBvbiBhcm0gKGNoYW5naW5nIGVyciB0byByYyksIGV2ZXJ5
dGhpbmcgbG9va3MgZmluZSwgc28gd2l0aCB0aGF0DQphZGRyZXNzZWQ6DQoNClJldmlld2VkLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0KDQo+IA0KPiB2L3Is
DQo+IGRwcw0KPiANCj4gDQoNCg==

