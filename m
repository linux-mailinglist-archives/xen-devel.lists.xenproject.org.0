Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJRTHvEMj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2767135C35
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230653.1536085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU1-0001ji-08; Fri, 13 Feb 2026 11:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230653.1536085; Fri, 13 Feb 2026 11:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU0-0001hu-Rq; Fri, 13 Feb 2026 11:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1230653;
 Fri, 13 Feb 2026 11:37:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfN9=AR=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vqrTy-0001fQ-AQ
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:37:10 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54f0cb9b-08d0-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:37:09 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB9PR03MB7615.eurprd03.prod.outlook.com (2603:10a6:10:2ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 11:37:04 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 11:37:04 +0000
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
X-Inumbo-ID: 54f0cb9b-08d0-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+sb+QlIoFGZZgMUxHr9efipNWjZDLA+5LdXXCUg6mCvcjiCGb/qHJSXiIApY0/pWQqa3m1nkKm4zSt3KiRoCrzHHYfMKAQeZR7JU48cwcaTDZVo9ZfY945jAt+WARv/WtJeo/PB+BnRBoPbyZIX7N91lmqQMVE2fDuRbdSEMhbYoT/DYVkZNbbOy8nEJ2YP1br1HxeQVyNNDIEDJ24+4O0p5PL6JsHujT7Z9s4XI7BPSYNY7Dg85xkn39juRbwxAt00HhEFlcMCeBoFrStiKwlll96wvVvKgrLwdFWBtSYsDzCQS918JTnreHeKJZqunkhaTHFVU9TdU1I784IzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nk1CN+j4B/Mq/rCvZP0747CGWDJEwdX0Pe1Pu44Qbs=;
 b=Y5avRrt0HgX41VyW3Dy5s80lMAG9nmJC/5cIeplF5HsvRNgEE/GbXuC69iJ+StR9ndzg/XNdlCEVo4h9fCgAg4NBVV2fR5/CqbpCtjftOgwGCKCyYDEC+JdzD6cMoKCL2HCxObZN8LpFzieU/YnuWWP3JA0vY5jzqj+1szdDCFBJZeRhBgckRiBVy5p6kdIpuo1QQ5KjePSdjWNetmUyYbYkRdAXAtWtNYEV+XVdb8tZV4bU8oCWKPuyGSJ78nYYUn7tXB+maQau1v1u9bi+qwnhD9D6xvKdteU+cYplGnlc122uhnymW2Ysc9EQUMvT8sE4gdGDjMclygBk6Nmz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nk1CN+j4B/Mq/rCvZP0747CGWDJEwdX0Pe1Pu44Qbs=;
 b=Pxfr4Zv+n5eAEb74m3Z4vafG8lsjdB8Ln4pB6agglxRgSaHqJ2YXCAbP+GnBurjjUy7fnGSteVC+QA0GGru/agJqLjremTgQqNqM+VdZ2WosVSrdUi7T73pmgjvUisophNdGleJlrGe0ezpE/iGvWnfz89p0RBAabFHjRwmPGgfCkbbHjSL5Vn3ldRcWa8Yr2dHDcoxyujcK93TZyfwbKBLgKbosKhUiUbnW7btZ3r3sBLRdc6ZLa5WKJvod84jjXNdP2zRt1dS7shgUDvUG4icvCRyqKKskVyK5IfVgGQW0koTKici5uwoqWNSroraWC5fyhoc2zrY4MGhir5gq4g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v10 2/6] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v10 2/6] xen: arm: smccc: add INVALID_PARAMETER error
 code
Thread-Index: AQHcnN0ThbUhqTNjT0mv3PupYnT1Yw==
Date: Fri, 13 Feb 2026 11:37:04 +0000
Message-ID:
 <541be1f41d07d9819390e522fb7298c95413ad1d.1770982468.git.oleksii_moisieiev@epam.com>
