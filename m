Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76162621A34
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 18:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440345.694524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSAP-0007Kv-Bp; Tue, 08 Nov 2022 17:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440345.694524; Tue, 08 Nov 2022 17:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSAP-0007HT-8u; Tue, 08 Nov 2022 17:13:41 +0000
Received: by outflank-mailman (input) for mailman id 440345;
 Tue, 08 Nov 2022 17:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RwHN=3I=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1osSAN-0007HN-3o
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 17:13:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae623ca9-5f88-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 18:13:36 +0100 (CET)
Received: from DB6PR0501CA0041.eurprd05.prod.outlook.com (2603:10a6:4:67::27)
 by GV1PR08MB8617.eurprd08.prod.outlook.com (2603:10a6:150:81::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 17:13:33 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::a6) by DB6PR0501CA0041.outlook.office365.com
 (2603:10a6:4:67::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Tue, 8 Nov 2022 17:13:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 17:13:32 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Tue, 08 Nov 2022 17:13:32 +0000
Received: from b0d8b58b26ab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE5FDA99-02C9-474C-ABF4-26797C31D2C2.1; 
 Tue, 08 Nov 2022 17:13:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0d8b58b26ab.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 17:13:22 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by VI1PR08MB5471.eurprd08.prod.outlook.com (2603:10a6:803:137::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 17:13:18 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::a504:d47b:217:4893]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::a504:d47b:217:4893%4]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 17:13:18 +0000
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
X-Inumbo-ID: ae623ca9-5f88-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lG1VBJAc0Zn/yJYZh+Br+TipofoikY6XKinnrv5t3C1ZUlnTGjm7f4GqlEejvUsQsdp7mVSkHgn7Uc58TCpNTQAmDZX/FzwwF+1z89tiSFa+DfTruypY7iub/LU4Us/fM0Oe1wPqd/NlS6fTsxj+nE0F30KxkJsCVmXatFjL/ebK9Ah7LfmqOlMIohpTCuZCNRsS6sXZes+VVbYM22UN5S3ZS/B4OA9q/AmW6g6LvAbQkaCGw3Rs/1zcXBrC+PYLxWWIKeR0gxL/qc2diA84Gu6a6ZNd40+urKAGzbsiqUDHitZhms8RGa31Mji0TD+QNRW5F+JumLxouVyCXViK3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Syc7erBJ6qFi9Tki8fuctpu3DB3inDj/IYd1NNpFGKk=;
 b=ndw3tp5SS5ypVR+xGmevIn/3pxJwHEVE6JX/x3Hc9a11Qi7OePdBfBGWmT3nNiXtsPj0nKGNVUjfZh4/xD1bGlHZ8YX4fMx+SW9gkWV15EPMz1Av/e/jJqJlHOOzpVcXk/bT+boEV9a0sp8fmhz3Fv64S7cStNeYvvcSPPP0IcBDhUfbHDUBOnrxAz04EgKnYpPWFmsggEUv5OKW13Ezvb0Lv3Vy01CzrEJm25AtixI9CKbqPrW2fJEPvnCUGuAFgBp5Z8JIypMIy9v3tM51bwgDQCCa/gWMbcpx7U1Hmnl/Ar1IQ6mjnEvf378od3dXf56MgPxR/ZmtbZ/pwC0YzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Syc7erBJ6qFi9Tki8fuctpu3DB3inDj/IYd1NNpFGKk=;
 b=DBpBCT/ywNzGGswdq+Iwn98sya6kwQR2wQVXfY9K4sV66BuW0u6rAWoK7x75j9fiyCar7N6gB1WiD9IrQWkB9o6Faw8jcaQIZ4hYFuVRhU56jmSeiyYTJo95CcjxMX6FT67KcP9e2LXFZ9vji8fk34As9r2kuTWuSc4HE9iEw+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c8181f757736892
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEy/+zeYJ9EtMuuNrL9kLgfXxlwkCDzZBLiN+bdYFcOQw/T79wMp93RxzooC5dy1M0l6ArDd+U3QosEI9ZUEfUYTZTZJ51PJraCr/1VfdVY7t41we2CSQKq02H3JPf3J0+JWxa2QiZoIUtunI3vMObiSaQ4U+eGgwC5aljb6NoJC9hud7S7jVPjYruDETvwjFGwBOedfBSxCHWuIYkMXruHPkzH8m/tfomN4FX3iL13TUMC6d6KXEbxrtwFjMS9k5huKe2mouGNG/8kjOhVG/ho/4fDZDQuPjcuxXkNmZW9LSoxR9+g7iH8mx01o/2C0MTPYnV/fsrKfRkttf9yaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Syc7erBJ6qFi9Tki8fuctpu3DB3inDj/IYd1NNpFGKk=;
 b=jN1ehq3q9EPeCeqxsGIsCeoz/bKviBLLVU7hM+mWrebxIzpAkT4kb17o2ZpSkI4vJUlNtznkG2EVt9tolBCQ1hy+L++SlL34F3/axhWmBH9UaoreKw/YKHp4rHlS8XiBZIpshLFyY5nOYF6+wnCoyrx0JkeMW/MpTecdLPruGNbxVx+bq63ooGxPfMhIZAkVoMFxdWsDSgvykd6ANrdQGaRUBcUex/G9QV1GvTihYPWv4A3qwUEEshhF3IVWcohFD99sOJpYIGmZETb7bvrHLr345Gnot0jYfakI3u4TDkeIyIGDBmQ6TWBvkLTJj+jB84koJTQntPjlHTHDRgeUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Syc7erBJ6qFi9Tki8fuctpu3DB3inDj/IYd1NNpFGKk=;
 b=DBpBCT/ywNzGGswdq+Iwn98sya6kwQR2wQVXfY9K4sV66BuW0u6rAWoK7x75j9fiyCar7N6gB1WiD9IrQWkB9o6Faw8jcaQIZ4hYFuVRhU56jmSeiyYTJo95CcjxMX6FT67KcP9e2LXFZ9vji8fk34As9r2kuTWuSc4HE9iEw+o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Thread-Topic: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Thread-Index:
 AQHY8pZ008DS0BACDkyhs+OWN8Oan64zqLWAgAE0WoCAAA3SgIAAJOMAgAAeVoCAABeCgA==
