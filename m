Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18273518544
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 15:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319624.539912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsPt-0004Ur-R0; Tue, 03 May 2022 13:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319624.539912; Tue, 03 May 2022 13:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsPt-0004So-Nz; Tue, 03 May 2022 13:18:13 +0000
Received: by outflank-mailman (input) for mailman id 319624;
 Tue, 03 May 2022 13:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlsPs-0004Sf-K1
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 13:18:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ae0a841-cae3-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 15:18:11 +0200 (CEST)
Received: from DB6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::29) by
 PA4PR08MB7481.eurprd08.prod.outlook.com (2603:10a6:102:2a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 3 May
 2022 13:18:08 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::af) by DB6P191CA0019.outlook.office365.com
 (2603:10a6:6:28::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Tue, 3 May 2022 13:18:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 13:18:07 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Tue, 03 May 2022 13:18:07 +0000
Received: from d1dfe553eb4e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9AB94707-63BB-45DA-B34B-06D977A6F0A1.1; 
 Tue, 03 May 2022 13:17:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1dfe553eb4e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 13:17:56 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by VI1PR0801MB1758.eurprd08.prod.outlook.com (2603:10a6:800:53::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 13:17:54 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 13:17:54 +0000
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
X-Inumbo-ID: 7ae0a841-cae3-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FuobrphrFplM4uZya157kmdf9BRwf1xOWWw+BPbIugLEHncsCHNBEfL35W+DmN50bfpMFS1KUCdoPx2Pt+t+b5KsTI1w+USBqp+KSsY01K9WdpwNGqBkbCsmg7Z0s6Eu04zMminHOhVYW52ofLVHCTOeJI7t6UCsYB6HCL0R7jet7CahmS/xTgolg7Sajux1U21bMwLGmWJw202n1c+hZzWS+17c//8/GSa7ykC51ego+CRNWkC7Sv1PHQaxF2yyGWC6XBwqXWPry8GHf0I21bn+41o1PHlxG6Cmm3dEeu32yu3LV6k8jLjRpfc+Jqx+05MEdVv95Id5SA89MoZKKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB6UH105Pgd2TVvxfn8TNOxjI8TZycQoDY0DRRb3Ysw=;
 b=GiHK5k9ADypji67am1zxyOhCjeYN/KHVO6tjBUu5pkgCdc28qOXQ3SaLGEwdCtQyD4DvZjtYyPorh8Jzap/5ZiENrfN13qcUWmYkbbfocxc4ckt809YKTjBpEgRuiva/UVVRn2YTE0shuRDkjbYYErWqWnH1A/nWmsDnC0guLQIsmi0rjwiq4AFtgXgDpVI8eDfH3H6ZwJff5ifNILMLpFL39gJ1KXC6sYmrzlW9QcU22G13x120McZruQMGgNL0uF1M1Rr4y2DrJCT57XvO7htisd52jCf7ooQitL6+9FBWRdw39aNsB+lU3zKsD2j35aUKWae/duFiaqXUHOgOJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB6UH105Pgd2TVvxfn8TNOxjI8TZycQoDY0DRRb3Ysw=;
 b=t8i9kItwwcrUNH0JNYgeN6S7txh+b/Oh+4yHLmGAK8Lu19JfvsOSNdllNEXD8ZD0haynf97BL00pAFVglFdFGIWEsq/0JRfMgGAbHhOBK9mEW2HayTeHVioUd5G/DAB5J690BXjcEwpMiGOLHOFHcdRwCZal6iOwQ38HQN4JM64=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 073efe158d8d88c5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJzzc0IlJ1pAm53MVorNpr9TpkUSaFBCOPb20cJ1a6i5B1ZqB6Paw8O7Cp/IO0mvnJiYLHC+LMvg3K3/OLr+5GT3qilm6helQIM3rE7Zc6tKFqW2xEwwTAiuG6xSay9r0mg8mO2zSoe/G4ZPKKdVrDUxOxNUHyqNKkMWvF0XR3AOi2qbqhuUAatLKZbOQgRiOsM8OlhE3IixCAESZDNr4Y6b0etJYYCmGB3exjr6GcuFGYDFaIzAjVcyBW+TAmejMHOPoTEZ5lBe44CjrJxKc95PMRT46U89QtBF+e3npJg1fVZAv7ezMduLlHsfEuQeYcS1FCQTQKR4KUa3CilAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB6UH105Pgd2TVvxfn8TNOxjI8TZycQoDY0DRRb3Ysw=;
 b=Z8DUTJos6sCXMeUYe0YeiFpW89D3jaxGGBmYYVUgDJfeSVjZ9wJdjbo7Dl5kqHJsLcs/+NQToVzzWn0RrCG7xEWoT6wZyqyjo7VQ7na5P9koIuihFrEqduu1SxuW891PTAchObZzExcf4JYbf6mNgQ9fAwdcz0fOcDLA1NhtvOyJ/h6gtCP95JqbaEOc9msH/Yzs93HsHa1EPdmrRmXUIbKOBAyXmuU5JsnF+v0OH4EtWaCg77rD5crsW4pu/JT4WIET7rKZQpK4ahUvkRbdJlE13Wr8DSv8y4xBezjKH40fpJ+Ik1xhhdJKutZz1bJJ+gzsEMLdW6JR/aSlhVNtBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB6UH105Pgd2TVvxfn8TNOxjI8TZycQoDY0DRRb3Ysw=;
 b=t8i9kItwwcrUNH0JNYgeN6S7txh+b/Oh+4yHLmGAK8Lu19JfvsOSNdllNEXD8ZD0haynf97BL00pAFVglFdFGIWEsq/0JRfMgGAbHhOBK9mEW2HayTeHVioUd5G/DAB5J690BXjcEwpMiGOLHOFHcdRwCZal6iOwQ38HQN4JM64=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, Scott Davis
	<scott.davis@starlab.io>, "jandryuk@gmail.com" <jandryuk@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Dario
 Faggioli <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Topic: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Index: AQHYXt+O5KwXx13Nl0CUGYEFbsIOk60NIqSA
Date: Tue, 3 May 2022 13:17:54 +0000
Message-ID: <08C4B263-D905-42A2-BBFF-75D7F78E20A1@arm.com>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
 <20220503111731.12642-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220503111731.12642-2-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ed3ee555-76d7-43f4-7251-08da2d075d35
x-ms-traffictypediagnostic:
	VI1PR0801MB1758:EE_|DBAEUR03FT016:EE_|PA4PR08MB7481:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB7481A2E62936BC02E7412EBEE4C09@PA4PR08MB7481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 R1DFegLEkMwXqROb+gTYEwt8pSdDjJy57yfMsGMAHseHSfdrzxwEsiOh3qcxNgp7gtZjhyL1yBeYuECO7RJE/k8EYW/Q7k7o7TXOFIv99NIhd97fzDiauqlXNqnkiGr4dOEBQBzC4ONr41GCSftZ3hRa2W7WyeIpM+bqC+CUOEQLRPPkc/s5BAg0oMn1rz0SNTHPSZeB422uXZgqEQPphPdEd/9zYutN2GUMenwCCM/dUIpRiGs2wTnAxCQvsCJGRp6mUDREEn2JxCZqmxYv0p4YGZxzwPTpr3ijWxVa976nkQhLFumBlkzwuIOvpFcBzPYrTmQ26YVQvl0zPjVR6zUJc/Afi3TungoIEOfSmOfMeLqEUEthYYYs/Dfd8IG4Wigii86H1Utk8uW6jZ9qb5LxPOodi5wL+mWuAvYzSDj2uTWWMNvF0/JEKICjqWDr4nax/hC4XNapu3ILyicXuvOF5wBCnAsER/NP2eqFL2DA/3/a+8UdRt6QgRXPVJu0hatG/ho1FH+udkEJr36aZQ5obS8L4bOUQXae57PUfYwihhsT2dg3ManU6mCziG3HKo7VnmvFOMWN89D5+PuogzIEbRs4ZzcC17cD/tdv3pbHFt5pzi1DC9ZjOJz5hFibIM0pmBgzD0nxJfVEnihoNU/jng1fkq0Zh+Mpq85c1cPKasz8itxjMUetcx/njqbfSuO//2LhV3AC8KT3Xr2EesXs9pU/Q2pEs1XDeuizFmI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(83380400001)(316002)(54906003)(71200400001)(6486002)(122000001)(36756003)(38070700005)(38100700002)(186003)(4744005)(7416002)(4326008)(8676002)(2906002)(76116006)(5660300002)(508600001)(2616005)(66446008)(33656002)(86362001)(64756008)(6506007)(66476007)(66556008)(66946007)(26005)(6512007)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C99FBB2CD13B164F88CCFAF6E2B80A03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1758
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3da10e0-2d19-4c40-be79-08da2d07553e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdWex7rvHN3RaqJdzLy/JDrsF8hf+ZlSRYNgxokZ59BVe7kZBZSaMxQGM2UgzWCM9Jwusnx+zosQwNrzyZgYxN7OGFu8UcQndcqP0ILuCtxXf8JJcI+CAEjEKNGiSImxTdYD/vvGwk/imvvppTnZN8tjEnK3PuaZS8sImHriCZYYEx2JZ59vXZKZ180y4erZ7UhQvpGqjxhqV0VWGZ1VKf/AxGExYBArzXCZrmQb4hsSqfYnJ+7uLhcUjO679910DgJ2Dex0WfsRVtdyiVbx+5mOycwOSuEhVa9faEqzwXECsdD7Cyu7jBiYxnGZzDhKbC4KoTrWWuExXcKnMcAiymWcav38mi3hsCvXEnij7xK8Q2NXlmrXNMW06IYjAmgWfg1qGZaQ3JrTcNldDsWWgQpu34Ft1el9wP27znBK6q+5kWP9GHgePGX3tSncByhZK4ilKSVilJz9bYFhLOxfGQ/rSg/mf9GoT79a4okF8rcssH5iLU0CP8DmeXL1czvEtf/Dl8sPQbpYqarMFIuH52u48jOhe+bjGufLVSl5wBw6hteNz9sKr8x0Ka3pVuKS/LluYXnygjoKbGIWCshNLkczdRgQKqi1xKnW/pxN2SkM2M2uXQJYtqew6zceC+quhbGYvV2IDDefqnRSy9JJL+tToLJIyVKFeOCIFCMP0am6OxIacFMfbj2MvA66R5Lz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(33656002)(2616005)(5660300002)(6862004)(70586007)(356005)(70206006)(8676002)(186003)(4326008)(508600001)(36860700001)(4744005)(82310400005)(40460700003)(54906003)(8936002)(86362001)(6506007)(6512007)(316002)(83380400001)(6486002)(26005)(2906002)(336012)(47076005)(36756003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 13:18:07.8151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3ee555-76d7-43f4-7251-08da2d075d35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7481

SGkgRGFuaWVsLA0KDQo+IGRpZmYgLS1naXQgYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMgYi94ZW4v
eHNtL2ZsYXNrL2hvb2tzLmMNCj4gaW5kZXggMGJmNjNmZmE4NC4uYjkzMTAxMTkxZSAxMDA2NDQN
Cj4gLS0tIGEveGVuL3hzbS9mbGFzay9ob29rcy5jDQo+ICsrKyBiL3hlbi94c20vZmxhc2svaG9v
a3MuYw0KPiBAQCAtMTg2LDYgKzE4NiwyOCBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGZsYXNrX2Rv
bWFpbl9hbGxvY19zZWN1cml0eShzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgcmV0dXJuIDA7DQo+
IH0NCj4gDQo+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGZsYXNrX3NldF9zeXN0ZW1fYWN0aXZlKHZv
aWQpDQo+ICt7DQo+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsNCj4g
Kw0KPiArICAgIEFTU0VSVChkLT5pc19wcml2aWxlZ2VkKTsNCj4gKw0KPiArICAgIGlmICggZC0+
ZG9tYWluX2lkICE9IERPTUlEX0lETEUgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgcHJpbnRrKCJ4
c21fc2V0X3N5c3RlbV9hY3RpdmUgc2hvdWxkIG9ubHkgYmUgY2FsbGVkIGJ5IGlkbGUgZG9tYWlu
XG4iKTsNCg0KU29ycnkgSSBzcG90dGVkIHRoYXQgbm93LCBoZXJlIGluIHRoZSBwcmludGsgcHJv
YmFibHkgeW91IG1lYW4g4oCcZmxhc2tfc2V0X3N5c3RlbV9hY3RpdmXigJ0NCmluc3RlYWQgb2Yg
4oCceHNtX3NldF9zeXN0ZW1fYWN0aXZl4oCdLCB5b3UgY2FuIGtlZXAgbXkgUi1ieSBhZnRlciB0
aGlzIGNoYW5nZS4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg==

