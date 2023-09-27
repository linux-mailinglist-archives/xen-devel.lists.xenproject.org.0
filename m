Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0F7B026D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 13:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608904.947709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlSPx-0000KI-6B; Wed, 27 Sep 2023 11:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608904.947709; Wed, 27 Sep 2023 11:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlSPx-0000Hh-2O; Wed, 27 Sep 2023 11:09:21 +0000
Received: by outflank-mailman (input) for mailman id 608904;
 Wed, 27 Sep 2023 11:09:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xec+=FL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qlSPv-000051-ES
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 11:09:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c69efd0-5d26-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 13:09:18 +0200 (CEST)
Received: from DUZPR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::9) by AS2PR08MB9973.eurprd08.prod.outlook.com
 (2603:10a6:20b:641::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 11:09:14 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46b:cafe::ac) by DUZPR01CA0016.outlook.office365.com
 (2603:10a6:10:46b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Wed, 27 Sep 2023 11:09:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Wed, 27 Sep 2023 11:09:14 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Wed, 27 Sep 2023 11:09:14 +0000
Received: from 2ea9abc1efe2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 422D3FBB-B71D-47B6-9A50-C122DEEB32BE.1; 
 Wed, 27 Sep 2023 11:08:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ea9abc1efe2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 11:08:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8283.eurprd08.prod.outlook.com (2603:10a6:150:a4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 11:08:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 11:08:19 +0000
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
X-Inumbo-ID: 4c69efd0-5d26-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo82qcgFDD0QuxFm2go0rK0O3yo7G49KduV5dYacupE=;
 b=cycRwxNkSqNmT1IKHkMgzBhkgI3KBIO128fIz19m6NyLnbkvmltaI3cf56TP3TCA4DWXTi8sAuFTAldj9okL+bvxjbj2qS5cgfGMTQqGjhJaNVJ/7IkNodmIra4n4MIyRhAeY1k+aIW1r2E2Ax3tvsBXNKyvIvS4W5D1GReltRY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6e13fe187c69d8f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVGjtV2UrqE3VGWa0WNippoGP3U2YuxIQZQv5rfvjdTFHZ4DPyG2PiKgqQhCpznkWH6Gq+Nk2PhHthH7eeL9/yY7NsQ8QDOqK2cKINWH46oiNegY64/3oqOdcofSANMcjvALRIDEfK8UCjspNGEK3reN4f9a7TR5Ln/xmru+ziUwi+4kPVskuwyztxn5AKnoLDV5nNed2FlbIOtVCHVHv0WjwYDWXGwaGtAIgVWygrt4TVqE5tV55kc5H+VbKkG6TEyv3VXh6IaG66295X6G0C1z0+KxA4vaIPGhr1/Enose8M62y9hB6uCu2NX6dShqqAJ0XT0Q5FoZVTcLFnUmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo82qcgFDD0QuxFm2go0rK0O3yo7G49KduV5dYacupE=;
 b=A9D8ZvPgC4xLzAqdp4I2p/1DVCYlI1iEDMMktN4pof28MDGjxj7//guNZQ8Vanl6dzRr2Bc6DsQDKTKBvPVQFKW1LDfw8R2TUf2nBz4o6ab/fEhK9YQLgPVyxmNkcxC2cZuF4wKKR7AvBqf4kONF4Gam6GN7u//nDWb3/8b31oEzSbXoreL6iglNtzUpDa5mVZXIN0CMCiD9aKLi4XgrO4FwsUH0ZYGGlKvS+7LTs799n5f1IzJANuhnxaxreMxA2Y7ErWDppVfL2Z+S0k0zO6z4vcp/Fk6KAJx8mAzO9bYw+91iuONQ18fTvRRG3LfjBQ53qHtAwpdBKyaQ7etD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo82qcgFDD0QuxFm2go0rK0O3yo7G49KduV5dYacupE=;
 b=cycRwxNkSqNmT1IKHkMgzBhkgI3KBIO128fIz19m6NyLnbkvmltaI3cf56TP3TCA4DWXTi8sAuFTAldj9okL+bvxjbj2qS5cgfGMTQqGjhJaNVJ/7IkNodmIra4n4MIyRhAeY1k+aIW1r2E2Ax3tvsBXNKyvIvS4W5D1GReltRY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, "julien@xen.org"
	<julien@xen.org>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Topic: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Index: AQHZ8RfN02/rDlrXwEmUei6wT31DmLAuUyoAgAACh4CAAANEAIAAKqUA
Date: Wed, 27 Sep 2023 11:08:19 +0000
Message-ID: <0DE75F8A-5D10-4E2F-B37C-74C758E0DAFE@arm.com>
References: <20230908230318.1719290-1-sstabellini@kernel.org>
 <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
 <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
 <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
 <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
 <3002e10a-29d9-45f0-c3c2-ef79ec775934@suse.com>
 <971283B6-65BB-4D5F-BB04-E1C8A2AC0826@arm.com>
In-Reply-To: <971283B6-65BB-4D5F-BB04-E1C8A2AC0826@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8283:EE_|DBAEUR03FT019:EE_|AS2PR08MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: 0459e13f-97e4-4396-4d7b-08dbbf4a2f2a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7N6RribvYf1e9SzLbi8Lj67Dl9X2SSsXuQ58FXYpSpx8r4Jga4y4MrvjmffamhxXcp0lB8q/Bw5nWOPo9JuyBJdLfNNbvxI2TcO2WUq83cC6fICcuq+7tTfUyAvMMrMwGSFtkMVZjiWnjVv8FpYhjB4SpNNnAcXAHsARVTjiAKznJwILyzJnYy7BqkyUni9ep3Bb21UXKegVE8ag4iUz8n9mt4x3OhJ11K37++0eKx+AJIpH8H1NyHV3ceivrty7oR7uFwaDO70sQtenwI40fGPS01nIk/VGCrB9BykZSfSkgxyx8lLANG2IoBqoynkAXINyOrrRwZ0zHIiImUNF5jcfVo/6AKAPawryHGneFTlD8jgrm+wHUsW+3a3lArFla/AhDLklrzTX1qoNR6KnLUZBY6X3rAxttejpryk4DvCkl5AOaDGm0zwR0jV2BRDUnfmhAB3ybi3aeSGxCFp1CeHg0A+X+XTUdgCkMuF67ieZ5Jg5KePr51LOfjkQoGFA8qW+jvwdStC1uNG33tIoJhLz0XGIXGCAPPYxA9xQ4Ijam7QALGL9BtaRNVSCsbaAul7dO0rLZGaVe52wwafc82kGeOd3AbgJLxukhBc/Kg60KNhEdQfkIn1XOwNzSTM/MEqxrjKOtIX6KVn1BP8HOA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(186009)(1800799009)(451199024)(122000001)(6512007)(6486002)(6506007)(53546011)(26005)(71200400001)(2616005)(6636002)(41300700001)(91956017)(37006003)(66446008)(316002)(64756008)(66476007)(54906003)(76116006)(66556008)(66946007)(2906002)(6862004)(7416002)(33656002)(8936002)(8676002)(38100700002)(86362001)(4326008)(5660300002)(38070700005)(36756003)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6B15D071EAD9744A663710484E9A5C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8283
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	43f8ea57-d800-4844-5834-08dbbf4a0e88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4BrHkIo6q3JsBuBUGOfQwVjKouuWoRZ7ruxzd7EKahquGa63OUKsz2R/b4dqYSoNTdn7tdA76slMnqmUASW/k3VSr/BiuGq8WqIITZ6gnqKB/WntG33K+bOXLISyGt76DrhxAv0effXtqGp7kxJqepjXB3samfzSObcrhVWB6RQ8dyCRM7j4LjVulQ2Fn4IylHFHcaWON7vnyoQnNc3Eiba+JOVesdJN73XbQcdArDrLvI33+yHmbWmYeMv/PqIUys+TdsOr3gfu8iVKDLwi2M0bDcUYOhG9/htIDDeqsH1R7TXN6y4gwOXa4jzHN5rX1pg/3+wZT+BdU5FYz+hVoQMxxs1v+KqRTIrJ7CE3MQad+6KoaYdlTvLvQi+6JZ3ds6lu3L6/ihMvwZnxCObYwSO5jdFCEze6ongEz52Fl4iqH3K/g1fv0hGmCFBLtMj2MsWSuf2ccu7Ot2LTOYlst3m13n+eAbvRL4z+VFPMqrIhYeU04jGs4+Yoc+xOoJyiDYNh4MMgxt3BWN5SMqo6rh8rfmjaqE43rEIvKOCGFah7g/m+sUzaeC5WnPYVv4B9SQFuvPRBoZI1UUiATNKZR5L2TA5XzEhaVX4jJq0sqNzFqbnuH0yhSleLm4rGHKuTcbDzQBoarV6Fb4yvFEBoqOkX+hbBl2lP4CXd3KC2aBCJrEDfIcsgd0m6YZOQ48dijuIceP6gpWwfg9MLu2OZKNJaW8WkTpATjKhvN62ym/QeftF1uNchdAEiYXp/L+OA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(86362001)(478600001)(33656002)(5660300002)(6512007)(6506007)(36756003)(53546011)(81166007)(6486002)(82740400003)(356005)(47076005)(40480700001)(6862004)(4326008)(8936002)(2616005)(41300700001)(8676002)(26005)(336012)(70206006)(54906003)(70586007)(37006003)(36860700001)(316002)(6636002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 11:09:14.2375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0459e13f-97e4-4396-4d7b-08dbbf4a2f2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9973

DQoNCj4gT24gMjcgU2VwIDIwMjMsIGF0IDA5OjM1LCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgSmFuLA0KPiANCj4+IE9uIDI3IFNl
cCAyMDIzLCBhdCAxMDoyMywgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToN
Cj4+IA0KPj4gT24gMjcuMDkuMjAyMyAxMDoxNCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+
Pj4gT24gMjcgU2VwIDIwMjMsIGF0IDA5OjUzLCBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJp
bmlAYnVnc2VuZy5jb20+IHdyb3RlOg0KPj4+PiBNeSBvcGluaW9uIGlzIHRoYXQgaXQncyBmYXIg
ZWFzaWVyIGZvciB0aGlzIHRvIGJlIGFuIGVjbGFpciBjb25maWd1cmF0aW9uICh3aGljaCBoYXMg
dGhlDQo+Pj4+IGFkdmFudGFnZSBub3QgdG8gZGVwZW5kIG9uIHRoZSBleGFjdCBkZWZpbml0aW9u
IG9mIHVucmVhY2hhYmxlKSBhbmQgdGhlbiBwZXJoYXBzIGEgY29tbWVudA0KPj4+PiBhYm92ZSBp
dCBleHBsYWluaW5nIHRoZSBzaXR1YXRpb24uDQo+Pj4gDQo+Pj4gSSBhZ3JlZSBoZXJlIGFuZCBp
dCBpcyBlYXNpZXIgdG8gbWFrZSBhbiBvdmVyYWxsIGV4Y2VwdGlvbiB3aGVyZSB3ZSBsaXN0IHRo
ZSBjYXNlcw0KPj4+IHdoZXJlIHRoaXMgaXMgYWNjZXB0YWJsZSAoaWUgYWxsIGZsYXZvcnMgb2Yg
dW5yZWFjaGVhYmxlKSBhbmQgZG9jdW1lbnQgdGhhdCBlY2xhaXINCj4+PiB3YXMgY29uZmlndXJl
ZCB1c2luZyAieHh4eCIgdG8gaGFuZGxlIHRoaXMuDQo+PiANCj4+IFdoYXQgYWJvdXQgY3BwY2hl
Y2sgdGhlbiwgZm9yIGV4YW1wbGU/DQo+IA0KPiBHb29kIHBvaW50IHdlIHNob3VsZCBjaGVjayBp
ZiBjcHBjaGVjayBvciBjb3Zlcml0eSBjYW4gZG8gc3VjaCB0aGluZ3MuDQo+IEBMdWNhOiBhbnkg
aWRlYSA/DQoNClNvLCBmb3IgY3BwY2hlY2sgSSBkb27igJl0IHRoaW5rIHdlIGhhdmUgc3VjaCBn
cmFudWxhcml0eSwgdGhlIG9ubHkgdGhpbmcgd2UgY2FuIGRvIGFyZSBzdXBwcmVzcyBhbGwgdmlv
bGF0aW9ucw0KZm9yIGEgZmlsZSwgc3VwcHJlc3Mgc29tZSB2aW9sYXRpb25zIGZvciBhIGZpbGUg
b3Igc3VwcHJlc3MgZ2xvYmFsbHkgYWxsIHZpb2xhdGlvbnMgcmVnYXJkaW5nIGNlcnRhaW4gcnVs
ZXMuDQoNCkZvciBjb3Zlcml0eSwgSeKAmXZlIGZvdW5kIHRoZSB3YXkgdG8gcmVtb3ZlIGZpbGVz
ICh0cmFuc2xhdGlvbiB1bml0cykgZnJvbSB0aGUgcmVwb3J0LCBidXQgSSBkaWRu4oCZdCBmaW5k
IGFueXRoaW5nDQphYm91dCBob3cgdG8gc3BlY2lmeSBzb21lIHBhdHRlcm5zIHRvIGJlIGV4Y2x1
ZGVkLiBGb3Igbm93IEkgY2FuIG9ubHkgZXhjbHVkZSBlbnRpcmUgZmlsZXMgb3IgSSBjYW4gZXhj
bHVkZQ0KcnVsZXMgZ2xvYmFsbHkuDQpJIHdpbGwgdHJ5IHRvIGdldCBzb21lIHN1cHBvcnQgZnJv
bSBTeW5vcHN5cyB0byBzZWUgaWYgdGhlcmUgaXMgYW55IHdheSB0byBzcGVjaWZ5IHNvbWUgZXhj
bHVzaW9uIHBhdHRlcm4gZm9yDQpzcGVjaWZpYyBydWxlcy4NCg0KQW55d2F5IEnigJl2ZSBydW4g
Q292ZXJpdHkgYW5kIGZvciB0aGUgMi4xIGl0IGlzIGZpbmRpbmcgMTQgdmlvbGF0aW9ucyBidXQg
bm9uZSBvZiB0aGVtIGFyZSBhYm91dCBfX2J1aWx0aW5fdW5yZWFjaGFibGUoKS4NCg0KSeKAmXZl
IGFsc28gcnVuIENwcGNoZWNrIGFuZCBpdCBpcyBub3QgY29tcGxhaW5pbmcsIG5vdCB0aGF0IEkg
d2FzIGxvb2tpbmcgZm9yIGl0IHRvIGJlIGEgYmVuY2htYXJrIGluIGFueSBjYXNlIQ0KDQpTbyBJ
IGd1ZXNzIEVjbGFpciBpcyBtb3JlIHN0cmljdCBvbiB0aGUgY2hlY2tzIGFuZCBuZWVkcyB0byBo
YXZlIGEgcHJvcGVyIGNvbmZpZ3VyYXRpb24gdGhhdCBjYW7igJl0IGJlIGdlbmVyYWxpc2VkDQpm
b3IgYWxsIHRoZSB0b29scy4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg==

