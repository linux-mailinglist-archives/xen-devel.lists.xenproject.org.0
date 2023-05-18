Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48440708136
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 14:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536320.834531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzciU-0003hQ-1Q; Thu, 18 May 2023 12:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536320.834531; Thu, 18 May 2023 12:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzciT-0003fe-UR; Thu, 18 May 2023 12:26:45 +0000
Received: by outflank-mailman (input) for mailman id 536320;
 Thu, 18 May 2023 12:26:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Mvs=BH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pzciS-0003fY-TG
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 12:26:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e9b2969-f577-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 14:26:42 +0200 (CEST)
Received: from DU2PR04CA0178.eurprd04.prod.outlook.com (2603:10a6:10:2b0::33)
 by AS8PR08MB9867.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 12:26:40 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::d6) by DU2PR04CA0178.outlook.office365.com
 (2603:10a6:10:2b0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 12:26:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 12:26:39 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 18 May 2023 12:26:39 +0000
Received: from 7c813080ea05.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C28E3A0-16A9-4E96-B594-5C0B3A56E6D8.1; 
 Thu, 18 May 2023 12:26:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c813080ea05.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 May 2023 12:26:33 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB8337.eurprd08.prod.outlook.com (2603:10a6:10:3de::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 12:26:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 12:26:29 +0000
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
X-Inumbo-ID: 3e9b2969-f577-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bx2snVv4W3p8p2oYqTvwowFapIcPKqX4VTWPUzQsWg=;
 b=Fa2tujinUKC/UAdR69iQM8wsLMh1oZcN3mETmEXwuXJGIfvNXF+X5T6RNtL6Wo8S141E/Uk+l6tidimmuh1f7lCD0/TMoC91KDDl9H01XMinafCqd0phtqdU6YHih7mxZUWYHwJLHW0rcdFUCf7tQs/T19/UPXqZ74DW28TUkks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f942611c4068126
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWMZXRfk7HE8qxIWGk1XE48OHT5EImRvhBUbpti89dHrWsGjl2XKzZKGT8eQD6QBoi9+yLKLYFLJOIkhSnMuTTolK6/v92bNPjWlyJMWF+fjEkUWTbb1tqItyq6RIKxw4KOagq8VOS7+Ydpojv+E22yOC9sIDdEMBKDVUe2qu1fBntDPTbNAOiTObvdo3jStfnGxOoy5juYG3l0TVLgEu8CKrsI9RZoZKK8mltdPZoLEj+i5LWVdnyIogi3rSA56aayOAFA5kMLHh12G2RPfF+iiFvCLwX9RCs4tNgedpn8JoT9FKOIoiEarP4NJdaEBWOTKF7PchaKFZR18IoAygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bx2snVv4W3p8p2oYqTvwowFapIcPKqX4VTWPUzQsWg=;
 b=a9d5luVo9g4oRPm5BLpZVZBpQEFmfIKC15xvP0zqV7Kt14dVVOopxPoYW9euR8l4UwckbGL3SaDobST+T8Ban2xy17K6QU7tpnoGJDjzji67rnLpizFQzNM4WWQXuB4SFdl/1IchtHR3G70BI8hKO8mLh5Z6UBirlq+WYLCqibWp8y1PMu3T37dif1g0QpLTTY3W9eVoZ5IcdgwlYlAHYoaWdrY/6tY0Eu/aQgbg5rY4fbjvFUG5oL5QquEppLjlU1Z7ihG3u/B3GnHIaPvEFfTcH1nCSHGWIO8CU6o7NOD6tV5o0zgFydCJtKDHq6asnMdawz1GwxhJ98qLchEQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bx2snVv4W3p8p2oYqTvwowFapIcPKqX4VTWPUzQsWg=;
 b=Fa2tujinUKC/UAdR69iQM8wsLMh1oZcN3mETmEXwuXJGIfvNXF+X5T6RNtL6Wo8S141E/Uk+l6tidimmuh1f7lCD0/TMoC91KDDl9H01XMinafCqd0phtqdU6YHih7mxZUWYHwJLHW0rcdFUCf7tQs/T19/UPXqZ74DW28TUkks=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: Enable parallel build with cppcheck analysis
Thread-Topic: [PATCH] automation: Enable parallel build with cppcheck analysis
Thread-Index: AQHZiYO0TSgWEhB91UKK6TnuwOVmHK9f9N6A
Date: Thu, 18 May 2023 12:26:29 +0000
Message-ID: <2243D77C-F212-422B-8AB4-7D93F651601C@arm.com>
References: <20230518122415.8698-1-michal.orzel@amd.com>
In-Reply-To: <20230518122415.8698-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB8337:EE_|DBAEUR03FT038:EE_|AS8PR08MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c37769-e3c3-4462-b43e-08db579b2199
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kGMy+PGKh7D7wOELFBk7j0c/hFvTNSN45TWtCRldHR0OGCFoPM2Xem/TIXVJSpyXqlnVp6HAjWZZrWHYsDhmLG9QqbKIltvrxv3B+znWPwceG3DLuUzuNnyqL/btGB2kidbiXG2RVCwgY4soVREPlm35fcsQGN+yLZp02Wwpv4JvdMR2Gs4t2+XxvO+YeHROlJaQYs9s1lr6y5fj4br/jEv95xwxKJyvfFICa2Ia4XUPD3w6sOMlq+5i+UPN1hOvBZsXLvLxmvF2uggmXOVvJVtgjvJZuh+AOvap3MR7XhAK0hSm3BRCNfR1AAB0O+tDjALCrZm6BwghLo02fhOfR+OTXJGQAZ2NBIeaektdnFWQlLRV9mO4S9Vghb30ehZiBWt84TYR0eR1ZXutTXqo/AAbQPGk0dQN2LE4PtPn5XBCTyv2Eb5JHSV8wumoT5rbr0zwB7+nQ4nL+rt99f4vP5UPUXGUwmM+qmpYjlDDozckDcf9WrvjTj2cfnpmQp3CAdALGLQYiyv9y/AYm4AeuTHgRV0qyxUo2rk6Gw5bJJ78yY34qWvQA0/RDw5FtLv/sDmjVTNMOxozI40oOVrp4Mw50rwxEeJOYCJEbQIeufY2/JoTnIfJVrShwBVEhzvamfInzeNlePpZwg7DjdFvJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199021)(478600001)(6916009)(66946007)(316002)(76116006)(66476007)(66556008)(66446008)(64756008)(4326008)(91956017)(54906003)(38070700005)(86362001)(36756003)(33656002)(83380400001)(186003)(26005)(6512007)(6506007)(53546011)(41300700001)(2616005)(8676002)(6486002)(2906002)(5660300002)(8936002)(71200400001)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BFEAAE3278A84C40BC0379791CDB474E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8337
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b783df3-f244-4cf3-caaa-08db579b1b92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b1/US5P5xUjWkL7KzMc/jmpi3lA/23zI0f93QkOx5QVWh0hS2YomkLAxy7+8Mem4iQXpAJxObb2o9GZOmO9tiI39k6/pvgMN/NVmSwQ9gshO3y5otp7J8imu0Cbwro1SYhEVKPvHsU9qdRUO3P3Ua+HK+2rMWB8HQMZ13zzxIHDPTW1Fx8ALW2Uu+iBmTUTnnTFG3o+4pRijYcy2mPeRqEkk1sPOT1dBR8u9gDAA/q3xUpnV7IY7O4VmwA/JrxBNNUG6PUltb1vrKlqNFnAhrGnQ/8iIg6uzqLnw2PUbuYkFiGsQhGBN3gXGJkOAuwCVVgPUdI3tMYgXK/hexrj1rVDDljgLGUG9PLqhNaORnDp2+m0jCehuAZOWwK22OfbFVUu5vWdYRpTV6TA7U8+EcotQKyW1Gymia3ODDcvCxjPHoE+0s1kAFntyplK+M9OMljUu17LkccYIegjUdOW2oRHxs1tTfQ8nruRg2nHEgVsuOl0uDkarqt46HGYT9rMN/uqJRUgDBZveUqIfcMFBnHrqigqncVdsUlY+TbP3lZNYg+h3If2IhzXIC8j7hYBnvkUuG0JCJvp2f1KCEHOf6nn+Hd3KZXQ7KfKxYWtSO9K8iS/9v6jVOYcd6Jwt75amXAEEfXdgtril867DwmhnvV6LbAvoCO7U8qHZcKoNYoJ9D75tqWQy9Ngg0dui/DcOES5655HA7GIHjaKHRvE5RNSkh2J9VfrEtjJTvssERC8V5OmqtXDaak40LJo5pDMF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(36756003)(82310400005)(8936002)(316002)(4326008)(8676002)(40460700003)(6862004)(356005)(5660300002)(81166007)(2616005)(336012)(47076005)(2906002)(40480700001)(82740400003)(478600001)(6486002)(54906003)(26005)(70206006)(186003)(41300700001)(70586007)(33656002)(36860700001)(83380400001)(6512007)(6506007)(107886003)(53546011)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 12:26:39.8325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c37769-e3c3-4462-b43e-08db579b2199
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9867



> On 18 May 2023, at 13:24, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> The limitation was fixed by the commit:
> 45bfff651173d538239308648c6a6cd7cbe37172
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Hi Michal,

Looks good!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



> ---
> automation/scripts/build | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 9085cba35281..38c48ae6d826 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -39,10 +39,8 @@ cp xen/.config xen-config
> mkdir -p binaries
>=20
> if [[ "${CPPCHECK}" =3D=3D "y" ]] && [[ "${HYPERVISOR_ONLY}" =3D=3D "y" ]=
]; then
> -    # Cppcheck analysis invokes Xen-only build.
> -    # Known limitation: cppcheck generates inconsistent reports when run=
ning
> -    # in parallel mode, therefore do not specify -j<n>.
> -    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra
> +    # Cppcheck analysis invokes Xen-only build
> +    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(n=
proc)
>=20
>     # Preserve artefacts
>     cp xen/xen binaries/xen
> --=20
> 2.25.1
>=20