References: <cover.1770982468.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1770982468.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB9PR03MB7615:EE_
x-ms-office365-filtering-correlation-id: 4d4f8e32-550c-467a-1a23-08de6af43637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9lg8BNIOYw/tE5M1C5hPkCcDAqOJHNk/GXoB9o8T8w06Mp7DDFfEiy/8E6?=
 =?iso-8859-1?Q?SJgr70U3lwxLnVgjLrz7r23HEiIZfs07ZVCMNLaGN74y+LTx6V6ep23gX4?=
 =?iso-8859-1?Q?j4Gzo0UcdOm2ysAGbHk85PDI1YRQq4uqqmjtnr5kSb2eof2ZIB5jTcq2z6?=
 =?iso-8859-1?Q?WBCdYL4OHYbP36IpE59M+cYsy+L99xLVa3/bApyeBh8cKwDeGIS562F0R8?=
 =?iso-8859-1?Q?nz6zHh8xJgMxJcfC2JoU65wokLSQHCX6iDUvuvcZT2cl/4zV1lmpgmfWUc?=
 =?iso-8859-1?Q?5VGDD+3c3PwyekpYEUgiuAsYafq5ZmSdo7YlgWt5slMAqTmlZvKvbqFNSS?=
 =?iso-8859-1?Q?4iOK+uXoj+EfZM9PLgTZV7uMM1tfrymu9fj6WvRMzLkAlD5BWTUbIOZcbx?=
 =?iso-8859-1?Q?UxFa4tb9SyuDEPFUlybuXXvcDgtbzqBQK7WPoQn5oXjS8PbrTJaL/CAa/+?=
 =?iso-8859-1?Q?LJ95rsqvxO313YaPos1E4EMJw2wlXd1Az3xx29OqP1VeHUzQ17ZG5E+a2i?=
 =?iso-8859-1?Q?I02LoCAFW3CYJY0G+0OtmB5QU2FpAS0fNvARJN52ngIELzmZDS+ebU5lBq?=
 =?iso-8859-1?Q?HJyDj5f5u6b5gm4Sm7dJC/GXsIJ7s7hSgzMLiKp6ndTtAiq+5EeWfmRUZH?=
 =?iso-8859-1?Q?9lgEU3ysyhO9hmu3Gd5U8DIxQmfiyjLGIe8jtxV0/xGayquy09XF27j0oP?=
 =?iso-8859-1?Q?4mn2c0ClPS9qJNPJGjWhRkUeugh/uFiQ0fQ3rI5P85azXHP7V+ppoeu3tS?=
 =?iso-8859-1?Q?o+B6W3c/McxUQnyQcq4fxeuBcEVpHyS0g7hBaJ/g+BFImOZXz25ufogw0p?=
 =?iso-8859-1?Q?7o3/zM/Ghs8Y4rel9j3H9nSKeEd216o0KigRhdllbE6jld6fVSE7+L5y7+?=
 =?iso-8859-1?Q?liBEWZOf8GJOH1DgiWz+sNjXxt2CBXhT2bO/FVymNM25xOncZsPNoRKP2N?=
 =?iso-8859-1?Q?rNMcb9WE2+e1btM6BDL1mmkh7sbE4GRO1hIbcpMWy1107Pn+vHZm6bX1wI?=
 =?iso-8859-1?Q?lXEHULXk89h6zexie8MZrVbg6vWZOfxlFh5VS2rF6VJAo0qf7mHMlNAp6p?=
 =?iso-8859-1?Q?aqVmGy8ygEJKmuiNNWMsb6ZlVQ5YKGwv3v5mGy1X2OdjmEebydig5+Wxd7?=
 =?iso-8859-1?Q?0lgktlINweU0mwDmJmLKJ0o+Rnvs8U5fUCxtmGUBnnZCiXaanqOvgSbm8I?=
 =?iso-8859-1?Q?wX/yeqz1nU1RgOSJngGbyPjNcS40ICTEt6VVn3/etkD0Ar4u/8Siv2gign?=
 =?iso-8859-1?Q?cTs2Dob7e4vLWr4WLMXzdmQaZEyYlch3PNEactkJeb8uWxVWo42Bq55mYP?=
 =?iso-8859-1?Q?ithcblXpL07d7lsMjE58GSsuwkPvOgj57uno/KQLUdUh8jHXFpzC8lbME+?=
 =?iso-8859-1?Q?3X1jdQ9itPGKnUadWW+ZjZuT5hPBCx5t3uxMTG6ObCABIKthbA8YmrsY/P?=
 =?iso-8859-1?Q?h2FRvK+h5QaRWKM0d2t8LlDSdr5uYoQugpx1AMI9qB/RomWYyvfDlua4dQ?=
 =?iso-8859-1?Q?MAt/IAwYcC35vxcmkcP+k35KEprJ0jroLLP0ruVavHyc3HjzSR7jB1OzxN?=
 =?iso-8859-1?Q?YJ7D6EsDcGJ2hssbUSq0jqxMbGOW6GNfskQdxkbCWVXhIygcN7bu/LsYjU?=
 =?iso-8859-1?Q?MkI48jCW5L71lFGxd/KXiIRVOEwutbc6yTp0FzqFgmbZuHi0vnvBVKzo3h?=
 =?iso-8859-1?Q?ELwmxJpLweHz3SXWYbc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LKUso9dUo20Nb6MW+aucIq1Fr5CdZ//LExhj0WSef1HXUsNsKi0qrm3twa?=
 =?iso-8859-1?Q?qSWwCq7IpVj0ID2wOLMApp9XKR+HH5/OLsFBDjW93YF4o1Fc9t9lZOutsu?=
 =?iso-8859-1?Q?62pUDQs0WQR9QsJCz7Cf1OVATD8t2IHYaJ05CGALypGV8WCF1mh1glxNgh?=
 =?iso-8859-1?Q?O0PdTxv/BH4pKPTcJiau/i0eTCSBcvmqwfPNPUqcATXsEt9qOd0Hk5LaJ/?=
 =?iso-8859-1?Q?UHPdUK4MrXp4gzkEM9NssRyLpWMlKmsEYvfg0NsHC8oUwTvOfmKoIlyFec?=
 =?iso-8859-1?Q?n6cDNa9+tvxt0JmQBKNAUuxntmG8xk1wWNIP3RKAaADdAWxadxswG7NbPA?=
 =?iso-8859-1?Q?FwJ/lmodv1oiRP4dhuwUQA/sN4MDsiWWf2Vg1jn3BjkMHkQtTfL7XWGnFB?=
 =?iso-8859-1?Q?plyrS+BVjU02vmtas3kGfuSkdrlrtBCLL9no27Dd5Hx7QCNlkym80fuiGG?=
 =?iso-8859-1?Q?cMsxs7qNiY6IWxj2cNIuvgb7gz5uaOmFuWDAQ7JBgprxvvoLFcRxdPetD8?=
 =?iso-8859-1?Q?EjS+stLviC+AxcLwhGETtJyntE/DYBOK6L3CE4jkcxTeFYP0nDdF5dT/Ul?=
 =?iso-8859-1?Q?a69QHL/VHUpRxDOQj8PaPG3bNSgMNkoLy1mb1wrR4xK0QRpP7kHFOqNl2F?=
 =?iso-8859-1?Q?i9R20taQctWTz+kKMiXtSR9rkCBrjgQUV9BjFN+VygLbr3YPgCio80L6Wm?=
 =?iso-8859-1?Q?5UfCMrZZln48b0iCFp7IINNRlDH6L6wLOwBo//k9t6Zu6lQfoTH4fLA6tb?=
 =?iso-8859-1?Q?jPc3HKy6209fu6W/R52ZElNkyOqcAdVCCQK4D2sKF5uB/n+XuUKiWHrWUN?=
 =?iso-8859-1?Q?VwB2v7l1cdq9c0BLjnovvfxxzt7S96W0soPBP1TR5YAPFllm/+S9bVK9tr?=
 =?iso-8859-1?Q?KpzZ4YU8J/AAM+BV17P69D9ygvAPGZYghmP6dJ5R8VoQqk9ziMd05Zp25z?=
 =?iso-8859-1?Q?2+piR2XZwORg3dFhZ8SgPv4miie3kKidf0awM0GNpcSFjJWoWOZ0TtszfQ?=
 =?iso-8859-1?Q?QeTZT29/74VRdEowgLC23RMiKZA58PcTTW0eBFYUAoAjP3CJdjmfYRhYl6?=
 =?iso-8859-1?Q?NIcgdbzbJPcN8KXkvOSk21YdNM8VHvY2rZyJNmx+302IarmDxehv58KkNa?=
 =?iso-8859-1?Q?Fmf91WO+++7X6BVd1SLX1N3+iMMQ/h4dSVrfsXmq4kk5gmDXi4OJ+mx6rF?=
 =?iso-8859-1?Q?RUT30iYwjRzZkmKAMl+UhjZtpem1fNcYvAb3B8clYv0qoQOq0j1e9MPOo9?=
 =?iso-8859-1?Q?WK289bNctRuPb3pyK+ICm0R+1SPckGtA1Dh6ZDz/ZifAnXmUcSQovY++xI?=
 =?iso-8859-1?Q?N26NdbYFm4BhRa68dwV0pOTxwemPVMZkgsBYS35KyWXD/gOoFwmrvdqQjr?=
 =?iso-8859-1?Q?E7u3+smVipvZLDLNQlA3lGAbIzefaoNsE91aRFp84olwXRJDhMe+J7APR5?=
 =?iso-8859-1?Q?zpUNqw29VSPx0OQT16Gtx7WKiVFjpdf2MNfTjHj1xlzo1+2n1A/s/MSAKN?=
 =?iso-8859-1?Q?cjf09YwvpEM3feDaSzcqyCxRJPLaJo+Vbc//39520JoJDsxalOWiOfJ8vI?=
 =?iso-8859-1?Q?mpF8HuYX91s7mjo/qtl9eDwR90UpQZrVtaz7huImqBETfSKjVCdVVN+PJh?=
 =?iso-8859-1?Q?lW+yEBEFo4MAkEeP7OMZ+Er0CuxquXMNH4q7k1v7yulT7bMVkLLX06jEZF?=
 =?iso-8859-1?Q?H9bI6/AKea1+2OXM0dtnCG0tQ9sRoFSHD9WxQd+npagWvOQSMl/hvNqnWm?=
 =?iso-8859-1?Q?KsHUOdQFnVh9eRtQPn+PJxwlPi7/uKBTHcaDl/CJmExV7JXN8XBF88J1dE?=
 =?iso-8859-1?Q?6+NtcdqPvkzPqcKmcjXJ4ynabJ+VmLs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4f8e32-550c-467a-1a23-08de6af43637
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 11:37:04.6804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgnW42zm1c5rxDMBuiGTXvPpyYX1N0Mj+SjZtGFiSnZwjL30WFnC6pjda2nY8V7JRJC4cKZQwa+yoOITF/5sadn9K4EwYIgCukk8/P8g3L0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7615
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E2767135C35
X-Rspamd-Action: no action

According to the "7.1 Return Codes" section of DEN0028 [1]
INVALID_PARAMETER code (-3) is returned when one of the call
parameters has a non-supported value.
Adding this error code to the common smccc header file.

[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/arch/arm/include/asm/smccc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/sm=
ccc.h
index 441b3ab65d..478444fb09 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs =
*args,
                        0x3FFF)
=20
 /* SMCCC error codes */
+#define ARM_SMCCC_INVALID_PARAMETER     (-3)
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
 #define ARM_SMCCC_NOT_SUPPORTED         (-1)
--=20
2.34.1

