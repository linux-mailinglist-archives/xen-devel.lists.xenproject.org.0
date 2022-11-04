Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B68618E93
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 04:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437248.691484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqn2d-0005h9-TW; Fri, 04 Nov 2022 03:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437248.691484; Fri, 04 Nov 2022 03:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqn2d-0005e7-Q0; Fri, 04 Nov 2022 03:06:47 +0000
Received: by outflank-mailman (input) for mailman id 437248;
 Fri, 04 Nov 2022 03:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKjc=3E=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqn2c-0005e1-LT
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 03:06:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6ba5f21-5bed-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 04:06:45 +0100 (CET)
Received: from DB6PR0301CA0031.eurprd03.prod.outlook.com (2603:10a6:4:3e::41)
 by DB9PR08MB7399.eurprd08.prod.outlook.com (2603:10a6:10:371::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 4 Nov
 2022 03:06:35 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::38) by DB6PR0301CA0031.outlook.office365.com
 (2603:10a6:4:3e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 03:06:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 03:06:34 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 04 Nov 2022 03:06:34 +0000
Received: from c85e0916c095.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 566A5C33-3932-484B-88FB-68147DB54A04.1; 
 Fri, 04 Nov 2022 03:06:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c85e0916c095.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 03:06:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9002.eurprd08.prod.outlook.com (2603:10a6:10:467::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 03:06:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 4 Nov 2022
 03:06:21 +0000
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
X-Inumbo-ID: b6ba5f21-5bed-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FnaxPyhF/pluwCHwd1FyqRAfFomuY+nzuH9vepMDbDBSKDyGJsfo+O1oNEqmZlxXIytNGEvQtre2g8k9Ke55b3NboI3UpVooTddPbB8M8mZuKLIOoooMhRFiw7UDk6TBmSTzVZS9mdWR8fVWaF/7hnGksQNwhYO4qvYq8ezylhCYy4n4PbizvimSJeQFepo1ci5O95xs2q6dNdH0TfhLafwFDjPSim5f5sTNVEfSei4ttRuekfnG3+141wxWfqrDVsaVLFgNrqNrChGBYkZrvwZn4ywmqfj7gt1dFOUpGUQTgn4oRbDRH9Mnq0ihj9ztRtu7G9v6sYxjUfLJGc2BVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeZfdRogX/r+zVTMHCsQ5iFcWzisNuN5PB7+2sEschk=;
 b=NHJ9TVWHjwi+c7To0SOqOkNRP+yUvo3rUGOwp5aTLOvTBeWzrw2wZNwzQYcNjPv5lSHrNZo4UZmz7ifrMpPut7YStsMF9UurMmWPED63X+bEm9ZsGO0kH1ddSIxBaSzA+E8L7keA0sJS75+sJeRXarWTVNhqsX+yAJ5eQPtZb+I4YgthkE61GB/XtbVhvgEAeXLyv7yIqlFDlTZVcIxBwITVn1+swCCkSUeYP/PpQ8HFa7JbeyrhTdk1lkAfOd2ftaEo1bCXPxTCcE0AqlEBaThMCQ2ZIOKklxktfdaXzT+xpxlj21yho1sO6pTlCEmGBYrv7EAAujismF6699yfNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeZfdRogX/r+zVTMHCsQ5iFcWzisNuN5PB7+2sEschk=;
 b=afUhlIiRr0UvGDX+wnQSN4yk27dnIEftkT7rqUoWekSrm+VOPBfjyuaYOGvgt5XnTVThO8OelyYrNf8H2aU76+W90CT6MtsOlU8YKzhnkeCxDQpS6rxZK607CkOjxHVGOLQEYtByW072IzxPerAxtgRfqrmwLbtDvnxFeySg+H0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/OqHQ4jS9CulDq5t2lsd5ktr6DGwyt/Cs/3hW/fCduP3tFkhUAjhDbwpSS4qBFp/MwD9Yn0B+R2AhOEcWx43EbQVRJvwbIL1aHawqgrbtDTbvmLUlNZbLZwW6AJPgdY8Tk+ct2YsxcVhgOtJexA3gqlZgz0l9d3vjx2u2+8m07fcLlW2mTp+Vevk73FUhoT7kNdFWU0G0qJ52dAbj/qGLToGwdH46QcOOSGNHIaQJXZX+U3XYaFK9JvM1qbxjOoSuOedEJy+K0006boYKJmb2hWyNWqUBLrlmoW3Pqnv/mDEhMRAVxcCPn6I9awIVe9Q/aBWqYul4ayq2IiJHz5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeZfdRogX/r+zVTMHCsQ5iFcWzisNuN5PB7+2sEschk=;
 b=RXbvQj88/sfqJjzCh8d/ZC1n2NO5sv4r7tvopEk54IaW2RQp+/MfemnMwcKWnP5ibziHV3TTK08OplSqxBFywcicsgZVRMgXTg0e8kn9RIoHKsGVHdmhKdf/Z8b73MoGSs3Xpm4lxNF88wtUliLIxn+8GDWV9lNGSZE/8DlcheZpHQlQG0BaHrY+oxYELqHAjcmw6MDOAYPi0UifpKp9jkVTryFDkTsJpVC1ygtKBFPbqdfFH6b6I/I6xKgZ3Ze0zj0AjAZOZBlFpvRparbq1XakIMPrGTS1UwPUy1DaLdh7gVv8xZ/n82PI/b2vw8HXXXwmWT8sOUi76gvPX09Yuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeZfdRogX/r+zVTMHCsQ5iFcWzisNuN5PB7+2sEschk=;
 b=afUhlIiRr0UvGDX+wnQSN4yk27dnIEftkT7rqUoWekSrm+VOPBfjyuaYOGvgt5XnTVThO8OelyYrNf8H2aU76+W90CT6MtsOlU8YKzhnkeCxDQpS6rxZK607CkOjxHVGOLQEYtByW072IzxPerAxtgRfqrmwLbtDvnxFeySg+H0=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Need updates on some release blockers
Thread-Topic: Need updates on some release blockers
Thread-Index: Adjv+kQNrAwcokZLQqKTDZ49PUC6/w==
Date: Fri, 4 Nov 2022 03:06:21 +0000
Message-ID:
 <AS8PR08MB7991C675A83D83C5172B0736923B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EC9B5A5E6BBCCE4C8F961907BD236BC7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9002:EE_|DBAEUR03FT036:EE_|DB9PR08MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0cc432-c089-4704-3aea-08dabe1194a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h5hq4NZV5pe/BN6R74CjILgoI5Ri9Nmjzfs+xOIfsKkJTo4uEBmcXnoFb/E1yyt+6bqC/44WnLzihwep5VaRyCxwfYmnwOcUZAYBq45pfx0ZDEr13cwE7cYFkEGFKNPmEAiXLW5nUQzVQ3UReCPMw/UAnOdo3IdA/XxmnRC1u605mWOS3PPoCmiG8m02qgtfn1Z/NjJmmOZCYbA6/cfcPltl49LjUwEd9/ucdhczD2bKwP37Z4AwMTXLUQXApoSTP/yrsQEZ9FIR+cZ0rcdci1eIQ/i8lLZPbnj3r2rpfv2AkDCYtp65PBzmEqkKaI817HOl63lbRlTwgb5v0ZgP1myfOiPoz5/Yv4UGadJKZp0wdgxpcGA+2poBLCW6JUkKXh30hoAGVSZEphYet9FH5aB+UmNh59eZrznnmXnxs6M+YJqWcM9su7kBDIJiy5F0Tlw/dAah7Nd0iIeJNEB+sMpCXbGpemIq1blWZmzFW7uqSy7yl8YAho7Nx6bJwt7qpgaoyB4WoSQ4n3ycrt4K1TFKp1ALbBBne/BMgaba72dk6Vt9FBUaSJkdbBLLu1gd4y0F5afVTVjARlRxArCourtew4jQreVt2F5j7udFLgKTRlXV88XpcOgrfeyiJsoZ+AZJlokk5imScmIZEv95PqRHwlKid9dGW+I0h9YNgTNj/qXPeNByWWy5NhqLu2YKD5xkkTltm7+hDmGkcGtnTQn0/Fl17SzUy2HH9qJ11n+nTkduOe/SE2oCyrmtltaVkRVsDWPqxycXYjXlJjTxMJX8cSkaUv8X2VP+V/gLjy2fMEOtUrR5WbkJC3iPzHe3SQ6N5l4bz0h3cWmuJvmMsw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(38070700005)(86362001)(33656002)(41300700001)(55016003)(9686003)(8676002)(64756008)(4326008)(66946007)(66476007)(66556008)(26005)(76116006)(66446008)(186003)(5660300002)(52536014)(8936002)(6506007)(478600001)(966005)(71200400001)(15650500001)(7696005)(6916009)(316002)(122000001)(38100700002)(54906003)(2906002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9002
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3a8ab79-aa86-4fa4-852f-08dabe118d1b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rlvr1kTcUxK6rvoC1drrGuIO9S6L0gJROtfq6bubPfWM1FhmdKqD7KEFT+o+F2MIGzUbUzwehI2U9gRalqy6UoW+ilYlIdDRvetZVlMHdiSqKdH03qVPsOamjYJCTzIq4JyL1LOh4dpCKLbilPo8U0gCHywMCLbYK2M0B9Sa6yj29R89QvIVnX7Yh455dSRK6tyDxpRMY5tDFSR5gl6F44HnWxcTXPeNM8nhOu/Db/1m0KPUTzRHHy/5PatzsNF1Jcw1kP13fzWWfSidBzkF5W0N/K+7a98QxBaC2yCxVYXO/Bq9YxzOKXV4XZk7LMeq+FD3/OZqU09QSLYZi1U+5JplE4PzWtXOwZr0Z4fUwJgZK7NgpvFlEWbKou5Q9zheHJs8babcsqSHgP+JV1men35mnwtTwyS8eWLRqv0yyUuyN7DS4abH4MMZIcVSaGSjMm1/y4cDk7aCfqifDSzL/fH7LnyGfmOQREefzIvbX/UGj8M59j77+OEyCw9hYSmwhJccWU6D3dxfQ7aGR76lj2JoeZsi0c8IyrJ8hyg6ak06AiBAxbfRMlP5Jfwz+KQo5OQ0Rbran58MFFGpwTElA5hcqNZswTBsG2+bZgTkWnmN7QULQpBwnFDtcqgvUZetKATQSeWmzMQZ264x6NwtUW4OeNXQBgNSUAP1q6XhQ/hTlxhE9fIQNk3Tn4LccxNZ4SgGiDCHJA/2/rqWbhvj9WliO9o+B6CAnrGdaBjgdxyFzTK05otZXYG+RA96yJ3rKmUau1X405iCEwxvp/nO5XNEIw+k18lw6S8/VKbL4810TW5PLvQrVHsrr+NYMnMm+VV7HIlAdWXF2/iaZi/3AA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(6506007)(70206006)(336012)(9686003)(4326008)(52536014)(7696005)(70586007)(33656002)(82740400003)(8936002)(40460700003)(2906002)(15650500001)(5660300002)(83380400001)(8676002)(41300700001)(47076005)(36860700001)(186003)(6862004)(966005)(356005)(86362001)(55016003)(478600001)(82310400005)(54906003)(316002)(40480700001)(81166007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 03:06:34.3833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0cc432-c089-4704-3aea-08dabe1194a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7399

Hi Andrew,

Following yesterday's community call, there are 4 open release blockers whi=
ch
we don't know the status. So I am sending this email to ask if you have any
updates on them or if there is anything that I can help to keep these relea=
se
blockers processing.

1. APIC hardware assistance selection [1]
2. Concerns with hypercall table changes [2]
- I hope patch from Juergen [3] will address your concerns. Could you pleas=
e
provide any feedback about this?
3. DOITM Changes [4]
- This is a ticket with no descriptions. Could you please elaborate on this=
 issue?
4. Patch: x86 :Enable interrupts around dump_execstate() [5]
- I think your opinion is needed so that the discussion can continue whethe=
r this
patch can process or the previous patch needs to be reverted.

May I please have some feedback before the end of next week (Nov. 11). We w=
ill
need to decide whether they are really blockers or whether the release can =
be
properly unblocked from them. Thank you very much!

[1] https://gitlab.com/xen-project/xen/-/issues/91
[2] https://gitlab.com/xen-project/xen/-/issues/93
[3] https://lore.kernel.org/xen-devel/20221103163631.13145-1-jgross@suse.co=
m/
[4] https://gitlab.com/xen-project/xen/-/issues/94
[5] https://gitlab.com/xen-project/xen/-/issues/32

Kind regards,
Henry


