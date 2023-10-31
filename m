Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939CD7DCE7A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625797.975448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpJy-0006en-C4; Tue, 31 Oct 2023 14:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625797.975448; Tue, 31 Oct 2023 14:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpJy-0006ar-8O; Tue, 31 Oct 2023 14:02:18 +0000
Received: by outflank-mailman (input) for mailman id 625797;
 Tue, 31 Oct 2023 14:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxST=GN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qxpJw-0006aa-5B
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:02:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17ce2393-77f6-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 15:02:14 +0100 (CET)
Received: from DB7PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:10:52::14)
 by AS2PR08MB9048.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 14:02:10 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::c) by DB7PR02CA0001.outlook.office365.com
 (2603:10a6:10:52::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 14:02:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 14:02:10 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Tue, 31 Oct 2023 14:02:09 +0000
Received: from 4c696c9bf300.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8160BB63-FC89-48F5-A14D-230610E08952.1; 
 Tue, 31 Oct 2023 14:02:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c696c9bf300.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 14:02:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB10600.eurprd08.prod.outlook.com (2603:10a6:150:15e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 14:02:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 14:02:01 +0000
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
X-Inumbo-ID: 17ce2393-77f6-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FLL9yayqfazbobJEjECSf3Ud2IFVPfbcWQKp9H5m/SMVW4PqajPUi4V8l6/W3INVdt1jjbAsPeCEZBOubedMDvwhOLAeIJQZyuwsWjkfDdidCIXhclFp8rLerBofV6hhQW5djeUPwnwSwcYeW1YxHp5HXwpTx9XnFXpPGZ0Ne+tn1C4xLOpkcYz0QDFIlxkzJnv+pvEBwvQI8n//OAw33OL/10rijIi7G1Ui2HgKhVsH1SkuhI9SWKcQzNQyCsPYbE+sx1iT9pjWdNbRwTgIQo/6E3W93Otg0iUp6HSa7qKzuEgzV562sCaUNNsdhp3JOi0JPhDiszBCWM6NwvQfXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Mnvw0QZE5ZpKPW0qLaBnpx49u7HpnQ674NfhAxXcU=;
 b=YJtmYULtVzIiH0gx3DFHOZ+ZFLSq3boytS6EMIrEjFTUKzmIyh/djJpDU3C/dY7Wpze2mazXBlpOSBdWJy4zPdq2YQ9KqwWlzeYJ+Ii6HISCCp66ZDDem5PQsYUKO422b70DbMRU2HmjOTKlDQh77oWm6vTZJkJ+ZKpn0+uho924ybaSxV7Nlsr/uaRhGAhZj74ffzEcajcLEv3vq4Rn05yaY4lo55se9Yc3aNdfMcFu6WO+hNdqAQchx0ZfFY7Op0nN0VLE758zq45M99q64y63x2y9q0k2dU02HBD867HyxrpWPmwMUvl7vcXi3UCj5/guznYoEsM5Mhc3K7Vbbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2Mnvw0QZE5ZpKPW0qLaBnpx49u7HpnQ674NfhAxXcU=;
 b=5Yo7bfGn5+Y98KwVuSgoxPBEQ+4rM0W2c0VmFGS0aLfOmNYU+3jjh/oTmUdbWuvixexkf0CiPqLcUcHLTRnf+HsR3VclGV/fDITAG/IkMkERnH2+8lezhc9Z+MY1qyWQfWzMYtNfjBI+3V1aQqEfYzGWLdIq+Mjf0TQESwAotZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5069e9b5a5cf6f37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9602YtjCZvkgKXJX/4nGiLavHKNeG5UbxQ3v9crY+GOIjHhUbd56BzhvrMfEMiLzHtHhcY5uxr0DzOfmfCYzG4a3/7YBHausH6/TDB0X+bZY5bUKJAF7z37ewRYFseND9p+u2zwlIGNgzjK6MB+W6S3CH48aPXX/ZjE8SDoEzfILfYslgEMyF26HvgvkJbLzlnfQc9KnE55WYhjBjWyrGYqz7U4liFcEunMVHIvj9RgMzg3mt4aXj1NtmO6AT3nc+p4iXWY0zyRURn+aEUd/w1dnhgHfUXoAKpTYiZZid0IoZTHUpG9ArXrZVf44NXATv4a7EUOy7n56zaNVUf19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Mnvw0QZE5ZpKPW0qLaBnpx49u7HpnQ674NfhAxXcU=;
 b=ldYL2QXzAh9m4qSRHKesVrULOpOZYoWanYaIcJAHKxCwLKWW0xXLNb1R/kyu7omx4pNu9u2+6uUp/JNRZ9JbChcazdcFDX6l5O6ksrJ0O3OiLOlPjtyJZGrrx3d8ij4UnptLQqAf/294Zh4x5Z1gU5/gHCq0XZ8donMiA6HL+jGlnG9np3tiXL7HXOg8ZrnOzs2eIexH8WuTi1mFRReON+Ctm9rFtSnpcvTWOwS0oMC7OCHuccO1JhmhtIH3rO2Z8kk82JPEJyr4bC7p8a+fzRbaQLTZBrlf41I4p2hQNTNU3ljIcEWycW91hAVlboe2cjlewb5+Ry67ntyelMpwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2Mnvw0QZE5ZpKPW0qLaBnpx49u7HpnQ674NfhAxXcU=;
 b=5Yo7bfGn5+Y98KwVuSgoxPBEQ+4rM0W2c0VmFGS0aLfOmNYU+3jjh/oTmUdbWuvixexkf0CiPqLcUcHLTRnf+HsR3VclGV/fDITAG/IkMkERnH2+8lezhc9Z+MY1qyWQfWzMYtNfjBI+3V1aQqEfYzGWLdIq+Mjf0TQESwAotZI=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.18 2/3] CHANGELOG: More 4.18 content
Thread-Topic: [PATCH for-4.18 2/3] CHANGELOG: More 4.18 content
Thread-Index: AQHaC/0C5WnM0xckZUq1qixY/5thorBj7ZwA
Date: Tue, 31 Oct 2023 14:02:01 +0000
Message-ID: <A2943E4F-4978-426D-B217-A0979372C405@arm.com>
References: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
 <20231031131954.3310725-3-andrew.cooper3@citrix.com>
In-Reply-To: <20231031131954.3310725-3-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB10600:EE_|DU2PEPF0001E9BF:EE_|AS2PR08MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 920797a2-491c-474a-bd34-08dbda19f9ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oQNivAyv0UVhkggcGpbTudsC1bLlnDwJVLERwQcTt1hEKWNKP8D4O4Nkc62N9d7OrP4Z8+dz0WWp5Vt9RIdOSP7xO9a9drOONmL9YZmy0KyuyZlDPOpJ3aj1hA1ffz1SJAcMxoVMYHUk++IG0ksX3ZhtHiLO9OOPg7H2CU0qe5lUrRehmtt7VGImYQ9pW4aX+z1sF3UALmMlEsrM1czTKsg8kKvFjHCCjiSzpdTLiCm56EEvb30JPdNYJft6RgsDkBzClfiaNJZeEMe5k0y4Kn/DgiInFKk/N0FUTkW8TNTxcur/VXpu9HS81yDqn4/gqzgDRvg3OK1CkVx3pSMqvBfBBr5ofwI6NWQUr/2gWIVFDyU/8xUuEbdTxgvXEN8BpUSi8bqHFwg/g4vhTbJF7tFkPzcSGumCcGH+drZvUF2/uJLsN3t738Qq0JsdzyIdsuKvQLCZc9owX+V5JVHKRYzxb3HNgGIL+8nz9PVRipt4F7pYFL2H8GZQPegrwWmEX7XW0fdya1kJVJWMSGA2LcWIZmvVy1kQugvKToAL0vQi2apYhtIRxj9tXJjHCqPupbfljGGr/Rc2HVh8PPuO1tdPYqsw6RZk+Rreuo5aK7dnBfdXaac6VcUcDJXza0smBigz9cs3OY7uga4VSXYnbgbznqYmildwESrPGFVSbHiAONNXmNTTBRiJpb0sNISM7nXZZLqxe7jzPB1NXiJ0vQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6512007)(2616005)(26005)(38100700002)(38070700009)(558084003)(33656002)(86362001)(36756003)(122000001)(2906002)(6486002)(6916009)(478600001)(71200400001)(6506007)(53546011)(66446008)(66476007)(8936002)(41300700001)(4326008)(64756008)(54906003)(316002)(8676002)(91956017)(66556008)(5660300002)(66946007)(76116006)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1ED8ED7B55C3CD458B2D96DECF1822BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10600
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67e8835d-ed1e-4fe7-55a4-08dbda19f47d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ADmKzh95R191Kyi5nClOvo1NgwpeHTvLGz37cqsqMWWh7N7G+9OVcua+s4Qoi/yXBsd5ED50e4cPDJtOxSoiiiNj+1dAxEHASyksdDus8+3PMTMYavhdpuKRvE3CqgPAoR9EpYbDEf4tREjUHrLv3+ceX7iYBy7mTl42mIRcdfEuwBUBjB786/kBUX3MlRoTe5nVoptLSyYcNmiy35LtU3sV8LaMEh7c7jbVFM+H3pF2nhYdwwdvBdF0z7EZTf4BSjS3jpQZ92UpyaTlCNqPnuFGBHWNOPKaB8bg+rgr8LhKLQZh0SvxsDj72AB+nXR3WGWexP1yUjYCE/p8+UKxU+RdNOPOzEfAXALU53FcDWqgsMJCnntQHuChJ+FbaV2lGiYhDUC7gEsmnZnt1VR5rVhwqH5hnRLnyxIhtNhoe0nVS+G8Uaq4pNzdrNBYHqbAWMBcHEmbfMvQt6Ndq6M3ma6Hy5nOPa6ZCqONdHelLt0dXNGZ2d14zEplvIhJ8Y+Nqf/9y2MsZW+He7P8xmgQlYCndZ/EAWVV4vr+SMa+8r7yJfFtYE/niXpvnFPmEIUikO7WkXqBXo1IfK9B71QOThEWSNaVJTLROYn8s9i2h0sngNcFQqg9SHMJzERqlUt+qQpVepW9Ew4x6TY/qBEodhdwKkQ6rqWSHWYPItXsNHumKMGSphth8iHsxtH2xbA85vek3wIFOTqdIxTA4t00TRfidnMM9w+gNBc0/W56ZX++YaMkfYr6SCmiKEgCKsR5tcevL6MVXCl6JpdNI+q52iEA4ZhMeyrvTaAnGfCKKA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(2906002)(6486002)(70206006)(70586007)(5660300002)(478600001)(54906003)(316002)(41300700001)(53546011)(6512007)(40460700003)(6506007)(2616005)(107886003)(26005)(8936002)(8676002)(36860700001)(40480700001)(336012)(47076005)(82740400003)(81166007)(36756003)(4326008)(356005)(86362001)(558084003)(33656002)(6862004)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:02:10.0720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 920797a2-491c-474a-bd34-08dbda19f9ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9048

Hi Andrew,

> On Oct 31, 2023, at 21:19, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Henry Wang <Henry.Wang@arm.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


