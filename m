Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJDDEILm2GmmjggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:01:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5213D67EA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278858.1563573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAXT-0005UB-Gx; Fri, 10 Apr 2026 12:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278858.1563573; Fri, 10 Apr 2026 12:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAXT-0005Rq-Dy; Fri, 10 Apr 2026 12:00:43 +0000
Received: by outflank-mailman (input) for mailman id 1278858;
 Fri, 10 Apr 2026 12:00:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wBAXR-0005Rj-Sc
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:00:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBAXR-00FY0q-4n
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:00:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8e668-5cb7-0a2a0a5109dd-0a2a450cd21c-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:00:41 +0200
Received: from [52.101.66.66]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8e666-f40c-0a2a450c0019-34654242196a-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:00:39 +0200
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by DU0PR08MB7858.eurprd08.prod.outlook.com
 (2603:10a6:10:3b2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 12:00:34 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::7d) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 12:00:34 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via
 Frontend Transport; Fri, 10 Apr 2026 12:00:34 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6679.eurprd08.prod.outlook.com (2603:10a6:20b:393::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Fri, 10 Apr
 2026 11:59:30 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 11:59:30 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ncylm3gmOie/k6zm04ck6sljsJkGzEy3qjkwHGFmEJ54oRySq7m9+vZZBxLb9aHN2YOxJzdXRVWkdIhORpt4o/b85acmug4sjByLJGksmdYjQ3zTUAIkXmGAlCdbZhiMjt+KyIg0XDiF+D33jyan1Xqg06w3IHu2qZ4BrF9txSwmRyPgyUpaLJ39dgYqCHZVe16c8V8TRZtVztIBcfvz+KVyV1q7wPJlUMwXVgRPus2xrIxgE3GDUWidMjwr0LDhL1egM2O26i+i87COUbyrg6TFdF+SNchdVnM4VFLWzCF4nQWMw6WDJ0D++2naoelGhkTJmiYzlRNIBRnevKbqVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK8yCtU+S/r0a7E8iWeSpJFKo7686vFLEV1c3RfxUvE=;
 b=xAddFIimqg18EwZbRJhIGe8bb4c2JkRWI+691AkkJZh8/vcCwcOYe17NvyUcBId8mmdhYy2LgsbOTaBi+HJt8ao+ypkmFkMtm1vbOwZF88/LFP++fgNaZPfw2r+dy486vCDODm92ZeZjzS1yGeW2zllCMLRf2XVUsmUJ/CI4GgK7jY+i2snYNGtpUjTPUBBHqm2A4tiuMCJO8Q6rPEjNJ90Qd3f9IagupmsKg88Wo02sUuvUwvUGgqHR0IkMYWmULpfApXnWQi6+Y8fTo7YlUoNxPVAcTZcF+1lBolG0svYBqtm7nRdcVIkgARq7ihjWgs0uoIC0HbycIxQNPih+Jw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK8yCtU+S/r0a7E8iWeSpJFKo7686vFLEV1c3RfxUvE=;
 b=BbTT0My3mu78lM79mUpijvMiVi6ykk5ktKLRrBeoPHlGa1fqxxjdZ6fhU5q/EdkPnRHltzX0H3mXKFm/oR4iPtb+/cMX7GoXS+NzUcFZZsmJ7uutiH3WxbEW6DElX6a8JALQ+3uUMKNjyJSSyWa4xvoYKfEkoSY7KJZV4sjalpg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGQgCreSrsuavoRX3ZJEgskK4EdBYCEKCEuGjksxy1NhvgmVNakG6izjeuXxZYk/xx1tiU2g+X3aGLoUdO3BPs8gByUW3n2EplQ6w+ss9/QxEziRq+I6QJjUVkwc7MN4b6l9t3tWUKO+3WIRy08G0UX3IbSiVIQHTXT2+2HVUn06zxC93xAsEfKqFEpSb06uvatufBE6Tp1hFCWVrD3eg38IlgGRRK65vIT4Ro+Vx9mWgsl8aoXEA5iUo0iyDk36ik3Fks6T0/icft6bnBBDHiOp1rrVoq16pmlpbmllxjXChBgyBmD5ehxlIs8nr/zDIRd1JJNmfBGdeDdS6Nt2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK8yCtU+S/r0a7E8iWeSpJFKo7686vFLEV1c3RfxUvE=;
 b=STosCpcdpa8SbigbKA4t8zxT9ZXl2ozycWfhvMjlIYq0k3uSFTy+JVpHvY+imP1vXY083dsWL2qjJpFnW1/Ok6w9Pi38Smz/JXmY6FDeNUEFICFme2znTqQQ80KegZlCg+ttuzYf+VtWqXyCDV8YCu7Vfr6IjyLzbw0CUbplzaoPYS70RWuVuDv5lbMxgk7NNf8CbqcrFCxDTwjnNuiAjydbhhk4Z8ak1eqOrYdPfs83KC4jU8wxhqZHu+ta2q7Kq/HZtYTxT7OHAFgghJXUg3hdKqQ7J0B2beTKbsmEwK6gz4kZOVt0Nn7IlF4ti2gT3GotKV85GO6ckNbJM983ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK8yCtU+S/r0a7E8iWeSpJFKo7686vFLEV1c3RfxUvE=;
 b=BbTT0My3mu78lM79mUpijvMiVi6ykk5ktKLRrBeoPHlGa1fqxxjdZ6fhU5q/EdkPnRHltzX0H3mXKFm/oR4iPtb+/cMX7GoXS+NzUcFZZsmJ7uutiH3WxbEW6DElX6a8JALQ+3uUMKNjyJSSyWa4xvoYKfEkoSY7KJZV4sjalpg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 05/23] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