Date: Tue, 8 Nov 2022 17:13:18 +0000
Message-ID: <2E0BFEFC-5BEE-4F8B-BD9E-94CB9A5B2BC9@arm.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-2-luca.fancellu@arm.com>
 <aa989d27-45c2-6cb8-160a-b0368b1bb2a2@suse.com>
 <8632FA78-B316-4866-8E78-D4CD127C8602@arm.com>
 <d1d5ce85-0883-9217-ada9-71204e02239a@suse.com>
 <B26247E9-BD4A-4868-B977-CC451F7A095D@arm.com>
 <7d56c33d-4b03-9aa1-6abc-45a8ad41caca@suse.com>
In-Reply-To: <7d56c33d-4b03-9aa1-6abc-45a8ad41caca@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|VI1PR08MB5471:EE_|DBAEUR03FT014:EE_|GV1PR08MB8617:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccec003-67b8-4c68-b87c-08dac1ac9083
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 egqJNEI/SuQyaGL8sHiIeTp4xk23hfPP39XbRlRoRYIoZmI21Ilt0hXYgNagUD77L5ZXESutVRmdSeM0hoOVB7YrmejN//mNCBhiV+Jfm8gQ7HGTwK1uVGvlMGpC3Ssc5hXmZQgU+wvEuSgGJ+fmeV2zMSwpyFoTgbnUXR2K9GEPKtKKgnSo0VJFCnZsOtN45kb3LatwBHBJ6QKpT0pPwqNQPJLGBiZWqHdYhuoagMr+EX0rN5KlpUTYd/jSbspm1Xi9dXtki1xzZ8TruxSj9xI8m0aM9XVraOT+jBeBU3inJA2ubDQZ07NoHy1oHElhOc/l7z5ojin5CpkmuRBQknLuC7HY7l44d3kA4eAA6SO+HQae9jUPMKVa+9u7VHrD3gxzpcPZS0dgteiNHXBMA2JfQQgMzCenurwGZGfsLDgV00z9W0aFUODIs/mqUYwbT+tD5JtTWMyjcRHQKHcfQQb89ry7ecWDHl8/t3PSHCxHsb361Eqcm2XMDmTefbsjm/eZToRhDWmF0otPh4yEKj7qCDjrZJ0X77TtLe0ryufg8kLhNlPQTHV1ucI8DhBpHA8/BkovnA9tCAw2YUJUWRMJzxd6oE9WBPrlj9n+o576Zi//CbvcrBf7Q9v65+KPbaKwKAJbFmq237AbVlrj5LvWSq1zYreYOQZAzdkCQAs8NSmwAAcuQMtF1XHRDGEKkhTAKZgZdmXd4KjSZaWfasg1M6rXhApeDHEmZSS3yMp7YTX/OBcGe2J3qUIVOklhbSL/VjwlgiJE2KiFrPffkhkB+iYaRtbQd7SpZgp8i7I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(33656002)(8676002)(2616005)(26005)(6512007)(54906003)(316002)(6916009)(36756003)(38070700005)(6486002)(2906002)(71200400001)(38100700002)(122000001)(8936002)(66556008)(64756008)(66476007)(41300700001)(186003)(66946007)(4326008)(66446008)(91956017)(30864003)(76116006)(86362001)(83380400001)(5660300002)(6506007)(53546011)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00FC34095D10B54C9B21E8A89C897F41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3db1dc8c-fe72-4fff-50b0-08dac1ac87bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mF+spplsWTd0bztD8hmhicyIostaaC8LAoKySs3aoKOE9yRMl817kkARmJ6ssXzc1dqTtcQd/CMzymoOUv7npJ23T0Ogf7unUyjeLjp4UkvbwJnho7Q4TP8kjVvlLUimgjmsE4FFp4h0JICnJxYnBbQ1AdV7QTKv80iNKuI+lamoqbTRXQ85Jk0kgyM8hk/cJEvFt5/tM9XkIRXM23BVaJlVIptlGYBFPFPnwv38Fq/1v579HWs+8MR7hTj7XSVK/ZRG4lj1wckCgO9efxU6rrKK5Qv7sxrjmjzL8ZJ2Ge9hTeFLJxoE2gJePAQixI3eVktuPHbz6ni4jnbY1IvKIDvGWb1SVrA97ei9GJvvAnRvvIF4vtSp442QYDE5uD0I2CQozd6Q/rGF8x4TfZ5YpGQQoPqiyPLjhAr/S6QtsjfLktoMiq/Oz61HNKaewSBRgPUgfeKd21/kT/GZ75U6bCH50tOq82CQq9oyGwahAVthadxVTP0+RKCaXNCKSGFd36Gg2Q5J2rYXJIoWtmAUJPXJDX3exsRk/9f+dovwrD94X/iXu30gqOYaAYB6HIsw/mPsFfrRfqygBnmnbN2VmNpzTe7ETtkhY/IsVDywbjXyJRoE8Mo8g+dLyzPxgTtq32WzdCeb56JJxBdMlZn0P5kGgWx0/USZp5gERIKIHvRrC8MMPixAKOAppt+CjunTHZmP3JTAWuQ2iV6hylUBeTlw4ITv2lKE5qbqXGNUebw/sOGEpCD3abBTlVGY4Jv9SblqNMTIXpk93kcWzxx3vQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(30864003)(5660300002)(86362001)(8936002)(70206006)(36756003)(41300700001)(2906002)(6862004)(478600001)(82310400005)(316002)(4326008)(8676002)(53546011)(26005)(6512007)(70586007)(33656002)(6506007)(54906003)(6486002)(40480700001)(336012)(186003)(36860700001)(2616005)(83380400001)(356005)(81166007)(47076005)(82740400003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:13:32.9433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccec003-67b8-4c68-b87c-08dac1ac9083
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8617

