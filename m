Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BA657E2CA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 16:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373264.605369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEtIo-0005E7-C1; Fri, 22 Jul 2022 14:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373264.605369; Fri, 22 Jul 2022 14:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEtIo-0005By-8k; Fri, 22 Jul 2022 14:06:50 +0000
Received: by outflank-mailman (input) for mailman id 373264;
 Fri, 22 Jul 2022 14:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdc0=X3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oEtIn-0005BW-76
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 14:06:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86666490-09c7-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 16:06:47 +0200 (CEST)
Received: from AM6PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:20b:6e::38)
 by AM5PR0802MB2530.eurprd08.prod.outlook.com (2603:10a6:203:98::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 14:06:45 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::75) by AM6PR02CA0025.outlook.office365.com
 (2603:10a6:20b:6e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 22 Jul 2022 14:06:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 14:06:44 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 22 Jul 2022 14:06:44 +0000
Received: from d2cc2ffe1092.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66C82476-9E14-4398-BDEC-8C98F71E1AB2.1; 
 Fri, 22 Jul 2022 14:06:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2cc2ffe1092.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Jul 2022 14:06:38 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM4PR08MB2913.eurprd08.prod.outlook.com (2603:10a6:205:a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Fri, 22 Jul
 2022 14:06:36 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 14:06:36 +0000
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
X-Inumbo-ID: 86666490-09c7-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PMooFyZHk/kUT6oz5QMOFIHsfZCONyMIsmFUw8LAls1JM+VzWP52fNP+gvyzHlYn5XJ/XPx6RGp5tkRm+uGEbdlvwdZj+WQmFp/jIYppb6+27g9vuvUlPiD2IwSy8sSXg3JcXQr7U5KPqu4Ejxpy76yFTKYhVSJTSadU0FqFRS3RwKCA/j7WfTMkxw/Jup7b2/FMHB9n0/OZorrfwbsej7uMq2pl/+ZbSI56a42BWJc7HbFMYpFw1gk7t/jNcdy5w9+Q4E13B9I07aYcDpYlojNcuFtF1tRMQvx8xvxnnqtm5LLJwHdi4NXJZaFAdroWt5d2MfYg61QgU2F9TxpSIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sockyqUQ192qkRWDk7L0M9+vX96BUdJhjWpGJq0C0o=;
 b=JNQ3iq8/9V0ngCu/l3ahI7creRe1yNVJjPbJoZp0ros60vjHLuBZEOkRv9DzzHOhnWFyWyrM4k8Mak/pIlvyl+E2jp5nd6MoqyrUKwGxQp1a4dHCWKhrxAT1eLj3FlGo/pdYgAUE6X3JT9pRYrKG9OVxzpwYonVHuLvknuQCvAC7XVUl9+eVKGLPzxf2UT/aMvFmvzlO5n7nlnvqlQCPghujQWN2V8PVxMsi85Y/8C2sjmsDVkCgYlA/xGNeeknhe59rddfRi7y5JAUHR65KfRFJV7m2xxTVL4cdUm5axlt9ekXAR6RUNwl0Xapd7CmoczGLBiQ9WFMVjsgd4iIlQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sockyqUQ192qkRWDk7L0M9+vX96BUdJhjWpGJq0C0o=;
 b=tZr74qf5Fj9XHc8BGzzkCajYbGuHW4znyRVxxwEIx/UBA7tWkvAG/CK184JWEc4Bkqu7SGVT0alREF46nJthhZdGDHYXsRpordsS4XotUnXw76FRsoqK/BKRWXdmOERW1zm4tc3tSDkLN5WJiyEmqBnW9wDHNzPtrDH/CFWip/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d303d9d6274a1ae8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfeA2vGikfOi0Nzil+7L4nQ9JSiZ+AyKY4iTGHyh54UC0qzAUp51HWNP9BM+1k2sr50pR7yX34YYUUDoeYAyIRmhrJ61aolOaoRZOSVrjRGbzNwsAMGtP0RBSgf4EgjnQdir3kW2RZU3q5JxBxcUq0gBw5EVBxI5mlZz4J/hn8qBJdAHkGl8jnkEFR+mYWOU+uf3Tn+GZzxNbr9nijg/zwKWZuAW6LIqlRhPmm/gPcRBjOoArcz4brzmvGf/lTQ2L4OWa07xOXH7clwkHsPINjAK7QiIdQsd/fZ+GbTcC/0dQcRLt0PtYwiGHanPxUGZ7fl3sIowHfMrrnIbeJb3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sockyqUQ192qkRWDk7L0M9+vX96BUdJhjWpGJq0C0o=;
 b=MUJdcJ9cI9TGglQEWbzb4FQbfm9oaRMA6YWpsp1NTphytMa2p7o/TMe/fjDhmRzZThpvpO1lmdFeAU1U04MfyUeQBrRoFX/4f+cutDzgxvWYbd7WyiDFpWXjBmhFPd8V2YgrbdT/HxI2LQ8ID/Mlp1+gb9l3xgA+6EsFHql1VnTwGTxul8pxtb/xAdEw/gImt1fGV8iG2JeNiKSl80KxlicEotUhfHOFm3v0/Y8dxj6OH1MgHZBppDXrpV+1Hhqp8x+rT2CeOQX5+zjfOCy3k8JQiTpt7NLzQ9FL69MsAOpJEAJJVQxoaxBnB9v6oMOPv0Dbnx3KUwa7kM16zDzUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sockyqUQ192qkRWDk7L0M9+vX96BUdJhjWpGJq0C0o=;
 b=tZr74qf5Fj9XHc8BGzzkCajYbGuHW4znyRVxxwEIx/UBA7tWkvAG/CK184JWEc4Bkqu7SGVT0alREF46nJthhZdGDHYXsRpordsS4XotUnXw76FRsoqK/BKRWXdmOERW1zm4tc3tSDkLN5WJiyEmqBnW9wDHNzPtrDH/CFWip/g=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 21/25] tools/helper: Cleanup Makefile
Thread-Topic: [XEN PATCH v3 21/25] tools/helper: Cleanup Makefile
Thread-Index: AQHYh+SpG67mKDjnhUizMZbh76UNia2KmLeA
Date: Fri, 22 Jul 2022 14:06:36 +0000
Message-ID: <F1490037-80C2-47EF-A11A-49A484D5F4B7@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-22-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-22-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 88c8d963-49bc-4521-a118-08da6beb68cb
x-ms-traffictypediagnostic:
	AM4PR08MB2913:EE_|VE1EUR03FT064:EE_|AM5PR0802MB2530:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nQl/a6/VNwn5SXTACLFzksCT3oVqLGLKwaX7IO4U9YZnRAcLjIfKi3MHgysVfJ3hSiEF5MJjKUArKegk2e3EEzXvoVLO0sk9q7zrsFa/giihXf2O+DNsiamfltq14KLLDSmVO+Xe7ppwP8ulWnZRWPmVoNXCC3d2/ojgmmQR3TW1lZybIAoOuWxXdZOCiN0VsXAxEAoDpiqW8XXXB13pi2S/mZ21FSEIscRudSVOGUzWuLSeevXMxdh++9z0NAdCu1G6MQcEVqssSduFlcN1z1ToraxehujYEB+xQT7j6UNKdzFaEOqM9xhiYHdQC8SSp8DGvkR8woRbDZJEJxQVTYCK6bMVTU7liP1mh5dEY1XqDErvzYseKhPcqw8nRiwAHJQ0jFQbbbLQGx4tQ/Q9m5adCI0xzVyOPVbmGymfa9VYqZ2PvGeby7JDlwVOlTDr2YBgge5e6Q6RlHGFze6miYDcU0phWsUScuj82PrO1cCC8OYbZ3dNcyVSkpmxjIOfx3Z5gLIR1YXbeJ8gmszppCHgwBnqwwYbZTYfmYiGNa4irZChwXB+/b5WCrR76vtqK0NI8cG7Qz87EHvMJptn4UvcOeSzosP7KF1x3h54kUYB6YOY0eWTouk7zqVWQ9i170UllfQrfB8cd1M72rCaLFAWMCoj3Z8YRmm3b4oglM285pPtd37raydG0NCardRF9G/AK3UgEXevYPUIMEhT8w0JufSXP4KuaDhdEnwMf9aE6Wiw3Hb9hrDa68qm9n2XwdE8zNh0AkV5xQ5t02Ol8/b2+PAZh40BPuS76IocvopULWVeU0rq909j0E2zXkTUrhvo/2b5f4s5Ix3NNpikJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(86362001)(66446008)(8936002)(6512007)(5660300002)(38070700005)(26005)(2906002)(186003)(38100700002)(122000001)(53546011)(6506007)(36756003)(6486002)(66476007)(41300700001)(6916009)(71200400001)(2616005)(478600001)(54906003)(76116006)(91956017)(83380400001)(33656002)(4326008)(66556008)(66946007)(8676002)(64756008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <33D2932FACCBE84B8EF81573146330E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2913
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ffc68cd7-7dcf-457c-7f37-08da6beb63de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OexHW6ZjKGxJTyHylfR/LbLBA2nrfL7/t4/PGGhA9EHZSUrx/b+4tZr+VSnQ/m/HNi7Qj3ns8zmHuQ4wQ+FCxcf+janssNPE4Ntch85ZP1yW2gqkf+K2zTLNeQP5ueFdoGvrsOCVBc7oe9oGMVxys9QMeTAOzSF5gBF2QNijV+45flbywwDAtLOmOYay3jmyYqfVXFSHAew7lob680iqwV7IQScpSat70joXXP6HCuGFyPCEyC6k+M6iMo92hshlAPtEuPmH7HFFIaFjfSPbcqJHYDYbBtSc+zLleUp4fXzdWs0xKDUuN2r6NrO4p+4qBO5tpTXoulq6ymVymSvTAFvZtqvvgKFvG1ITTezMFmQ3B/6XMuPAnZnIcPW2jdVfKWijd1Uw+ammwEyOue7hdxUL7WoKEAnUhWcbybHBddgzjhc635m1FiHHQU55R6yZVOOaTBQAywxuEJC1ENZkXjETb04Yu8u9pohuncE/qWW9FB0BQFkO9ltTQDutn+cpwSILFGB7AAeVEmU3MaIaQGaaN11mTJ4N7mYNh0i+jRqrkQilF6SQrmjtUAAxCZvcqHb3w0B7zn+VR6A5SSttN8OZzOvTrwsgEoVqGQ8Fxsocm7UHgXIV6scs3onCAcS+FtgdpkUAPqweRCxI1bPbubPHwh0bR1rqpKIMmfFy5UiJx3N9bx8vjTaQq4BtGhac/jlxSJklAnpCac4PT3MaiajrQ88bJ+3ZW5UY3RKmNV4VJg82ma40c+v1XlTMYER1jn+U8W7LPksgwrpjUOwhrVIjDc19zqe7QRWuBq0hd8UcAEgg/hOBy6CziR7XasVa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(36840700001)(46966006)(40470700004)(8676002)(6862004)(8936002)(5660300002)(70206006)(70586007)(40480700001)(40460700003)(2906002)(82310400005)(54906003)(4326008)(36860700001)(83380400001)(86362001)(36756003)(6512007)(356005)(33656002)(81166007)(82740400003)(26005)(6486002)(478600001)(316002)(47076005)(2616005)(186003)(336012)(6506007)(53546011)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 14:06:44.4980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c8d963-49bc-4521-a118-08da6beb68cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2530

DQoNCj4gT24gMjQgSnVuIDIwMjIsIGF0IDE3OjA0LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBVc2UgJChUQVJHRVRTKSB0byBjb2xsZWN0
IHRhcmdldHMuDQo+IENvbGxlY3QgbGlicmFyeSB0byBsaW5rIGFnYWluc3QgaW4gJChMRExJQlMp
Lg0KPiBSZW1vdmUgZXh0cmEgIi1mIiBmbGFncyB0aGF0IGlzIGFscmVhZHkgcGFydCBvZiAkKFJN
KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPg0KPiAtLS0NCj4gDQo+IE5vdGVzOg0KPiAgICB2MzoNCj4gICAgLSBhcHBseSBj
aGFuZ2VzIHRvIHRoZSBuZXcgImluaXQtZG9tMGxlc3MiIGhlbHBlci4NCj4gICAgLSBtYWtlIHVz
ZSBvZiB0aGUgbmV3IG1hY3JvICQoeGVubGlicy1sZGxpYnMsKQ0KPiANCj4gdG9vbHMvaGVscGVy
cy9NYWtlZmlsZSB8IDIzICsrKysrKysrKysrKystLS0tLS0tLS0tDQo+IDEgZmlsZSBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90
b29scy9oZWxwZXJzL01ha2VmaWxlIGIvdG9vbHMvaGVscGVycy9NYWtlZmlsZQ0KPiBpbmRleCA4
ZDc4YWIxZTkwLi43YzlkNjcxYjMyIDEwMDY0NA0KPiAtLS0gYS90b29scy9oZWxwZXJzL01ha2Vm
aWxlDQo+ICsrKyBiL3Rvb2xzL2hlbHBlcnMvTWFrZWZpbGUNCj4gQEAgLTUsMTMgKzUsMTMgQEAN
Cj4gWEVOX1JPT1QgPSAkKENVUkRJUikvLi4vLi4NCj4gaW5jbHVkZSAkKFhFTl9ST09UKS90b29s
cy9SdWxlcy5taw0KPiANCj4gLVBST0dTICs9IHhlbi1pbml0LWRvbTANCj4gK1RBUkdFVFMgKz0g
eGVuLWluaXQtZG9tMA0KDQpDYW4gdGhpcyBiZSBUQVJHRVRTIDo9DQoNClRoZSByZXN0IGxvb2tz
IGdvb2QsIHNvIHdpdGggdGhpcyBhZGRyZXNzZWQNCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2Vs
bHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KSeKAmXZlIGFsc28gYnVpbHQgYW5kIHJ1biB0
aGUgdG9vbCBzdGFjayB3aXRoICh1cCB0bykgdGhpcyBwYXRjaCBvbiBib3RoIGZ2cC1iYXNlIGZv
ciBhcm0gYW5kDQpxZW11IGZvciB4ODZfNjQgYW5kIHRoZSBiaW5hcmllcyBhcmUgb2suDQoNClRl
c3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoNCg==