Thread-Topic: [PATCH v3 05/23] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
Thread-Index: AQHcyOF9C3z/5XgHeE6M79/1s69fTw==
Date: Fri, 10 Apr 2026 11:59:30 +0000
Message-ID: <B816D34B-290F-4C1C-A66A-9124A26AE07F@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <97aa20fdcec324bb58c6869ddcba5fcf29bf75b3.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <97aa20fdcec324bb58c6869ddcba5fcf29bf75b3.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6679:EE_|DU2PEPF0001E9C3:EE_|DU0PR08MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f2af65-180e-4717-ebe1-08de96f8c56e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 bAM3MvW+1PtYuNblkIwQ3tBhfg5QKSKfJkQ3jFbhex7dSH4MIYMMBVq7fWlzq+8QLQiq1g3IlAntACXe3znIhDk7FdCVAOAgl8yoFlpAF7TzKGl48tj6AJQ6EOWBQpJV6fl1+SuFLIpuH1oP+sgV+QdqjPQdRuHVkTZp3lNPg3HA3vnsSeoGfd9+oc5dIojS0gSARMwMfzB8H/eHIpj3lYamWilM96rRc1guqafwodNPMrTuMbC/9q/tJjGvUaSbwjgYhoNsoixy6ZTew0yUxaSo2ZvGNpv3aA5ZokRW89oJoQdIgougWqVEzxp6yiCMtYHPwy5gFHbssR+FB6dl4D8tHL5s9hy7CLCnuhhnu+le9+zNRbNiAM6HG5hvivqWPzYMMmvzr/2OzQ0gnweXCWBAFTDDBtG86nXW6R0H0mNsm0vRrf04Lrm5oKsqzZ3kEx+jPH+V0kJ26AUrJe277RtWeXtlKKRfat3M2IN+wpaNSV50tpsizoZomOeIAnVgP1eoga2XWGsouNaH/f3RfOKgJ2gXIMvD9cgRA6GGQ3W2J840UgazflkuGcKesmgJO+fUtme3wDkoo+JbcUgGMSgcr2XLQLKvNSVVjXHarlgHWMAkttrQqyPLEJ11RsYtwMLa9b/Aq/H9UrZL+QqfwmT/UoyCabSMxzZTwwRM8PUV0WaPHXSQa9AM/wgoEJX630mvjhnuTEJvCK9+MVRC+3LmI0kRuZjcqr+Wky0y6y/Lb6i+QFoV7u2h0FpbaMAtq5PiWBrn9KoC+a9EDadzKfsuaHqJ6NFmX5aSSk+mm40=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <507DD605E6DFC948B1B2CAB575B15BAD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Anr196Rq1nXKnY2ttclyyiAAlYwZkNQXzmoub262L2dpLUGtXDia0aHoKkXW7gTUdHGuLY5HaxEa5FnJK8wqUaDNZoiNJCiqKK21nPISILj3RWW4UySw7mK2IaVxeRpGpoVvTN39xCOpDYZkHnm7uWnzSEqK5FIh/RvtNuilm6QHakA20BvgkKO44nQcNuVR+fb+lw3NDGoL2kqiXr245GKTiO9usuwX6wfBPfnniB9yF29FR5oaovp0FxkE2qEbJKkG2ZbRyutJemz/vj1DO2QZWoNcqV9URllYOSrKdN30WlCBOshoH58j/tnwiLeBAYDbVouj4z2TeLP6t44b0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6679
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	690caf4f-331b-45bd-a379-08de96f89f8f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|14060799003|82310400026|35042699022|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ypNEHOu9H8tISBf6P/fwsqOHkxAhn/nWXRAUmcTRrBPAnSXNK94eJO02DP5tsG0BMuvHfUtghh+o8DEltmetNSIx0czmE71d8LNVopyYrLL9GwL2G+ne1Mns82ZNbqlL5aliXrjx3cUpq7thKtRNtMIt5IxbAX3OdB5IS/ztLPd8m8eAOIy8I9iJPasdz7aiwIw9pO9IPJCVoBegLO+3IP0aWeMPqvFjAVslqgFS+933WpoIGseV3xfv5yU3Q+gFdg+OHLxtgEuBBDGAf3xcRwfdv0I/RhGt1Dxr1tQBC8yACAn8qgyK+jl7DOVdJgewMLRwms/OJQRql427lvFBLfZgOAeBqDtAK+1mO7s/H99ah8KFv+lV7hnojvp/d19caVXozFP6ak/cHWjbwbDoswKjZb9fZXRs3gn/HHilu5WKJquNCEVwXtNj3MU+NT+ptP0fXtRiijolkK+9IhvRRgoyllpiMvihygOtctLChlp30cO2mRTW6ol8T1XDl1BPbMgga9n/E0rZV/+193VPnMz/xD04CjXEJX2fhoUeIENSR5dBVTUmgcbWmOPJ+R9yt7jN6fw/QVKiM2WYyX9GShGm+c/2A1cba649OTv27RH9/F+wVOm3qERaSNKSkmorbCqswK/Gi/azt5A5bQRSQnT5qUrTRNSZPar2zGpJm4VobpROwwQu6f4IvAchZb6L5xxPzJRdEVcYw+YSkr+rvpgnOIMeNTAu6kbxsD9QXHQo72Sx689cqcEzn0eHiXiIIfsY1O8H9y/EUOHZ4gRIqg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(14060799003)(82310400026)(35042699022)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B86L7PTgdiGOT9hssZqsNbWhobFUrFYQmkjZIhIIDTpwxff7ECFD1lARbTFQZTqmfLwgT3wPJYJftbx9WCsE4IM9LsP5oZUUMwN0Igb7Xp02sLupn4XtORfFQTW6ZwIYeRNr1kRdFyVn1RqDVDJ/NTklPt3uvbryF/NpHRhg2m1a4uBRHpuxYBybZdjTHQhmm12Eh6NCoMXYfP5LWQZMGd8lB/X8XezxzR9Pp4cSsXbdeFkiUtTEDr3rN+ugGjBwdyK1vhFDGpc5ecjkHsOhgpQces7Cd9OL+F4KxsB/Sn/XZsVSjunzAqknZjuG+ofxxTUlDxvsxVjmGFE2RhqBE6nn3apQVQdeb5/uNOSux6UxvorkOsd9aLXJDc2/zhiMsAXh4RMqkfoT65ipqUIpEFvaqyeUIbHm0jV7rvzwfdWBLnNsFe8h/bl7Ndezxy6n
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:00:34.0620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f2af65-180e-4717-ebe1-08de96f8c56e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7858
X-purgate-ID: tlsNG-d25034/1775822439-83945A3D-4EBB1E6E/0/0
X-purgate-type: clean
X-purgate-size: 4222
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 7E5213D67EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,