DQoNCj4gT24gOCBOb3YgMjAyMiwgYXQgMTU6NDksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOC4xMS4yMDIyIDE1OjAwLCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4+IE9uIDggTm92IDIwMjIsIGF0IDExOjQ4LCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDA4LjExLjIwMjIgMTE6NTksIEx1Y2EgRmFuY2VsbHUg
d3JvdGU6DQo+Pj4+PiBPbiAwNy4xMS4yMDIyIDExOjQ3LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0K
Pj4+Pj4+IEBAIC03NTcsNiArNzU4LDUxIEBAIGNwcGNoZWNrLXZlcnNpb246DQo+Pj4+Pj4gJChv
Ymp0cmVlKS9pbmNsdWRlL2dlbmVyYXRlZC9jb21waWxlci1kZWYuaDoNCj4+Pj4+PiAJJChRKSQo
Q0MpIC1kTSAtRSAtbyAkQCAtIDwgL2Rldi9udWxsDQo+Pj4+Pj4gDQo+Pj4+Pj4gK0pVU1RJRklD
QVRJT05fRklMRVMgOj0gJChYRU5fUk9PVCkvZG9jcy9taXNyYS9zYWZlLmpzb24gXA0KPj4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICQoWEVOX1JPT1QpL2RvY3MvbWlzcmEvZmFsc2UtcG9z
aXRpdmUtJCQqLmpzb24NCj4+Pj4+PiArDQo+Pj4+Pj4gKyMgVGhlIGZvbGxvd2luZyBjb21tYW5k
IGlzIHVzaW5nIGdyZXAgdG8gZmluZCBhbGwgZmlsZXMgdGhhdCBjb250YWlucyBhIGNvbW1lbnQN
Cj4+Pj4+PiArIyBjb250YWluaW5nICJTQUYtPGFueXRoaW5nPiIgb24gYSBzaW5nbGUgbGluZS4N
Cj4+Pj4+PiArIyAlLnNhZnBhcnNlIHdpbGwgYmUgdGhlIG9yaWdpbmFsIGZpbGVzIHNhdmVkIGZy
b20gdGhlIGJ1aWxkIHN5c3RlbSwgdGhlc2UgZmlsZXMNCj4+Pj4+PiArIyB3aWxsIGJlIHJlc3Rv
cmVkIGF0IHRoZSBlbmQgb2YgdGhlIGFuYWx5c2lzIHN0ZXANCj4+Pj4+PiArUEFSU0VfRklMRV9M
SVNUIDo9ICQoYWRkc3VmZml4IC5zYWZwYXJzZSwkKGZpbHRlci1vdXQgJS5zYWZwYXJzZSxcDQo+
Pj4+Pj4gKyQoc2hlbGwgZ3JlcCAtRVJsICdeW1s6Ymxhbms6XV0qXC9cKltbOnNwYWNlOl1dK1NB
Ri0uKlwqXC8kJCcgJChzcmN0cmVlKSkpKQ0KPj4+Pj4gDQo+Pj4+PiBQbGVhc2UgaW5kZW50IHN1
Y2ggbGluZSBjb250aW51YXRpb25zLiBBbmQgdGhlbiBpc24ndCB0aGlzIGdvaW5nIHRvIHJpc2sN
Cj4+Pj4+IG1hdGNoaW5nIG5vbi1zb3VyY2UgZmlsZXMgYXMgd2VsbD8gUGVyaGFwcyB5b3Ugd2Fu
dCB0byByZXN0cmljdCB0aGlzIHRvDQo+Pj4+PiAqLmMgYW5kICouaD8NCj4+Pj4gDQo+Pj4+IFll
cywgaG93IGFib3V0IHRoaXMsIGl0IHdpbGwgZmlsdGVyIG91dCAqLnNhZnBhcnNlIGZpbGVzIHdo
aWxlIGtlZXBpbmcgaW4gb25seSAuaCBhbmQgLmM6DQo+Pj4+IA0KPj4+PiBQQVJTRV9GSUxFX0xJ
U1QgOj0gJChhZGRzdWZmaXggLnNhZnBhcnNlLCQoZmlsdGVyICUuYyAlLmgsXA0KPj4+PiAgICQo
c2hlbGwgZ3JlcCAtRVJsICdeW1s6Ymxhbms6XV0qXC9cKltbOnNwYWNlOl1dK1NBRi0uKlwqXC8k
JCcgJChzcmN0cmVlKSkpKQ0KPj4+IA0KPj4+IFRoYXQncyBiZXR0ZXIsIGJ1dCBzdGlsbCBtZWFu
cyB0b3VjaGluZyBhbGwgZmlsZXMgYnkgZ3JlcCBkZXNwaXRlIG5vdw0KPj4+IG9ubHkgYSBzdWJz
ZXQgcmVhbGx5IGxvb2tlZCBmb3IuIElmIEkgd2FzIHRvIHVzZSB0aGUgbmV3IGdvYWxzIG9uIGEN
Cj4+PiBtb3JlIG9yIGxlc3MgcmVndWxhciBiYXNpcywgSSdkIGV4cGVjdCB0aGF0IHRoaXMgZW51
bWVyYXRpb24gb2YgZmlsZXMNCj4+PiBkb2Vzbid0IHJlYWQgX211Y2hfIG1vcmUgc3R1ZmYgZnJv
bSBkaXNrIHRoYW4gaXMgYWN0dWFsbHkgbmVjZXNzYXJ5Lg0KPj4gDQo+PiBPayB3b3VsZCBpdCBi
ZSBvaz8NCj4+IA0KPj4gUEFSU0VfRklMRV9MSVNUIDo9ICQoYWRkc3VmZml4IC5zYWZwYXJzZSwk
KHNoZWxsIGdyZXAgLUVSbCAtLWluY2x1ZGU9XCouaCBcDQo+PiAgICAtLWluY2x1ZGU9XCouYyAn
XltbOmJsYW5rOl1dKlwvXCpbWzpzcGFjZTpdXStTQUYtLipcKlwvJCQnICQoc3JjdHJlZSkpKQ0K
PiANCj4gSG1tLCBub3Qgc3VyZTogLS1pbmNsdWRlIGlzbid0IGEgc3RhbmRhcmQgb3B0aW9uIHRv
IGdyZXAsIGFuZCB3ZQ0KPiBnZW5lcmFsbHkgdHJ5IHRvIGJlIHBvcnRhYmxlLiBBY3R1YWxseSAt
UiAob3IgLXIpIGlzbid0IGVpdGhlci4gSXQNCj4gbWF5IHN0aWxsIGJlIG9rYXkgdGhhdCB3YXkg
aWYgcHJvcGVybHkgZG9jdW1lbnRlZCB3aGVyZSB0aGUgaW52b2x2ZWQNCj4gZ29hbHMgd2lsbCB3
b3JrIGFuZCB3aGVyZSBub3QuDQoNCklzIGEgY29tbWVudCBiZWZvcmUgdGhlIGxpbmUgb2sgYXMg
ZG9jdW1lbnRhdGlvbj8gVG8gc3RhdGUgdGhhdCDigJRpbmNsdWRlIGFuZA0KLVIgYXJlIG5vdCBz
dGFuZGFyZCBvcHRpb25zIHNvIGFuYWx5c2lzLXtjb3Zlcml0eSxlY2xhaXJ9IHdpbGwgbm90IHdv
cmsgd2l0aG91dCBhDQpncmVwIHRoYXQgdGFrZXMgdGhvc2UgcGFyYW1ldGVycz8NCg0KPiANCj4g
QW5kIHRoZW4gLSB3aHkgZG8geW91IGVzY2FwZSBzbGFzaGVzIGluIHRoZSBFUkU/DQo+IA0KPiBU
YWxraW5nIG9mIGVzY2FwaW5nIC0gcGVyc29uYWxseSBJIGZpbmQgYmFja3NsYXNoIGVzY2FwZXMg
aGFyZGVyIHRvDQo+IHJlYWQgLyBncm9rIHRoYW4gcXVvdGF0aW9uLCBzbyBJJ2QgbGlrZSB0byBy
ZWNvbW1lbmQgdXNpbmcgcXVvdGVzDQo+IGFyb3VuZCBlYWNoIG9mIHRoZSB0d28gLS1pbmNsdWRl
IChpZiB0aGV5IHJlbWFpbiBpbiB0aGUgZmlyc3QgcGxhY2UpDQo+IGluc3RlYWQgb2YgdGhlIFwq
IGNvbnN0cnVjdC4NCg0KT2sgSeKAmXZlIHJlbW92ZWQgdGhlIGVzY2FwZSBmcm9tIHRoZSAqIGFu
ZCBhbHNvIGZyb20gc2xhc2hlczoNCg0KUEFSU0VfRklMRV9MSVNUIDo9ICQoYWRkc3VmZml4IC5z
YWZwYXJzZSwkKHNoZWxsIGdyZXAgLUVSbCAtLWluY2x1ZGU9JyouaCcgXA0KICAgIC0taW5jbHVk
ZT0nKi5jJyAnXltbOmJsYW5rOl1dKi9cKltbOnNwYWNlOl1dK1NBRi0uKlwqLyQkJyAkKHNyY3Ry
ZWUpKSkNCg0KPiANCj4+Pj4+PiArCWRvbmUNCj4+Pj4+PiArDQo+Pj4+Pj4gK2FuYWx5c2lzLWJ1
aWxkLSU6IGFuYWx5c2lzLXBhcnNlLXRhZ3MtJQ0KPj4+Pj4+ICsJJChNQUtFKSBPPSQoYWJzX29i
anRyZWUpIC1mICQoc3JjdHJlZSkvTWFrZWZpbGUgYnVpbGQNCj4+Pj4+IA0KPj4+Pj4gVGhpcyBy
dWxlIGRvZXNuJ3QgdXNlIHRoZSBzdGVtLCBzbyBJJ20gc3RydWdnbGluZyB0byB1bmRlcnN0YW5k
IHdoYXQNCj4+Pj4+IHRoaXMgaXMgYWJvdXQuDQo+Pj4+IA0KPj4+PiBZZXMsIGhlcmUgbXkgYWlt
IHdhcyB0byBjYXRjaCBhbmFseXNpcy1idWlsZC17ZWNsYWlyLGNvdmVyaXR5fSwgaGVyZSBJIHNl
ZSB0aGF0IGlmIHRoZSB1c2VyIGhhcyBhIHR5cG8NCj4+Pj4gdGhlIHJ1bGUgd2lsbCBydW4gYW55
d2F5LCBidXQgaXQgd2lsbCBiZSBzdG9wcGVkIGJ5IHRoZSBkZXBlbmRlbmN5IGNoYWluIGJlY2F1
c2UgYXQgdGhlIGVuZCB3ZSBoYXZlOg0KPj4+PiANCj4+Pj4gSlVTVElGSUNBVElPTl9GSUxFUyA6
PSAkKFhFTl9ST09UKS9kb2NzL21pc3JhL3NhZmUuanNvbiBcDQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICQoWEVOX1JPT1QpL2RvY3MvbWlzcmEvZmFsc2UtcG9zaXRpdmUtJCQqLmpzb24NCj4+
Pj4gDQo+Pj4+IFRoYXQgd2lsbCBnaXZlIGFuIGVycm9yIGJlY2F1c2UgJChYRU5fUk9PVCkvZG9j
cy9taXNyYS9mYWxzZS1wb3NpdGl2ZS08dHlwbz4uanNvbiBkb2VzIG5vdCBleGlzdHMuDQo+Pj4+
IA0KPj4+PiBJZiB5b3UgdGhpbmsgaXQgaXMgbm90IGVub3VnaCwgd2hhdCBpZiBJIHJlZHVjZSB0
aGUgc2NvcGUgb2YgdGhlIHJ1bGUgbGlrZSB0aGlzPw0KPj4+PiANCj4+Pj4gX2FuYWx5c2lzLWNv
dmVyaXR5IF9hbmFseXNpcy1lY2xhaXI6IF9hbmFseXNpcy0lOiBhbmFseXNpcy1idWlsZC0lDQo+
Pj4gDQo+Pj4gQnV0IHRoZW4sIHdpdGhvdXQgdXNpbmcgdGhlIHN0ZW0sIGhvdyBkb2VzIGl0IGtu
b3cgd2hldGhlciB0byBkbyBhbg0KPj4+IEVjbGFpciBvciBhIENvdmVyaXR5IHJ1bj8NCj4+IA0K
Pj4gU29ycnkgSSB0aGluayBJ4oCZbSBhIGJpdCBsb3N0IGhlcmUsIHRoZSBtYWtlZmlsZSBpcyB3
b3JraW5nIG9uIGJvdGggYW5hbHlzaXMtY292ZXJpdHkgYW5kIGFuYWx5c2lzLWVjbGFpcg0KPj4g
YmVjYXVzZSB0aGUgJSBpcyBzb2x2aW5nIGluIGNvdmVyaXR5IG9yIGVjbGFpciBkZXBlbmRpbmcg
b24gd2hpY2ggdGhlIG1ha2VmaWxlIGhhcyBpbiBpbnB1dCwgaXQgaXMgbm90IGNvbXBsYWluaW5n
DQo+PiBzbyBJIGd1ZXNzIGl0IHdvcmtzLg0KPj4gRG8geW91IHNlZSBzb21ldGhpbmcgbm90IHdv
cmtpbmc/IElmIHNvLCBhcmUgeW91IGFibGUgdG8gcHJvdmlkZSBhIHBpZWNlIG9mIGNvZGUgZm9y
IHRoYXQgdG8gbWFrZSBtZSB1bmRlcnN0YW5kPw0KPiANCj4gV2VsbCwgbXkgcHJvYmxlbSBpcyB0
aGF0IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgZGlzdGluY3Rpb24gaXMgY29udmV5ZWQNCj4gd2l0aG91
dCB0aGUgc3RlbSBiZWluZyB1c2VkLiBXaXRoIHdoYXQgeW91IHNheSBJIHVuZGVyc3RhbmQgSSdt
DQo+IG92ZXJsb29raW5nIHNvbWV0aGluZywgc28gSSdkIGFwcHJlY2lhdGUgc29tZSBleHBsYW5h
dGlvbiBvciBhdCBsZWFzdA0KPiBhIHBvaW50ZXIuDQoNCk9rLCBJIGhhdmUgdGhhdCBlY2xhaXIg
YW5kIGNvdmVyaXR5IHNoYXJlcyB0aGUgc2FtZSBjb21tYW5kcyB0byBiZSBleGVjdXRlZCBieSB0
aGUgYnVpbGQgc3lzdGVtLA0Kc28gaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUgdGFyZ2V0cyBm
b3IgY292ZXJpdHkgYW5kIGVjbGFpciBhbmQgdGhlaXIgcmVjaXBlLCBJ4oCZdmUgdXNlZCB0aGUg
cGF0dGVybiBydWxlDQp0byBoYXZlIHRoYXQgdGhlc2UgcnVsZXM6DQoNCkpVU1RJRklDQVRJT05f
RklMRVMgOj0gJChYRU5fUk9PVCkvZG9jcy9taXNyYS9zYWZlLmpzb24gXA0KICAgICAgICAgICAg
ICAgICAgICAgICAkKFhFTl9ST09UKS9kb2NzL21pc3JhL2ZhbHNlLXBvc2l0aXZlLSQkKi5qc29u
DQoNClvigKZdDQoNCi5TRUNPTkRFWFBBTlNJT046DQokKG9ianRyZWUpLyUuc2VkOiAkKHNyY3Ry
ZWUpL3Rvb2xzL3hlbmZ1c2EtZ2VuLXRhZ3MucHkgJChKVVNUSUZJQ0FUSU9OX0ZJTEVTKQ0KICAg
IFvigKZdDQoNClvigKZdDQoNCmFuYWx5c2lzLXBhcnNlLXRhZ3MtJTogJChQQVJTRV9GSUxFX0xJ
U1QpICQob2JqdHJlZSkvJS5zZWQNCiAgICBb4oCmXQ0KDQphbmFseXNpcy1idWlsZC0lOiBhbmFs
eXNpcy1wYXJzZS10YWdzLSUNCiAgICAkKE1BS0UpIE89JChhYnNfb2JqdHJlZSkgLWYgJChzcmN0
cmVlKS9NYWtlZmlsZSBidWlsZA0KDQphbmFseXNpcy1jbGVhbjoNCiAgIFvigKZdDQoNCl9hbmFs
eXNpcy0lOiBhbmFseXNpcy1idWlsZC0lDQogICAgJChRKSQoTUFLRSkgTz0kKGFic19vYmp0cmVl
KSAtZiAkKHNyY3RyZWUpL01ha2VmaWxlIGFuYWx5c2lzLWNsZWFuDQoNCk1hdGNoZXMgdGhlIGNh
c2Ugd2hlcmUgJ21ha2UgYW5hbHlzaXMtY292ZXJpdHnigJkgb3Ig4oCYbWFrZSBhbmFseXNpcy1l
Y2xhaXLigJkgaXMgY2FsbGVkLg0KDQpOb3csIHBsZWFzZSBjb3JyZWN0IG1lIGlmIG15IGFzc3Vt
cHRpb24gb24gdGhlIHdheSBtYWtlIHdvcmtzIGFyZSB3cm9uZywgaGVyZSBteSBhc3N1bXB0aW9u
czoNCg0KRm9yIGV4YW1wbGUgd2hlbiDigJhtYWtlIGFuYWx5c2lzLWNvdmVyaXR54oCZIGlzIGNh
bGxlZCB3ZSBoYXZlIHRoYXQgdGhpcyBydWxlIGlzIHRoZSBiZXN0IG1hdGNoIGZvciB0aGUNCmNh
bGxlZCB0YXJnZXQ6DQoNCl9hbmFseXNpcy0lOg0KDQpTbyBhbnl0aGluZyBhZnRlciBfYW5hbHlz
aXMtIHdpbGwgYmUgY2FwdHVyZWQgd2l0aCAlIGFuZCB0aGlzIHdpbGwgYmUgdHJhbnNmZXJyZWQg
dG8gdGhlIGRlcGVuZGVuY3kNCm9mIHRoZSB0YXJnZXQgdGhhdCBpcyBhbmFseXNpcy1idWlsZC0l
IC0+IGFuYWx5c2lzLWJ1aWxkLWNvdmVyaXR5DQoNCk5vdyBhbmFseXNpcy1idWlsZC1jb3Zlcml0
eSB3aWxsIGJlIGNhbGxlZCwgdGhlIGJlc3QgbWF0Y2ggaXMgYW5hbHlzaXMtYnVpbGQtJSwgc28g
YWdhaW4gdGhlIGRlcGVuZGVuY3kNCndoaWNoIGlzIGFuYWx5c2lzLXBhcnNlLXRhZ3MtJSwgd2ls
bCBiZSB0cmFuc2xhdGVkIHRvIGFuYWx5c2lzLXBhcnNlLXRhZ3MtY292ZXJpdHkuDQoNCk5vdyBh
bmFseXNpcy1wYXJzZS10YWdzLWNvdmVyaXR5IHdpbGwgYmUgY2FsbGVkLCB0aGUgYmVzdCBtYXRj
aCBpcyBhbmFseXNpcy1wYXJzZS10YWdzLSUsIHNvIHRoZSAlIHdpbGwNCkhhdmUgdGhlIOKAmGNv
dmVyaXR54oCZIHZhbHVlIGFuZCBpbiB0aGUgZGVwZW5kZW5jeSB3ZSB3aWxsIGhhdmUgJChvYmp0
cmVlKS8lLnNlZCAtPiAkKG9ianRyZWUpL2NvdmVyaXR5LnNlZC4NCg0KTG9va2luZyBmb3IgJChv
Ymp0cmVlKS9jb3Zlcml0eS5zZWQgdGhlIGJlc3QgbWF0Y2ggaXMgJChvYmp0cmVlKS8lLnNlZCwg
d2hpY2ggd2lsbCBoYXZlICQoSlVTVElGSUNBVElPTl9GSUxFUykNCmFuZCB0aGUgcHl0aG9uIHNj
cmlwdCBpbiB0aGUgZGVwZW5kZW5jeSwgaGVyZSB3ZSB3aWxsIHVzZSB0aGUgc2Vjb25kIGV4cGFu
c2lvbiB0byBzb2x2ZQ0KJChYRU5fUk9PVCkvZG9jcy9taXNyYS9mYWxzZS1wb3NpdGl2ZS0kJCou
anNvbiBpbiAkKFhFTl9ST09UKS9kb2NzL21pc3JhL2ZhbHNlLXBvc2l0aXZlLWNvdmVyaXR5Lmpz
b24NCg0KU28gbm93IGFmdGVyIGFuYWx5c2lzLXBhcnNlLXRhZ3MtY292ZXJpdHkgaGFzIGVuZGVk
IGl0cyBkZXBlbmRlbmN5IGl0IHdpbGwgc3RhcnQgd2l0aCBpdHMgcmVjaXBlLCBhZnRlciBpdCBm
aW5pc2hlcywNCnRoZSByZWNpcGUgb2YgYW5hbHlzaXMtYnVpbGQtY292ZXJpdHkgd2lsbCBzdGFy
dCBhbmQgaXQgd2lsbCBjYWxsIG1ha2UgdG8gYWN0dWFsbHkgYnVpbGQgWGVuLg0KDQpBZnRlciB0
aGUgYnVpbGQgZmluaXNoZXMsIGlmIHRoZSBzdGF0dXMgaXMgZ29vZCwgdGhlIGFuYWx5c2lzLWJ1
aWxkLWNvdmVyaXR5IGhhcyBmaW5pc2hlZCBhbmQgdGhlIF9hbmFseXNpcy1jb3Zlcml0eQ0KcmVj
aXBlIGNhbiBub3cgcnVuLCBpdCB3aWxsIGNhbGwgbWFrZSB3aXRoIHRoZSBhbmFseXNpcy1jbGVh
biB0YXJnZXQsIHJlc3RvcmluZyBhbnkgPGZpbGU+LntjLGh9LnNhZnBhcnNlIHRvIDxmaWxlPi57
YyxofS4NCg0KV2Ugd2lsbCBoYXZlIHRoZSBzYW1lIHdpdGgg4oCYbWFrZSBhbmFseXNpcy1lY2xh
aXLigJksIGlmIHdlIGRvIGEgbWlzdGFrZSB0eXBpbmcsIGxpa2Ug4oCYbWFrZSBhbmFseXNpcy1j
b3ZlcmnigJksIHdlIHdpbGwNCmhhdmU6DQoNCm1ha2U6IEVudGVyaW5nIGRpcmVjdG9yeSDigJgv
cGF0aC90by94ZW4veGVuJw0KbWFrZTogKioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJ2FuYWx5
c2lzLWNvdmVyaScuICBTdG9wLg0KbWFrZTogTGVhdmluZyBkaXJlY3RvcnkgJy9wYXRoL3RvL3hl
bi94ZW4nDQoNCg0KDQo+IA0KPj4+PiBPciwgaWYgeW91IGFyZSBzdGlsbCB3b3JyaWVkIGFib3V0
IOKAnGFuYWx5c2lzLWJ1aWxkLSU6IGFuYWx5c2lzLXBhcnNlLXRhZ3MtJeKAnSwgdGhlbiBJIGNh
biBkbyBzb21ldGhpbmcNCj4+Pj4gbGlrZSB0aGlzOiANCj4+Pj4gDQo+Pj4+IGFuYWx5c2lzLXN1
cHBvcnRlZC1jb3Zlcml0eSBhbmFseXNpcy1zdXBwb3J0ZWQtZWNsYWlyOg0KPj4+PiAgIEBlY2hv
ID4gL2Rldi9udWxsDQo+Pj4+IA0KPj4+PiBhbmFseXNpcy1zdXBwb3J0ZWQtJToNCj4+Pj4gICBA
ZXJyb3IgVW5zdXBwb3J0ZWQgYW5hbHlzaXMgdG9vbCBAKg0KPj4+PiANCj4+Pj4gYW5hbHlzaXMt
YnVpbGQtJTogYW5hbHlzaXMtcGFyc2UtdGFncy0lIHwgYW5hbHlzaXMtc3VwcG9ydGVkLSUNCj4+
Pj4gICAkKE1BS0UpIE89JChhYnNfb2JqdHJlZSkgLWYgJChzcmN0cmVlKS9NYWtlZmlsZSBidWls
ZA0KPj4+IA0KPj4+IElmIEknbSBub3QgbWlzdGFrZW4gc3VwcG9ydCBmb3IgfCBkb2Vzbid0IGV4
aXN0IGluIG1ha2UgMy44MCAodGhlDQo+Pj4gbWluaW11bSB2ZXJzaW9uIHdlIHJlcXVpcmUgdG8g
YmUgdXNlZCkuDQo+PiANCj4+IElESywgd2UgdXNlIG9yZGVyLW9ubHkgcHJlcmVxdWlzaXRlIGFs
cmVhZHkgaW4gdGhlIE1ha2VmaWxlLg0KPiANCj4gSG1tLCB5ZXMsIGZvciAkKG9ianRyZWUpLyUu
Yy5jcHBjaGVjazogLiBRdWVzdGlvbiBpcyB3aGV0aGVyIHRoaXMgd2FzDQo+IHNpbXBseSBvdmVy
bG9va2VkIGJlZm9yZS4gQXMgc2FpZCBhYm92ZSBzdWNoIG1heSBiZSBva2F5IGZvciB0aGVzZQ0K
PiBzcGVjaWFsIGdvYWxzLCBidXQgdGhpcyBuZWVkcyBwcm9wZXJseSBkb2N1bWVudGluZyB0aGVu
Lg0KPiANCj4+Pj4+PiArYW5hbHlzaXMtY2xlYW46DQo+Pj4+Pj4gKyMgUmV2ZXJ0cyB0aGUgb3Jp
Z2luYWwgZmlsZSAoLXAgcHJlc2VydmVzIGFsc28gdGltZXN0YW1wKQ0KPj4+Pj4+ICsJJChRKWZp
bmQgJChzcmN0cmVlKSAtdHlwZSBmIC1uYW1lICIqLnNhZnBhcnNlIiAtcHJpbnQgfCBcDQo+Pj4+
Pj4gKwl3aGlsZSBJRlM9IHJlYWQgZmlsZTsgZG8gXA0KPj4+Pj4+ICsJCWNwIC1wICIkJHtmaWxl
fSIgIiQke2ZpbGUlLnNhZnBhcnNlfSI7IFwNCj4+Pj4+PiArCQlybSAtZiAiJCR7ZmlsZX0iOyBc
DQo+Pj4+PiANCj4+Pj4+IFdoeSBub3QgIm12Ij8NCj4+Pj4+IA0KPj4+Pj4+ICsJZG9uZQ0KPj4+
Pj4+ICsNCj4+Pj4+PiArX2FuYWx5c2lzLSU6IGFuYWx5c2lzLWJ1aWxkLSUNCj4+Pj4+PiArCSQo
USkkKE1BS0UpIE89JChhYnNfb2JqdHJlZSkgLWYgJChzcmN0cmVlKS9NYWtlZmlsZSBhbmFseXNp
cy1jbGVhbg0KPj4+Pj4gDQo+Pj4+PiBBZ2FpbiBubyB1c2Ugb2YgdGhlIHN0ZW0sIHBsdXMgaGVy
ZSBJIHdvbmRlciBpZiB0aGlzIG1heSBub3QgbGVhZCB0bw0KPj4+Pj4gcGVvcGxlIGludm9raW5n
ICJhbmFseXNpcy1jbGVhbiIgd2l0aG91dCBoYXZpbmcgc2FpZCBhbnl0aGluZyBhYm91dA0KPj4+
Pj4gY2xlYW5pbmcgb24gdGhlaXIgY29tbWFuZCBsaW5lLg0KPj4+PiANCj4+Pj4gSW4gYW55IGNh
c2UsIHRoZSBjbGVhbmluZyBwcm9jZXNzIGlzIHZlcnkgc2FmZSBhbmQgZG9lcyBub3QgY2xlYW4g
YW55dGhpbmcgdGhhdCB3YXMgbm90IGRpcnR5IGJlZm9yZSwNCj4+Pj4gc28gaW4gY2FzZSBvZiB0
eXBvcywgaXTigJlzIGp1c3QgbGlrZSBhIG5vcC4NCj4+PiANCj4+PiBQZW9wbGUgbWF5IHB1dCB0
cmFuc2llbnQgZmlsZXMgaW4gdGhlaXIgdHJlZXMuIE9mIGNvdXJzZSB0aGV5IG5lZWQgdG8gYmUN
Cj4+PiBhd2FyZSB0aGF0IHdoZW4gdGhleSBzcGVjaWZ5IGEgImNsZWFuIiB0YXJnZXQgdGhlaXIg
ZmlsZXMgbWF5IGJlIGRlbGV0ZWQuDQo+Pj4gQnV0IHdpdGhvdXQgYW55ICJjbGVhbiIgdGFyZ2V0
IHNwZWNpZmllZCBub3RoaW5nIHNob3VsZCBiZSByZW1vdmVkLg0KPj4gDQo+PiAqLnNhZnBhcnNl
IGZpbGVzIGFyZSBub3Qgc3VwcG9zZWQgdG8gYmUgdXNlZCBmcmVlbHkgYnkgdXNlciBpbiB0aGVp
ciB0cmVlLCB0aG9zZQ0KPj4gZmlsZXMgd2lsbCBiZSByZW1vdmVkIG9ubHkgaWYgdGhlIHVzZXIg
Y2FsbHMgdGhlIOKAnGFuYWx5c2lzLWNsZWFu4oCdIHRhcmdldCBvciBpZiB0aGUNCj4+IGFuYWx5
c2lzLWNvdmVyaXR5IG9yIGFuYWx5c2lzLWVjbGFpciByZWFjaGVzIHRoZSBlbmQgKGEgcHJvY2Vz
cyB0aGF0IGNyZWF0ZXMgKi5zYWZwYXJzZSkuDQo+PiANCj4+IFRoZXJlIGlzIG5vIG90aGVyIHdh
eSB0byB0cmlnZ2VyIHRoZSDigJxhbmFseXNpcy1jbGVhbuKAnSB1bmludGVudGlvbmFsbHksIHNv
IEnigJltIG5vdCBzdXJlIGFib3V0DQo+PiB0aGUgbW9kaWZpY2F0aW9uIHlvdSB3b3VsZCBsaWtl
IHRvIHNlZSB0aGVyZS4NCj4gDQo+IEkgZ3Vlc3MgSSBkb24ndCB1bmRlcnN0YW5kOiBZb3UgaGF2
ZSBfYW5hbHlzaXMtJSBhcyB0aGUgdGFyZ2V0LCB3aGljaCBJJ2QNCj4gYXNzdW1lIHdpbGwgaGFu
ZGxlIF9hbmFseXNpcy1jbGVhbiBqdXN0IGFzIG11Y2ggYXMgX2FuYWx5c2lzLWFiYy4gVGhpcyBt
YXkNCj4gYmUgY29ubmVjdGVkIHRvIG15IGxhY2sgb2YgdW5kZXJzdGFuZGluZyBhcyBleHByZXNz
ZWQgZnVydGhlciB1cC4gT3IgbWF5YmUNCj4gSSdtIHNpbXBseSBub3QgdW5kZXJzdGFuZGluZyB3
aGF0IHRoZSBfYW5hbHlzaXMtJSB0YXJnZXQgaXMgYWJvdXQgaW4gdGhlDQo+IGZpcnN0IHBsYWNl
LCBiZWNhdXNlIHdpdGggdGhlIGFuYWx5c2lzLWJ1aWxkLSUgZGVwZW5kZW5jeSBJIGRvbid0IHNl
ZSBob3cNCj4gX2FuYWx5c2lzLWNsZWFuIHdvdWxkIGFjdHVhbGx5IHdvcmsgKHdpdGggdGhlIHNj
b3BlIHJlc3RyaWN0aW9uIHlvdQ0KPiBzdWdnZXN0ZWQgZWFybGllciBhIHJ1bGUgZm9yIGFuYWx5
c2lzLWJ1aWxkLWNsZWFuIHdvdWxkIG5vdCBiZSBmb3VuZA0KPiBhZmFpY3QpLg0KDQpfYW5hbHlz
aXMtY2xlYW4gd2lsbCBub3Qgd29yaywgbmVpdGhlciBfYW5hbHlzaXMtYWJjLCBiZWNhdXNlIG9m
IHdoYXQgSSB3cm90ZSBhYm92ZS4NCmFuYWx5c2lzLWNsZWFuIGluc3RlYWQgaXMgY2FsbGVkIGZy
b20gdGhlIHJlY2lwZSBvZiBfYW5hbHlzaXMtJSBpZiBhbGwgaXRzIGRlcGVuZGVuY3kgYXJlDQpi
dWlsdCBjb3JyZWN0bHksIG90aGVyd2lzZSBpdOKAmXMgdGhlIHVzZXIgdGhhdCBuZWVkcyB0byBj
YWxsIGl0IGRpcmVjdGx5IGJ5IGRvaW5nIOKAnG1ha2UgYW5hbHlzaXMtY2xlYW7igJ0uDQoNCg0K
DQo+IA0KPiBKYW4NCg0K