>=20
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrou=
gh/arm/viommu.c
> index 7ab6061e34..53ae46349a 100644
> --- a/xen/drivers/passthrough/arm/viommu.c
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -2,12 +2,42 @@
>=20
> #include <xen/errno.h>
> #include <xen/init.h>
> +#include <xen/irq.h>
> #include <xen/types.h>
>=20
> #include <asm/viommu.h>
>=20
> +/* List of all host IOMMUs */
> +LIST_HEAD(host_iommu_list);
> +
> const struct viommu_desc __read_mostly *cur_viommu;
>=20
> +/* Common function for adding to host_iommu_list */
> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                            const struct dt_device_node *node)
> +{
> +    struct host_iommu *iommu_data;
> +
> +    iommu_data =3D xzalloc(struct host_iommu);
> +    if ( !iommu_data )
> +        panic("vIOMMU: Cannot allocate memory for host IOMMU data\n");
> +
> +    iommu_data->addr =3D addr;
> +    iommu_data->size =3D size;
> +    iommu_data->dt_node =3D node;
> +    iommu_data->irq =3D platform_get_irq(node, 0);
> +    if ( iommu_data->irq < 0 )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                 "vIOMMU: Cannot find a valid IOMMU irq\n");

We need to free iommu_data here

> +        return;
> +    }
> +
> +    printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
> +
> +    list_add_tail(&iommu_data->entry, &host_iommu_list);
> +}
> +
> int domain_viommu_init(struct domain *d, uint16_t viommu_type)
> {
>     if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthr=
ough/arm/vsmmu-v3.c
> new file mode 100644
> index 0000000000..6b4009e5ef
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +
> +#include <xen/param.h>
> +#include <xen/sched.h>
> +#include <asm/mmio.h>
> +#include <asm/viommu.h>
> +
> +/* Struct to hold the vIOMMU ops and vIOMMU type */
> +extern const struct viommu_desc __read_mostly *cur_viommu;
> +
> +struct virt_smmu {
> +    struct      domain *d;
> +    struct      list_head viommu_list;
> +};
> +
> +static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                              register_t r, void *priv)
> +{
> +    return IO_HANDLED;
> +}
> +
> +static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                             register_t *r, void *priv)
> +{
> +    return IO_HANDLED;

If this has to be treated for now as RAZ, being a dummy implementation,
I would add *r =3D 0;

> +}
> +
> +static const struct mmio_handler_ops vsmmuv3_mmio_handler =3D {
> +    .read  =3D vsmmuv3_mmio_read,
> +    .write =3D vsmmuv3_mmio_write,
> +};
> +
> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t s=
ize)
> +{
> +    struct virt_smmu *smmu;
> +
> +    smmu =3D xzalloc(struct virt_smmu);
> +    if ( !smmu )
> +        return -ENOMEM;
> +
> +    smmu->d =3D d;
> +
> +    register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
> +
> +    /* Register the vIOMMU to be able to clean it up later. */
> +    list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
> +
> +    return 0;
> +}
> +
> +int domain_vsmmuv3_init(struct domain *d)
> +{
> +    int ret;
> +    INIT_LIST_HEAD(&d->arch.viommu_list);
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        struct host_iommu *hw_iommu;
> +
> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
> +        {
> +            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->siz=
e);
> +            if ( ret )
> +                return ret;
> +        }
> +    }
> +    else
> +    {
> +        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3=
_SIZE);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +int vsmmuv3_relinquish_resources(struct domain *d)
> +{
> +    struct virt_smmu *pos, *temp;
> +
> +    /* Cope with unitialized vIOMMU */

Typo s/unitialized/uninitialized/


Cheers,
Luca



